import 'package:get/get.dart';
import 'package:rosset_client/app/data/repository/user_repository.dart';
import 'package:rosset_client/app/routes/app_pages.dart';

/// после инициализации контроллера проверяет авторизирован ли
/// пользователь, и если нет, то происходит навигация на страницу
/// авторизации
mixin RequiredAuthMixin on GetxController {
  @override
  void onReady() {
    if (!UserRepository.instance.authorized &&
        !Get.currentRoute.contains(Routes.AUTH))
      Get.offAllNamed(Routes.AUTH);
    else
      super.onReady();
  }
}
