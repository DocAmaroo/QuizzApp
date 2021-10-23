part of 'quizz_bloc.dart';

abstract class QuizzEvent {}

class WaitingQuizzThemeEvent extends QuizzEvent {}

class LoadQuizz extends QuizzEvent {
  final String themeId;

  LoadQuizz({required this.themeId});

  @override
  String toString() => '[EVENT] Load quizz data';
}

class NextQuestion extends QuizzEvent {
  final bool isTrue;

  NextQuestion({required this.isTrue});

  @override
  String toString() => '[EVENT] Next question';
}

class QuizzEnd extends QuizzEvent {
  @override
  String toString() => '[EVENT] End quizz';
}

class QuizzRestart extends QuizzEvent {
  @override
  String toString() => '[EVENT] Reset quizz';
}
