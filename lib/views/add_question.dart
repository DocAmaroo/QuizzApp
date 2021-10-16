import 'package:flutter/material.dart';
import 'package:quizz/services/quizz_services.dart';
import 'package:quizz/widgets/custom_app_bar.dart';

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
    return Scaffold(
      appBar: const MyAppBar(title: 'Add question'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(runSpacing: 12, children: <Widget>[
          TextField(
              style: const TextStyle(fontWeight: FontWeight.w400),
              controller: _questionController,
              cursorColor: Colors.black45,
              decoration: const InputDecoration(
                labelText: 'Question',
                floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                hintText: 'Do you love me ?',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
              )),
          TextField(
              style: const TextStyle(fontWeight: FontWeight.w400),
              controller: _answerController,
              cursorColor: Colors.black45,
              decoration: const InputDecoration(
                labelText: 'Answer',
                floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                hintText: 'true/false',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
              )),
          TextField(
              style: const TextStyle(fontWeight: FontWeight.w400),
              controller: _imageURLController,
              cursorColor: Colors.black45,
              decoration: const InputDecoration(
                labelText: 'Image URL',
                floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                hintText: 'https://myimage.org',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
              )),
          Center(
            child: ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  _quizzServices.addQuestion(
                      questionText, answerText, imageURLText);
                  Navigator.pop(context);
                }),
          ),
        ]),
      ),
    );
  }
}
