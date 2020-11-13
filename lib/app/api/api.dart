import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'tests.dart';

class AppApi {
  static Future<void> init() async {
    final Dio dio = Dio();
    Get.put(dio);
    Get.put(TestsApi(dio));
  }
}
