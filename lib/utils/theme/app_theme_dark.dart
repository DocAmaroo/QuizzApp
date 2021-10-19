import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizz/utils/app_colors.dart';

class AppDarkTheme {
  get darkIconTheme => IconThemeData(color: AppColors.white);

  get darkTheme => ThemeData(
      primaryColor: AppColors.primaryColor,
      secondaryHeaderColor: AppColors.secondaryColor,
      primarySwatch: Colors.grey,
      appBarTheme: _darkAppBarTheme(),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: AppColors.textGrey),
        labelStyle: TextStyle(color: AppColors.textBlack),
      ),
      brightness: Brightness.dark,
      iconTheme: darkIconTheme,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark);

  AppBarTheme _darkAppBarTheme() {
    return AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.secondaryColor,
        actionsIconTheme: darkIconTheme,
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textLight));
  }
}
