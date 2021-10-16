import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/bloc/quizz_bloc.dart';
import 'package:quizz/data/models/question.dart';
import 'package:quizz/views/add_question.dart';
import 'package:quizz/views/result.dart';
import 'package:quizz/widgets/quizz_actions.dart';
import 'package:quizz/widgets/quizz_body.dart';
import 'package:quizz/widgets/quizz_header.dart';

import '../widgets/custom_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          )
        ]),
        body: Center(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: <Widget>[
                  BlocBuilder<QuizzBloc, QuizzState>(
                      builder: (context, state) => _blocBuilder(context, state))
                ]))));
  }

  Widget _blocBuilder(BuildContext context, QuizzState state) {
    if (state is LoadingQuizzState) {
      return const Center(
          child: CircularProgressIndicator(color: Colors.black));
    } else if (state is LoadedQuizzState) {
      return _loadedContent(context, state);
    } else if (state is FailedToLoadQuizzState) {
      return Text('Error occured: ${state.error.message}');
    } else if (state is LoadResultState) {
      return const QuizzResult();
    } else {
      return const Center(
        child: Text('No statement, try to reload the app',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontStyle: FontStyle.italic)),
      );
    }
  }

  Wrap _loadedContent(BuildContext context, QuizzState state) {
    final QuestionModel question =
        context.select((QuizzBloc bloc) => bloc.currentQuestion);

    return Wrap(runSpacing: 20, children: [
      const QuizzHeader(),
      QuizzBody(questionModel: question),
      const QuizzActions()
    ]);
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
