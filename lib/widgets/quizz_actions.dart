import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:quizz/bloc/quizz_bloc.dart';

class QuizzActions extends StatelessWidget {
  final bool answer;

  const QuizzActions({Key? key, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(children: <Widget>[
          _getTrueButton(context),
          const SizedBox(width: 20),
          _getFalseButton(context),
        ]));
  }

  Expanded _getTrueButton(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () => _answer(context, true),
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const Text('True',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[Colors.green, Colors.lightGreen])))));
  }

  Expanded _getFalseButton(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () => _answer(context, false),
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const Text('False',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Colors.pink,
                          Colors.deepOrangeAccent
                        ])))));
  }

  void _answer(BuildContext context, bool userAnswer) {
    context.read<QuizzBloc>().add(NextQuestion(isTrue: (answer == userAnswer)));
  }
}
