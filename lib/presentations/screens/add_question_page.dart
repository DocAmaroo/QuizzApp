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
  final _themeController = TextEditingController();

  String get questionText => _questionController.text;
  String get answerText => _answerController.text;
  String get imageURLText => _imageURLController.text;
  String get themeText => _themeController.text;

  @override
  Widget build(BuildContext context) {
    String currTheme = BlocProvider.of<QuizzBloc>(context).currTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une question')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(runSpacing: 12, children: <Widget>[
          TextField(
              style: const TextStyle(fontWeight: FontWeight.w400),
              controller: _questionController,
              decoration: const InputDecoration(
                  labelText: 'Question', hintText: 'Your wonderful question')),
          TextField(
              style: const TextStyle(fontWeight: FontWeight.w400),
              controller: _answerController,
              decoration: const InputDecoration(
                  labelText: 'Answer', hintText: 'true/false')),
          TextField(
              style: const TextStyle(fontWeight: FontWeight.w400),
              controller: _imageURLController,
              decoration: const InputDecoration(
                  labelText: 'Image URL (Optionnal)',
                  hintText: 'https://myimage.org')),
          TextField(
              style: const TextStyle(fontWeight: FontWeight.w400),
              controller: _themeController,
              decoration: InputDecoration(
                  labelText: 'Theme (Optionnal)',
                  hintText: 'default: $currTheme')),
          Center(
              child: ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    _quizzServices.addQuestion(
                        questionText,
                        answerText,
                        imageURLText,
                        themeText.isEmpty ? currTheme : themeText);
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
