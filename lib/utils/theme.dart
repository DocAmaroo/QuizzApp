import 'package:flutter/material.dart';

class ThemeModel with ChangeNotifier {
  ThemeMode? mode;
  IconData? icon;
  ThemeModel({this.mode = ThemeMode.light, this.icon = Icons.lightbulb});

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
    icon = icon == Icons.lightbulb ? Icons.lightbulb_outline : Icons.lightbulb;
    notifyListeners();
  }
}
