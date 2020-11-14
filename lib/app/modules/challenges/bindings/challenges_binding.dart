import 'package:get/get.dart';

import 'package:rosset_client/app/modules/challenges/controllers/challenges_controller.dart';

class ChallengesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChallengesController>(
      () => ChallengesController(),
    );
  }
}
