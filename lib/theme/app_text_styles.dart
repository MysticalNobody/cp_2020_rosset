import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Сортировка идёт по размеру, весу, цвету
/// `fontFamily` нужно указывать всегда, т.к. тема иногда не подхватывает
class AppTextStyles {
  static const String fontFamily = 'Raleway';

  static const tinyRedW400 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.redStatus,
    fontFamily: fontFamily,
  );
  static const tinyW500 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static const smallSemiBlackW400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textGeneralHalf,
    fontFamily: fontFamily,
  );
  static const smallBlackW400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textGeneral,
    fontFamily: fontFamily,
  );
  static const smallBlueW400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.general,
    fontFamily: fontFamily,
  );
  static const smallGreyW400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
    fontFamily: fontFamily,
  );
  static const smallWhiteW400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.generalWhite,
    fontFamily: fontFamily,
  );
  static const smallGreyDarkW400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.greyDark,
    fontFamily: fontFamily,
  );
  static const smallBlueW500 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.general,
    fontFamily: fontFamily,
  );
  static const smallBlackW600 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textGeneral,
  );
  static const regularGreyW400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
    fontFamily: fontFamily,
  );
  static const regularGreyDarkW400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyDark,
    fontFamily: fontFamily,
  );
  static const regularRedW400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.redStatus,
    fontFamily: fontFamily,
  );
  static const regularBlueW400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.general,
    fontFamily: fontFamily,
  );
  static const regularBlackW400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textGeneral,
    fontFamily: fontFamily,
  );
  static const regularWhiteW400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.generalWhite,
    fontFamily: fontFamily,
  );
  static const regularSemiBlackW400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textGeneralHalf,
    fontFamily: fontFamily,
  );
  static const regularBlackW500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textGeneral,
    fontFamily: fontFamily,
  );
  static const regularGreyDarkW500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.greyDark,
    fontFamily: fontFamily,
  );
  static const regularBlueW500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.general,
    fontFamily: fontFamily,
  );
  static const regularGreyW500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
    fontFamily: fontFamily,
  );
  static const regularWhiteW500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.generalWhite,
    fontFamily: fontFamily,
  );
  static const regularBlackW600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textGeneral,
    fontFamily: fontFamily,
  );
  static const regularBlueW600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.general,
    fontFamily: fontFamily,
  );
  static const regularSemiBlackW600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textGeneralHalf,
    fontFamily: fontFamily,
  );
  static const regularGreyW600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.grey,
    fontFamily: fontFamily,
  );
  static const regularGreyDarkW600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.greyDark,
    fontFamily: fontFamily,
  );
  static const regularWhiteW600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.generalWhite,
    fontFamily: fontFamily,
  );
  static const regularWhiteBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.generalWhite,
    fontFamily: fontFamily,
  );
  static const bigBlackW500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textGeneral,
    fontFamily: fontFamily,
  );
  static const bigBlackW600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textGeneral,
    fontFamily: fontFamily,
  );
  static const largeGreyDarkW400 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.greyDark,
    fontFamily: fontFamily,
  );
  static const largeRedW500 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.redStatus,
    fontFamily: fontFamily,
  );
  static const largeBlackW600 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textGeneral,
    fontFamily: fontFamily,
  );
  static const largeBlueW600 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.general,
    fontFamily: fontFamily,
  );
  static const largeWhiteW700 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.generalWhite,
    fontFamily: fontFamily,
  );
  static const largeBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );
  static const appbarBlueW600 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: AppColors.general,
    fontFamily: fontFamily,
  );
}
