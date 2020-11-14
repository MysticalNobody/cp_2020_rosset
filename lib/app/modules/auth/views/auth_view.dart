import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/auth/controllers/auth_controller.dart';
import 'package:rosset_client/app/modules/tests/widgets/appbar.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:rosset_client/utils/get_busy_mixin.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
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
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.all(24),
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Авторизация',
                            style: AppTextStyles.headLine3
                                .copyWith(color: AppColors.secondary)),
                        SizedBox(height: 24),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            labelText: 'ФИО',
                            labelStyle: AppTextStyles.mediumLabel,
                          ),
                          controller: controller.loginController,
                          validator: ValidationBuilder()
                              .minLength(1, 'Необходимо ввести ФИО')
                              .build(),
                          focusNode: controller.loginFocusNode,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                        ),
                        SizedBox(height: 24),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            labelText: 'Номер группы',
                            labelStyle: AppTextStyles.mediumLabel,
                          ),
                          validator: ValidationBuilder()
                              .minLength(1, 'Необходимо ввести Номер группы')
                              .build(),
                          controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                        ),
                        SizedBox(height: 26),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            color: AppColors.secondary,
                            onPressed: controller.action,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Войти'),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '© 2020 - Itis.team, Inc. All rights reserved.',
                    style: AppTextStyles.mediumLabel,
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    ).withBusyStack(controller).unfocusOnTap();
  }
}
