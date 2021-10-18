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
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        const SizedBox(width: 12),
        const Text('Question',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
        const Spacer(),
        Text('$currPoints',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        const SizedBox(width: 12),
        const Text('Points',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
      ]),
    );
  }
}
