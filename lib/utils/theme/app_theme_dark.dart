import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizz/utils/app_colors.dart';

class AppDarkTheme {
  get darkIconTheme => IconThemeData(color: AppColors.white);

  get darkTheme => ThemeData(
      primaryColor: AppColors.secondaryColor,
      secondaryHeaderColor: AppColors.secondaryColor,
      primarySwatch: Colors.grey,
      appBarTheme: _darkAppBarTheme(),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: AppColors.secondaryColor),
        hintStyle: TextStyle(color: AppColors.textGrey),
        labelStyle: TextStyle(color: AppColors.textLightGrey),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor)),
      ),
      errorColor: AppColors.error,
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
