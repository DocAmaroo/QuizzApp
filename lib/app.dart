import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quizz/bloc/quizz_bloc.dart';
import 'package:quizz/presentations/screens/add_question_page.dart';
import 'package:quizz/presentations/screens/home_page.dart';
import 'package:quizz/presentations/screens/quizz_page.dart';
import 'package:quizz/presentations/screens/result_page.dart';
import 'package:quizz/utils/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppTheme>(
        create: (_) => AppTheme(),
        child: Consumer<AppTheme>(builder: (_, theme, __) {
          // Handle default user phone theme mode
          _handleDefaultUserTheme(theme);

          return BlocProvider(
            create: (context) => QuizzBloc()..add(WaitingQuizzThemeEvent()),
            child: MaterialApp(
              title: 'Quizz',
              theme: theme.lightTheme,
              darkTheme: theme.darkTheme,
              themeMode: theme.mode,
              routes: {
                '/': (context) => HomePage(title: 'Menu', theme: theme),
                '/quizz': (context) => QuizzPage(theme: theme),
                '/addQuestion': (context) => const AddQuestion()
              },
            ),
          );
        }));
  }

  void _handleDefaultUserTheme(AppTheme theme) {
    var window = WidgetsBinding.instance!.window;
    window.onPlatformBrightnessChanged = () {
      Brightness brightness = window.platformBrightness;
      if (Brightness.light == brightness) {
        theme.toLight();
      } else {
        theme.toDark();
      }
    };
  }
}
