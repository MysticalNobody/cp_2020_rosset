import 'package:get/get.dart';

class TestsController extends GetxController {
  RxBool showInstruments = true.obs;

  void exitTest() {
    Get.back();
  }

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}
}
