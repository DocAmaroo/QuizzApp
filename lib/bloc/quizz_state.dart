part of 'quizz_bloc.dart';

@immutable
abstract class QuizzState {}

class QuizzInitial extends QuizzState {}

class WaitingQuizzThemeState extends QuizzState {}

class LoadingQuizzState extends QuizzState {}

// Quizz information have been loaded
class LoadedQuizzState extends QuizzState {
  final int currIndex;
  LoadedQuizzState({required this.currIndex});
}

class LoadResultState extends QuizzState {
  final int nbAnswer;
  final int nbCorrectAnswer;
  final int nbIncorrectAnswer;
  final int nbPoints;

  LoadResultState(
      {required this.nbAnswer,
      required this.nbCorrectAnswer,
      required this.nbIncorrectAnswer,
      required this.nbPoints});
}

// Failed to load Quizz information
class FailedToLoadQuizzState extends QuizzState {
  final http_exception.HTTPException error;
  FailedToLoadQuizzState({required this.error});
}
