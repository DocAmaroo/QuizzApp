import 'package:flutter/material.dart';

class AppColors {
  // --- Main colors
  static get white => Colors.white;
  static get black => Colors.black;
  static get primaryColor => Colors.indigoAccent;
  static get secondaryColor => Colors.deepPurple;

  // --- Text colors
  static get textLight => white;
  static get textGrey => Colors.grey.shade300;
  static get textBlack => black;

  // --- Scaffold colors
  static get scaffoldBackgroundLight => Colors.grey.shade100;
  static get scaffoldBackgroundDark => Colors.grey.shade900;

  // --- Buttons
  static get buttonGreen => Colors.green;
  static get buttonRed => Colors.red;
}
