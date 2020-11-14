import 'package:get/get.dart';
import 'package:rosset_client/app/data/repository/quest_repository.dart';

import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<WorkspaceController>(
      () => WorkspaceController(),
    );
    Get.lazyPut<QuestRepository>(
      () => QuestRepository().init(),
    );
  }
}
