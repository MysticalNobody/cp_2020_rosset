import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool showInstruments = true.obs;

  void toggleInstruments() {
    showInstruments.value = !showInstruments.value;
  }

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}
}
