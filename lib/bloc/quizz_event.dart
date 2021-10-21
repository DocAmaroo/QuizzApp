part of 'quizz_bloc.dart';

abstract class QuizzEvent {}

class WaitingQuizzThemeEvent extends QuizzEvent {}

class LoadQuizz extends QuizzEvent {
  final String theme;

  LoadQuizz({required this.theme});

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
