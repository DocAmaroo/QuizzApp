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
      textTheme: TextTheme(
          bodyText1: const TextStyle(fontSize: 12),
          bodyText2: const TextStyle(fontSize: 11),
          headline1: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          headline2: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          headline3: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          headline4: const TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          headline5: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          headline6: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          subtitle1: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic),
          subtitle2: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w100,
              fontStyle: FontStyle.italic),
          caption: const TextStyle(fontSize: 11, fontWeight: FontWeight.w200),
          button: TextStyle(
              color: AppColors.textLight,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
      errorColor: AppColors.error,
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
