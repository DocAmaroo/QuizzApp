import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/bloc/quizz_bloc.dart';

import 'views/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beatbox quizz',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: BlocProvider<QuizzBloc>(
        create: (context) => QuizzBloc()..add(LoadQuizz()),
        child: const MyHomePage(title: 'Beatbox quizz'),
      ),
    );
  }
}
