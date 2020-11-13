import 'package:get/get.dart';

import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';

class WorkspaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkspaceController>(
      () => WorkspaceController(),
    );
  }
}
