import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quizz/bloc/quizz_bloc.dart';
import 'package:quizz/utils/theme/app_theme.dart';

import 'views/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppTheme>(
        create: (_) => AppTheme(),
        child: Consumer<AppTheme>(builder: (_, theme, __) {
          // Handle default theme mode
          var window = WidgetsBinding.instance!.window;
          window.onPlatformBrightnessChanged = () {
            Brightness brightness = window.platformBrightness;
            if (Brightness.light == brightness) {
              theme.toLight();
            } else {
              theme.toDark();
            }
          };

          return MaterialApp(
            title: 'Beatbox quizz',
            theme: theme.lightTheme,
            darkTheme: theme.darkTheme,
            themeMode: theme.mode,
            home: BlocProvider<QuizzBloc>(
              create: (context) => QuizzBloc()..add(LoadQuizz()),
              child: MyHomePage(title: 'Beatbox quizz', theme: theme),
            ),
          );
        }));
  }
}
