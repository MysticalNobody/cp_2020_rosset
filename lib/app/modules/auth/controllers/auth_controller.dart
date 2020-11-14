import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/routes/app_pages.dart';
import 'package:rosset_client/utils/get_busy_mixin.dart';

class AuthController extends GetxController with GetBusyMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode loginFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {}

  void action() {
    if (formKey.currentState.validate()) {
      Get.offAllNamed(Routes.CHALLENGES);
    }
  }
}
