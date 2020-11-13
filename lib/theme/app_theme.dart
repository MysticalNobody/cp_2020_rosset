import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get getTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: AppTextStyles.fontFamily,

      /// AppBarTheme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: AppColors.generalWhite,
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.general),
      ),

      /// Background color
      canvasColor: AppColors.generalWhite,

      /// Override above to use only on Buttons
      buttonTheme: ButtonThemeData(
        height: 50,
        textTheme: ButtonTextTheme.normal,

        /// unused
        disabledColor: AppColors.generalWhite,
        focusColor: AppColors.generalWhite,
        highlightColor: AppColors.generalWhite.withOpacity(.0),
        buttonColor: AppColors.generalWhite,
        splashColor: AppColors.general.withOpacity(.25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        colorScheme: const ColorScheme(
          /// Buttons fill color
          primary: AppColors.general,
          primaryVariant: Colors.red,

          /// ???
          secondary: AppColors.greenStatus,
          secondaryVariant: Colors.red,
          surface: Colors.red,
          background: Colors.red,
          error: Colors.red,
          onPrimary: Colors.red,
          onSecondary: Colors.red,

          /// Disabled button
          onSurface: AppColors.grey,
          onBackground: Colors.red,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
        // buttonColor: AppColors.mainGreen,
      ),

      /// Text Form Field Theme
      inputDecorationTheme: InputDecorationTheme(
        /// Border for all inputs
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey),
        ),

        focusColor: AppColors.general,
        fillColor: AppColors.fillColor,

        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        /// Disable standard error text
        // errorStyle: const TextStyle(fontSize: 0),

        /// Disable jumping when there is (not) an error
        // helperStyle: const TextStyle(fontSize: 0),
      ),
      textTheme: const TextTheme(

          /// Text Input style
          ),

      /// Overscroll glow
      accentColor: AppColors.general,

      /// Input Text Field highlight
      primaryColor: AppColors.general,
      applyElevationOverlayColor: true,
      disabledColor: AppColors.grey,

      /// Dropdown selected item color
      focusColor: AppColors.general.withOpacity(.05),
      hoverColor: AppColors.general.withOpacity(.05),

      /// Dropdown on item selected color
      highlightColor: AppColors.general.withOpacity(.1),

      /// TabBarTheme
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.textGeneral,
        indicator: BoxDecoration(
          color: AppColors.generalWhite,
          border: Border(bottom: BorderSide(color: AppColors.general)),
        ),
        unselectedLabelColor: AppColors.greyDark,
      ),
    );
  }
}
