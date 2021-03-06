import 'package:rosset_client/app/modules/challenges/views/challenges_view.dart';
import 'package:rosset_client/app/modules/challenges/bindings/challenges_binding.dart';
import 'package:rosset_client/app/modules/test_results/bindings/test_result_binding.dart';
import 'package:rosset_client/app/modules/test_results/views/test_result_view.dart';
import 'package:rosset_client/app/modules/auth/views/auth_view.dart';
import 'package:rosset_client/app/modules/auth/bindings/auth_binding.dart';
import 'package:rosset_client/app/modules/home/views/home_view.dart';
import 'package:rosset_client/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/tests/bindings/tests_binding.dart';
import 'package:rosset_client/app/modules/tests/views/tests_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.TESTS,
      page: () => TestsView(),
      binding: TestsBinding(),
    ),
    GetPage(
      name: Routes.TEST_RESULT,
      page: () => TestResultView(),
      binding: TestResultBinding(),
    ),
    GetPage(
      name: Routes.CHALLENGES, 
      page:()=> ChallengesView(), 
      binding: ChallengesBinding(),
    ),
  ];
}