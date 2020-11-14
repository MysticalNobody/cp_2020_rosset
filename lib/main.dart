import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/api/api.dart';
import 'app/data/repository/user_repository.dart';
import 'app/routes/app_pages.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  await Get.putAsync(() => UserRepository().init());
  AppApi.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.getTheme,
      builder: (ctx, _) => FeatureDiscovery(
        child: _,
      ),
    ),
  );
}
