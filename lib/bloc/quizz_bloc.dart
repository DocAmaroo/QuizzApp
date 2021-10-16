import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quizz/data/models/question.dart';

import 'package:quizz/errors/http_exception.dart' as http_exception;
import 'package:quizz/services/quizz_services.dart';

part 'quizz_event.dart';
part 'quizz_state.dart';

class QuizzBloc extends Bloc<QuizzEvent, QuizzState> {
  final quizzServices = QuizzServices();

  late List<QuestionModel> questions;
  int nbPoints = 0;
  int correct = 0;
  int incorrect = 0;
  int currentQuestionIndex = 0;

  int get questionsLength => questions.length;

  QuestionModel get currentQuestion => questions[currentQuestionIndex];

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

    nbPoints = 0;
    correct = 0;
    incorrect = 0;

    try {
      questions = await quizzServices.getQuestions();
      if (questions.isNotEmpty) {
        currentQuestionIndex = 0;
        emit(
            LoadedQuizzState(currentQuestion: questions[currentQuestionIndex]));
      } else {
        emit(LoadResultState());
      }
    } on http_exception.HTTPException catch (e) {
      emit(FailedToLoadQuizzState(error: e));
    }
  }

  void _onNext(NextQuestion event, Emitter<QuizzState> emit) {
    if (questions[currentQuestionIndex].answer == event.answer) {
      correct++;
      nbPoints += 20;
    } else {
      incorrect++;
      nbPoints -= 5;
    }

    if (questions.length <= currentQuestionIndex + 1) {
      add(QuizzEnd());
    } else {
      currentQuestionIndex++;
      emit(LoadedQuizzState(currentQuestion: questions[currentQuestionIndex]));
    }
  }

  void _onEnd(QuizzEnd event, Emitter<QuizzState> emit) {
    emit(LoadResultState());
  }

  void _onRestart(QuizzRestart event, Emitter<QuizzState> emit) {
    add(LoadQuizz());
  }
}
