import 'package:get/get.dart';

import 'package:rosset_client/app/modules/auth/controllers/auth_controller.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
