import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/auth/controllers/auth_controller.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:rosset_client/utils/get_busy_mixin.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
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
                            .copyWith(color: AppColors.primary)),
                    SizedBox(height: 24),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        labelText: 'Логин',
                        labelStyle: AppTextStyles.mediumLabel,
                      ),
                      controller: controller.loginController,
                      focusNode: controller.loginFocusNode,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.none,
                    ),
                    SizedBox(height: 24),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          labelText: 'Пароль',
                          labelStyle: AppTextStyles.mediumLabel,
                          suffix: IconButton(
                            icon: Icon(EvaIcons.eyeOutline,
                                color: AppColors.primary),
                            onPressed: () {},
                          )),
                      controller: controller.passwordController,
                      focusNode: controller.passwordFocusNode,
                    ),
                    SizedBox(height: 26),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
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
    ).withBusyStack(controller).unfocusOnTap();
  }
}
