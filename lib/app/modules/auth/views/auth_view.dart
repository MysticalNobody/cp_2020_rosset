import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/auth/controllers/auth_controller.dart';
import 'package:rosset_client/app/modules/auth/widgets/text_input.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:rosset_client/utils/get_busy_mixin.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                width: Get.width * .25,
                child: Image.asset(
                  'assets/images/test2.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: Get.width * .25,
                child: Image.asset(
                  'assets/images/test1.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondary,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 30,
                                top: 7,
                              ),
                              child: Text(
                                'ПАВЕЛ АНАТОЛЬЕВИЧ',
                                style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 24),
                    Spacer(),
                    Text(
                      'Авторизация',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Get.width > 600 ? 36 : 24,
                        color: Color(0xFF303C74),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextInputWidget(
                      labelText: 'ФИО',
                      controller: controller.loginController,
                      focusNode: controller.loginFocusNode,
                    ),
                    SizedBox(height: 24),
                    TextInputWidget(
                      labelText: 'Номер группы',
                      controller: controller.passwordController,
                      focusNode: controller.passwordFocusNode,
                    ),
                    SizedBox(height: 24),
                    Container(
                      constraints: BoxConstraints(
                        minWidth: Get.width * .4,
                        maxWidth: Get.width * .8,
                      ),
                      width: 300,
                      child: RaisedButton(
                        color: AppColors.secondary,
                        onPressed: controller.action,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Войти'),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '© 2020 - Itis.team, Inc. All rights reserved.',
                      style: TextStyle(
                        fontSize: Get.width > 600 ? 20 : 14,
                        color: Color(0xFF303C74),
                      ),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).withBusyStack(controller).unfocusOnTap();
  }
}
