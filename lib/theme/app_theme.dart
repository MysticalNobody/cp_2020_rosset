import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get getTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: AppTextStyles.fontFamily,
      accentColor: AppColors.primary,
      backgroundColor: AppColors.background,
      buttonColor: AppColors.primary,
      primaryColor: AppColors.primary,
      errorColor: AppColors.redStatus,
      colorScheme: ColorScheme(
        background: AppColors.background,
        brightness: Brightness.light,
        surface: AppColors.white,
        error: AppColors.redStatus,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        primaryVariant: AppColors.primary,
        secondaryVariant: AppColors.secondary,
        onPrimary: AppColors.white,
        onSurface: AppColors.primary,
        onSecondary: AppColors.white,
        onError: AppColors.white,
        onBackground: AppColors.primary,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: AppColors.primary,
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline6: AppTextStyles.headLine4.copyWith(
            color: AppColors.white,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      buttonTheme: ButtonThemeData(
        height: 50,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        colorScheme: ColorScheme(
          primary: AppColors.primary,
          primaryVariant: AppColors.primary,
          secondary: AppColors.secondary,
          secondaryVariant: AppColors.secondary,
          surface: AppColors.white,
          background: AppColors.background,
          error: AppColors.redStatus,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: AppColors.primary,
          onBackground: AppColors.primary,
          onError: AppColors.white,
          brightness: Brightness.light,
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 16,
      ),
      inputDecorationTheme: InputDecorationTheme(
        /// Border for all inputs
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.grey, width: 0),
        ),
        focusColor: AppColors.secondary,
        fillColor: AppColors.background,
        errorStyle: AppTextStyles.secondary.apply(color: AppColors.redStatus),
      ),
      textTheme: const TextTheme(
        button: AppTextStyles.button,

        /// Text Input style
        subtitle1: AppTextStyles.subtitle,

        /// Drawer ListTile text
        bodyText1: AppTextStyles.text,
        bodyText2: AppTextStyles.secondary,
        headline1: AppTextStyles.headLine1,
        headline2: AppTextStyles.headLine2,
        headline3: AppTextStyles.headLine3,
        headline4: AppTextStyles.headLine4,
      ),
    );
  }
}
