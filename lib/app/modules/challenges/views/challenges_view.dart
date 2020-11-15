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
                  Text(
                    'Задания',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Get.width > 600 ? 36 : 24,
                      color: Color(0xFF303C74),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Выберите задание из списка',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.secondary.copyWith(color: Color(0xFF9096B5)),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(11),
                      color: Color(0xFFE5E8EF),
                      onPressed: () => Get.toNamed(Routes.HOME),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .8,
                          minWidth: Get.width * .3,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 435,
                        height: 60,
                        child: Row(
                          children: [
                            SizedBox(width: 25),
                            Flexible(
                              child: Text(
                                'Настройка IED на прием-передачу GOOSE-сообщений',
                                style: AppTextStyles.secondary.copyWith(
                                  color: Color(0xFF495585),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
