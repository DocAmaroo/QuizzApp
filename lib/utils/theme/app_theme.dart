import 'package:flutter/material.dart';
import 'package:quizz/utils/theme/app_theme_light.dart';
import 'package:quizz/utils/theme/app_theme_dark.dart';

class AppTheme with ChangeNotifier {
  ThemeMode? mode;
  IconData? icon;
  AppTheme({this.mode = ThemeMode.light, this.icon = Icons.lightbulb});

  void toLight() {
    mode = ThemeMode.light;
    icon = Icons.lightbulb;
    notifyListeners();
  }

  void toDark() {
    mode = ThemeMode.dark;
    icon = Icons.lightbulb_outline;
    notifyListeners();
  }

  void toggleMode() {
    mode = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    toggleIcon();
    notifyListeners();
  }

  void toggleIcon() {
    icon = icon == Icons.lightbulb ? Icons.lightbulb_outline : Icons.lightbulb;
  }

  get lightTheme => AppLightTheme().lightTheme;

  get darkTheme => AppDarkTheme().darkTheme;
}
