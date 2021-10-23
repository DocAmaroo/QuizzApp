import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:quizz/bloc/quizz_bloc.dart';
import 'package:quizz/utils/app_colors.dart';

class ResultPage extends StatelessWidget {
  final int nbAnswer;
  final int nbCorrectAnswer;
  final int nbIncorrectAnswer;
  final int nbPoints;

  const ResultPage(
      {Key? key,
      required this.nbAnswer,
      required this.nbCorrectAnswer,
      required this.nbIncorrectAnswer,
      required this.nbPoints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          // Main score
          Text('Votre score est de $nbPoints / ${nbAnswer * 20}',
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          // Correct and incorrect counter
          Text('$nbCorrectAnswer correcte | $nbIncorrectAnswer incorrecte',
              style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 32),
          ElevatedButton(
              onPressed: () => context.read<QuizzBloc>().add(QuizzRestart()),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: AppColors.textLight),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                  child: Text("Replay Quizz",
                      style: Theme.of(context).textTheme.button)))
          // Restart button
        ]));
  }
}
