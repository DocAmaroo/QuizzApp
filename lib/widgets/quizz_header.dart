import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:quizz/bloc/quizz_bloc.dart';

class QuizzHeader extends StatelessWidget {
  const QuizzHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int nbQuestions =
        context.select((QuizzBloc bloc) => bloc.questionsLength);

    final int currentQuestionIndex =
        context.select((QuizzBloc bloc) => bloc.currentQuestionIndex);

    final int currentPoints =
        context.select((QuizzBloc bloc) => bloc.getNbPoints);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        Text('${currentQuestionIndex + 1}/$nbQuestions',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        const SizedBox(width: 12),
        const Text('Question',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
        const Spacer(),
        Text('$currentPoints',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        const SizedBox(width: 12),
        const Text('Points',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
      ]),
    );
  }
}
