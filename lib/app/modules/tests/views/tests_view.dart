import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/tests/controllers/tests_controller.dart';
import 'package:rosset_client/app/modules/tests/widgets/option.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class TestsView extends GetView<TestsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(
        () => Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Анатолич',
                      style: AppTextStyles.subtitle.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    Text(
                      'Тест на проверку освоенного материала',
                      style: AppTextStyles.subtitle.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    RaisedButton(
                      child: Text('Закончить тест'),
                      onPressed: controller.exitTest,
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .2),
                if (controller.isBusy)
                  CircularProgressIndicator()
                else
                  Column(
                    children: [
                      Text(
                        controller.nowQuestion.title,
                        style: AppTextStyles.headLine3,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Вопрос ${controller.nowQuestionIndex + 1} из ${controller.questions.length}',
                        style: AppTextStyles.secondary,
                      ),
                      SizedBox(height: 30),
                      ...List.generate(
                        4,
                        (index) {
                          OptionType type = OptionType.normal;
                          if (index == controller.nowQuestion.answer && controller.isRightAnswer != null) {
                            type = controller.isRightAnswer ? OptionType.right : OptionType.error;
                          }
                          return OptionButton(
                            onTap: () => controller.answer(index),
                            text: controller.nowQuestion.options[index],
                            type: type,
                          );
                        },
                      ),
                    ],
                  ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: Get.height * .1),
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: Text('Следующий вопрос'),
                onPressed: controller.nextQuestion,
              ),
            ),
          ],
        ),
      ),
    ).unfocusOnTap();
  }
}
