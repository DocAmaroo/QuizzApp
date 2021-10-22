import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:quizz/bloc/quizz_bloc.dart';
import 'package:quizz/utils/app_colors.dart';

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
        child: ElevatedButton(
            onPressed: () => _answer(context, true),
            style: ElevatedButton.styleFrom(
                primary: AppColors.buttonGreen, onPrimary: AppColors.textLight),
            child: Text('Vrai', style: Theme.of(context).textTheme.button)));
  }

  Expanded _getFalseButton(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () => _answer(context, false),
            style: ElevatedButton.styleFrom(
                primary: AppColors.buttonRed, onPrimary: AppColors.textLight),
            child: Text('Faux', style: Theme.of(context).textTheme.button)));
  }

  void _answer(BuildContext context, bool userAnswer) {
    context.read<QuizzBloc>().add(NextQuestion(isTrue: (answer == userAnswer)));
  }
}
