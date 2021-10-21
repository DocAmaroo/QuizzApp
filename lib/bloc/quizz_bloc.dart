import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:quizz/errors/http_exception.dart' as http_exception;

part 'quizz_event.dart';
part 'quizz_state.dart';

class QuizzBloc extends Bloc<QuizzEvent, QuizzState> {
  String currTheme = '';
  int nbPoints = 0;
  int correct = 0;
  int incorrect = 0;
  int currIndex = 0;

  String get getTheme => currTheme;
  int get getNbPoints => nbPoints;
  int get getNbCorrect => correct;
  int get getNbIncorrect => incorrect;

  QuizzBloc() : super(QuizzInitial()) {
    on<LoadQuizz>(_loadQuizz);
    on<NextQuestion>(_onNext);
    on<QuizzEnd>(_onEnd);
    on<QuizzRestart>(_onRestart);
  }

  void _loadQuizz(LoadQuizz event, Emitter<QuizzState> emit) async {
    emit(LoadingQuizzState());
    currTheme = event.theme;
    currIndex = 0;
    nbPoints = 0;
    correct = 0;
    incorrect = 0;

    emit(LoadedQuizzState(currIndex: currIndex));
  }

  void _onNext(NextQuestion event, Emitter<QuizzState> emit) {
    if (event.isTrue) {
      correct++;
      nbPoints += 20;
    } else {
      incorrect++;
      nbPoints -= 5;
    }

    currIndex++;
    emit(LoadedQuizzState(currIndex: currIndex));
  }

  void _onEnd(QuizzEnd event, Emitter<QuizzState> emit) {
    emit(LoadResultState(
        nbAnswer: currIndex,
        nbCorrectAnswer: correct,
        nbIncorrectAnswer: incorrect,
        nbPoints: nbPoints));
  }

  void _onRestart(QuizzRestart event, Emitter<QuizzState> emit) {
    add(LoadQuizz(theme: currTheme));
  }
}
