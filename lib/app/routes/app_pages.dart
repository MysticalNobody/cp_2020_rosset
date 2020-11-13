import 'package:rosset_client/app/modules/workspace/views/workspace_view.dart';
import 'package:rosset_client/app/modules/workspace/bindings/workspace_binding.dart';
import 'package:rosset_client/app/modules/auth/views/auth_view.dart';
import 'package:rosset_client/app/modules/auth/bindings/auth_binding.dart';
import 'package:rosset_client/app/modules/home/views/home_view.dart';
import 'package:rosset_client/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/tests/bindings/tests_binding.dart';
import 'package:rosset_client/app/modules/tests/views/tests_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

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
  ];
}
