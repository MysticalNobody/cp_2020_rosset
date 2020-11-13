import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/api/api.dart';
import 'app/routes/app_pages.dart';
import 'theme/app_theme.dart';

void main() {
  AppApi.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.getTheme,
    ),
  );
}
