import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:quizz/bloc/quizz_bloc.dart';

class QuizzHeader extends StatelessWidget {
  final int nbQuestion;
  final int currIndex;

  const QuizzHeader(
      {Key? key, required this.nbQuestion, required this.currIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currPoints = context.select((QuizzBloc bloc) => bloc.getNbPoints);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        Text('${currIndex + 1}/$nbQuestion',
            style: Theme.of(context).textTheme.headline4),
        const SizedBox(width: 12),
        Text('Question', style: Theme.of(context).textTheme.headline6),
        const Spacer(),
        Text('$currPoints', style: Theme.of(context).textTheme.headline4),
        const SizedBox(width: 12),
        Text('Points', style: Theme.of(context).textTheme.headline6),
      ]),
    );
  }
}
