import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Сортировка идёт по размеру, весу, цвету
/// `fontFamily` нужно указывать всегда, т.к. тема иногда не подхватывает
class AppTextStyles {
  static const String fontFamily = 'IBMPlexSans';

  static const headLine1 = TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: fontFamily,
    height: 1.27,
  );
  static const headLine2 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: fontFamily,
    height: 1.29,
  );
  static const headLine3 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: fontFamily,
    height: 1.35,
  );
  static const headLine4 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: fontFamily,
    height: 1.42,
  );
  static const subtitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: fontFamily,
    height: 1.27,
  );
  static const text = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.text,
    fontFamily: fontFamily,
    height: 1.55,
  );
  static const secondary = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: AppColors.text,
    fontFamily: fontFamily,
    height: 1.6,
  );
  static const button = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: fontFamily,
    height: 1.3,
  );

  static const mediumLabel = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.normal,
    color: AppColors.text,
    fontFamily: fontFamily,
    height: 1.05,
  );
}
