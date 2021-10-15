import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:quizz/bloc/quizz_bloc.dart';

class QuizzResult extends StatelessWidget {
  const QuizzResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int questionsLength =
        context.select((QuizzBloc bloc) => bloc.questionsLength);
    final int score = context.select((QuizzBloc bloc) => bloc.nbPoints);
    final int correct = context.select((QuizzBloc bloc) => bloc.getNbCorrect);
    final int incorrect =
        context.select((QuizzBloc bloc) => bloc.getNbIncorrect);

    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          // Main score
          Text('Votre score est de $score / ${questionsLength * 20}',
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          // Correct and incorrect counter
          Text('$correct correcte | $incorrect incorrecte',
              style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 32),
          // Restart button
          GestureDetector(
              onTap: () {
                context.read<QuizzBloc>().add(QuizzRestart());
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                  child: const Text("Replay Quizz",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[Colors.deepPurple, Colors.indigo])))),
        ]));
  }
}
