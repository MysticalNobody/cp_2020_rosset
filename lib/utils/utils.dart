import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

enum SnackbarType { error, success, primary }

extension DateTimeExtension on DateTime {
  DateTime applyTimeOfDay(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}

class Utils {
  static void showSnackbar(String title, String message, {SnackbarType type = SnackbarType.primary}) {
    Color bgColor;
    final Color textColor = AppColors.text;
    switch (type) {
      case SnackbarType.error:
        bgColor = AppColors.redStatus;
        break;
      case SnackbarType.primary:
        bgColor = AppColors.general;
        break;
      case SnackbarType.success:
        bgColor = AppColors.greenStatus;
        break;
      default:
        bgColor = AppColors.general;
        break;
    }
    Get.snackbar(
      title,
      message,
      backgroundColor: bgColor,
      colorText: textColor,
      maxWidth: 500,
      margin: EdgeInsets.only(top: 12),
    );
  }

  static getNoun(int number, String one, String two, String five) {
    number = number.abs();
    number %= 100;
    if (number >= 5 && number <= 20) {
      return five;
    }
    number %= 10;
    if (number == 1) {
      return one;
    }
    if (number >= 2 && number <= 4) {
      return two;
    }
    return five;
  }
}
