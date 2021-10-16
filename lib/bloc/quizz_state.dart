part of 'quizz_bloc.dart';

@immutable
abstract class QuizzState {}

class QuizzInitial extends QuizzState {}

class LoadingQuizzState extends QuizzState {}

// Quizz information have been loaded
class LoadedQuizzState extends QuizzState {
  final QuestionModel currentQuestion;
  LoadedQuizzState({required this.currentQuestion});
}

class LoadResultState extends QuizzState {}

// Failed to load Quizz information
class FailedToLoadQuizzState extends QuizzState {
  final http_exception.HTTPException error;
  FailedToLoadQuizzState({required this.error});
}
