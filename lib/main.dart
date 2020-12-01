import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/api/api.dart';
import 'app/routes/app_pages.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  await AppApi.init();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Павел Анатольевич",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.getTheme,
      debugShowCheckedModeBanner: false,
      builder: (ctx, _) => FeatureDiscovery(child: _),
    ),
  );
}
