import 'package:get/get.dart';
import 'package:rosset_client/app/modules/test_results/controllers/test_result_controller.dart';

class TestResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestResultController>(
      () => TestResultController(),
    );
  }
}
