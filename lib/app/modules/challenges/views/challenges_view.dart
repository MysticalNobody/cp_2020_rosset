import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/challenges/controllers/challenges_controller.dart';
import 'package:rosset_client/app/routes/app_pages.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:rosset_client/utils/get_busy_mixin.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class ChallengesView extends GetView<ChallengesController> {
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
            Align(
              alignment: Alignment.center,
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
                        Text('Задания', style: AppTextStyles.headLine3.copyWith(color: AppColors.secondary)),
                        SizedBox(height: 12),
                        Text('Выберите задание из списка:',
                            style: AppTextStyles.secondary.copyWith(color: AppColors.grey.withOpacity(.5))),
                        SizedBox(height: 24),
                        Card(
                          elevation: 2,
                          child: TextButton(
                            onPressed: () => Get.toNamed(Routes.HOME),
                            child: Padding(
                              padding: EdgeInsets.all(24),
                              child: Text(
                                'Настройка IED на прием-передачу GOOSE-сообщений',
                                style: AppTextStyles.mediumLabel,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    ).withBusyStack(controller).unfocusOnTap();
  }
}
