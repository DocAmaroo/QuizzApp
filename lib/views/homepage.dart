import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/utils/theme.dart';
import 'package:quizz/bloc/quizz_bloc.dart';
import 'package:quizz/data/models/question.dart';
import 'package:quizz/services/quizz_services.dart';
import 'package:quizz/views/add_question.dart';
import 'package:quizz/views/result.dart';
import 'package:quizz/widgets/quizz_actions.dart';
import 'package:quizz/widgets/quizz_body.dart';
import 'package:quizz/widgets/quizz_header.dart';

import '../widgets/custom_app_bar.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final ThemeModel? theme;

  const MyHomePage({Key? key, required this.title, this.theme})
      : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _quizzServices = QuizzServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: widget.title, actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add new question',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddQuestion()));
            },
          ),
          if (widget.theme != null) _switchLightMode()
        ]),
        body: Center(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: <Widget>[
                  BlocBuilder<QuizzBloc, QuizzState>(
                      builder: (context, state) => _blocBuilder(context, state))
                ]))));
  }

  // Handle Bloc State
  Widget _blocBuilder(BuildContext context, QuizzState state) {
    if (state is LoadingQuizzState) {
      return const Center(
          child: CircularProgressIndicator(color: Colors.black));
    } else if (state is LoadedQuizzState) {
      return _loadedContent(context, state);
    } else if (state is FailedToLoadQuizzState) {
      return Text('Error occured: ${state.error.message}');
    } else if (state is LoadResultState) {
      return QuizzResult(
          nbAnswer: state.nbAnswer,
          nbCorrectAnswer: state.nbCorrectAnswer,
          nbIncorrectAnswer: state.nbIncorrectAnswer,
          nbPoints: state.nbPoints);
    } else {
      return const Center(
        child: Text('No statement, try to reload the app',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontStyle: FontStyle.italic)),
      );
    }
  }

  // Load the content to display with firebase
  FutureBuilder _loadedContent(BuildContext context, LoadedQuizzState state) {
    return FutureBuilder<QuerySnapshot>(
        future: _quizzServices.getQuestions(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Unable to fetch data!');
          }

          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.docs;
            List<QuestionModel> questions = data
                .map((e) => QuestionModel.fromQueryDocumentSnapshot(e))
                .toList();

            if (state.currIndex < questions.length) {
              QuestionModel currQuestion = questions[state.currIndex];

              return Wrap(runSpacing: 20, children: [
                QuizzHeader(
                    nbQuestion: questions.length, currIndex: state.currIndex),
                QuizzBody(questionModel: currQuestion),
                QuizzActions(answer: currQuestion.getAnswer)
              ]);
            } else {
              BlocProvider.of<QuizzBloc>(context).add(QuizzEnd());
            }
          }

          return const Center(
              child: CircularProgressIndicator(color: Colors.black));
        });
  }

  IconButton _switchLightMode() {
    return IconButton(
      icon: Icon(widget.theme!.icon),
      tooltip: 'Light/Dark mode',
      onPressed: () {
        widget.theme!.toggleMode();
      },
    );
  }

  // Custom SnackBar
  SnackBar getSnackBar(bool isSuccess) {
    return SnackBar(
      content: isSuccess
          ? const Text('That\'s correct!')
          : const Text('That\'s incorrect!'),
      duration: const Duration(seconds: 2),
      backgroundColor: isSuccess ? Colors.lightGreen : Colors.redAccent,
    );
  }
}
