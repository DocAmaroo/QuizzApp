import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizz/utils/app_colors.dart';

class AppLightTheme {
  get ligthIconTheme => IconThemeData(color: AppColors.white);

  get lightTheme => ThemeData(
      primaryColor: AppColors.primaryColor,
      secondaryHeaderColor: AppColors.secondaryColor,
      primarySwatch: Colors.grey,
      appBarTheme: _lightAppBarTheme(),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: AppColors.textGrey),
        labelStyle: TextStyle(color: AppColors.textBlack),
      ),
      brightness: Brightness.light,
      iconTheme: ligthIconTheme,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight);

  AppBarTheme _lightAppBarTheme() {
    return AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: AppColors.primaryColor,
        actionsIconTheme: ligthIconTheme,
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textLight));
  }
}
