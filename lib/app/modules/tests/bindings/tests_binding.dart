import 'package:get/get.dart';
import 'package:rosset_client/app/modules/tests/controllers/tests_controller.dart';

class TestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestsController>(
      () => TestsController(),
    );
  }
}
