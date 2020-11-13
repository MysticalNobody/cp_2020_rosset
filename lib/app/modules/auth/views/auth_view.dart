import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/auth/controllers/auth_controller.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:rosset_client/utils/get_busy_mixin.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 406),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    // controller: controller.loginController,
                    // onChanged: controller.loginChanged,
                    // validator: controller.validateLogin,
                    // onFieldSubmitted: (value) =>
                    //     FocusScope.of(Get.focusScope.context)
                    //         .requestFocus(controller.passwordFocusNode),
                    // focusNode: controller.loginFocusNode,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.none,
                  ),
                  TextFormField(
                      // controller: controller.passwordController,
                      // focusNode: controller.passwordFocusNode,
                      // validator: controller.validatePassword,
                      // onChanged: (value) => controller.update(),
                      // onFieldSubmitted: (value) => controller.formAction(),
                      // obscureText: controller.passwordNotVisible,
                      ),
                  SizedBox(height: 30),
                  RaisedButton(
                    onPressed: controller.action,
                    child: Text('Вход'),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Spacer(),
            Text(
              '© 2000 - Company, Inc. All rights reserved. Address Address',
              style: AppTextStyles.subtitle,
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    ).withBusyStack(controller);
  }
}
