import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/api/api.dart';
import 'app/routes/app_pages.dart';
import 'theme/app_theme.dart';

void main() {
  print(int.parse('01:0C:CD:01:00:01'.replaceAll(':', ''), radix: 16));
  print(int.parse('01:0C:CD:01:01:FF'.replaceAll(':', ''), radix: 16));
  print(int.parse('8000'.replaceAll(':', ''), radix: 16));
  print(int.parse('BFFF'.replaceAll(':', ''), radix: 16));
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
