import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:quizz/utils/app_colors.dart';

class AppDarkTheme {
  get darkIconTheme => IconThemeData(color: AppColors.white);

  get darkTheme => ThemeData(
      primaryColor: AppColors.secondaryColor,
      secondaryHeaderColor: AppColors.secondaryColor,
      primarySwatch: Colors.grey,
      appBarTheme: _darkAppBarTheme(),
      textTheme: TextTheme(
          bodyText1: const TextStyle(fontSize: 12),
          bodyText2: const TextStyle(fontSize: 11),
          headline1: TextStyle(
              color: AppColors.textLight,
              fontSize: 36,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: AppColors.textLight,
              fontSize: 32,
              fontWeight: FontWeight.w700),
          headline3: TextStyle(
              color: AppColors.textLight,
              fontSize: 28,
              fontWeight: FontWeight.w500),
          headline4: TextStyle(
              color: AppColors.textLightGrey,
              fontSize: 24,
              fontWeight: FontWeight.w400),
          headline5: TextStyle(
              color: AppColors.textLightGrey,
              fontSize: 20,
              fontWeight: FontWeight.w300),
          headline6: TextStyle(
              color: AppColors.textLightGrey,
              fontSize: 16,
              fontWeight: FontWeight.w300),
          subtitle1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          subtitle2: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w100,
              fontStyle: FontStyle.italic),
          caption: const TextStyle(fontSize: 11, fontWeight: FontWeight.w200),
          button: TextStyle(
              color: AppColors.textLight,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
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
