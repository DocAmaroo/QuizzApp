import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/bloc/quizz_bloc.dart';
import 'package:quizz/data/services/quizz_services.dart';
import 'package:quizz/utils/app_colors.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final QuizzServices _quizzServices = QuizzServices();

  final _questionController = TextEditingController();
  final _answerController = TextEditingController();
  final _imageURLController = TextEditingController();

  String get questionText => _questionController.text;
  String get answerText => _answerController.text;
  String get imageURLText => _imageURLController.text;

  @override
  Widget build(BuildContext context) {
    String currTheme = BlocProvider.of<QuizzBloc>(context).currThemeId;

    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une question')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(runSpacing: 12, children: <Widget>[
          TextField(
              style: Theme.of(context).textTheme.headline6,
              controller: _questionController,
              decoration: const InputDecoration(
                  labelText: 'Question', hintText: 'Votre question')),
          TextField(
              style: Theme.of(context).textTheme.headline6,
              controller: _answerController,
              decoration: const InputDecoration(
                  labelText: 'Réponse', hintText: 'true/false')),
          TextField(
              style: Theme.of(context).textTheme.headline6,
              controller: _imageURLController,
              decoration: const InputDecoration(
                  labelText: 'Image URL (Optionnelle)',
                  hintText: 'https://myimage.org')),
          Center(
              child: ElevatedButton(
                  child: const Text('Ajouter'),
                  onPressed: () {
                    _quizzServices.addQuestion(
                        questionText, answerText, imageURLText, currTheme);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      onPrimary: AppColors.textLight))),
        ]),
      ),
    );
  }
}
