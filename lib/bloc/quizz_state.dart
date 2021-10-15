part of 'quizz_bloc.dart';

@immutable
abstract class QuizzState {}

class QuizzInitial extends QuizzState {}

class LoadingQuizzState extends QuizzState {}

// Quizz information have been loaded
class LoadedQuizzState extends QuizzState {
  final QuestionModel question;
  LoadedQuizzState({required this.question});
}

class LoadResultState extends QuizzState {}

// Failed to load Quizz information
class FailedToLoadQuizzState extends QuizzState {
  final http_exception.HTTPException error;
  FailedToLoadQuizzState({required this.error});
}
