import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/utils/theme/app_theme.dart';
import 'package:quizz/bloc/quizz_bloc.dart';
import 'package:quizz/data/models/question.dart';
import 'package:quizz/services/quizz_services.dart';
import 'package:quizz/widgets/quizz_actions.dart';
import 'package:quizz/widgets/quizz_body.dart';
import 'package:quizz/widgets/quizz_header.dart';

class QuizzPage extends StatefulWidget {
  final String title;
  final AppTheme? theme;

  const QuizzPage({Key? key, required this.title, this.theme})
      : super(key: key);

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  final _questionCollection = QuizzServices().questionCollection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: _getAppBarActions()),
        body: Center(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: <Widget>[
                  BlocBuilder<QuizzBloc, QuizzState>(builder: (context, state) {
                    if (state is LoadingQuizzState) {
                      return Center(
                          child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColorDark));
                    } else if (state is LoadedQuizzState) {
                      return _loadQuizz(context, state);
                    } else if (state is FailedToLoadQuizzState) {
                      return Text('Error occured: ${state.error.message}');
                    } else if (state is LoadResultState) {
                      return const Text('ended');
                    } else {
                      return const Center(
                        child: Text('No statement, try to reload the app',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic)),
                      );
                    }
                  })
                ]))));
  }

  List<Widget> _getAppBarActions() {
    return [
      IconButton(
        icon: const Icon(Icons.add),
        tooltip: 'Add new question',
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const AddQuestion()));
        },
      ),
      if (widget.theme != null)
        IconButton(
            icon: Icon(widget.theme!.icon),
            tooltip: 'Light/Dark mode',
            onPressed: () {
              widget.theme!.toggleMode();
            })
    ];
  }

  // Load the content to display with firebase
  StreamBuilder _loadQuizz(BuildContext context, LoadedQuizzState state) {
    return StreamBuilder<QuerySnapshot>(
        stream: _questionCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Unable to fetch data!');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor));
          } else if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasData) {
            return const Text('No question available!');
          } else {
            // Transform into list of question model
            var data = snapshot.data!.docs;
            List<QuestionModel> questions = data
                .map((e) => QuestionModel.fromQueryDocumentSnapshot(e))
                .toList();

            // Check if the game end
            if (state.currIndex < questions.length) {
              QuestionModel currQuestion = questions[state.currIndex];

              return Wrap(runSpacing: 30, children: [
                QuizzHeader(
                    nbQuestion: questions.length, currIndex: state.currIndex),
                QuizzBody(questionModel: currQuestion),
                QuizzActions(answer: currQuestion.getAnswer)
              ]);
            } else {
              BlocProvider.of<QuizzBloc>(context).add(QuizzEnd());
            }
          }

          return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor));
        });
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
