import 'package:flutter/material.dart';
import 'package:quizz/data/services/quizz_services.dart';
import 'package:quizz/utils/app_colors.dart';

class AddTheme extends StatefulWidget {
  const AddTheme({Key? key}) : super(key: key);

  @override
  _AddThemeState createState() => _AddThemeState();
}

class _AddThemeState extends State<AddTheme> {
  final QuizzServices _quizzServices = QuizzServices();

  final _themeController = TextEditingController();
  final _descriptionController = TextEditingController();

  String get themeText => _themeController.text;
  String get descriptionText => _descriptionController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une question')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(runSpacing: 12, children: <Widget>[
          TextField(
              style: Theme.of(context).textTheme.headline6,
              controller: _themeController,
              decoration: const InputDecoration(
                  labelText: 'Theme', hintText: 'Titre du thème')),
          TextField(
              style: Theme.of(context).textTheme.headline6,
              controller: _descriptionController,
              decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Mon thème est incroyable!')),
          Center(
              child: ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    _quizzServices.addTheme(themeText, descriptionText);
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
