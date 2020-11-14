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
      body: GetBuilder<TestsController>(
        init: controller,
        builder: (model) => Stack(
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
                      onPressed: model.exitTest,
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .2),
                if (model.questions.isEmpty)
                  CircularProgressIndicator()
                else
                  Column(
                    children: [
                      Text(
                        model.nowQuestion.title,
                        style: AppTextStyles.headLine3,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Вопрос ${model.nowQuestionIndex + 1} из ${model.questions.length}',
                        style: AppTextStyles.secondary,
                      ),
                      SizedBox(height: 30),
                      ...List.generate(
                        model.nowQuestion.options.length,
                        (index) {
                          OptionType type = OptionType.normal;
                          if (model.chosenOption != null) {
                            if (index == model.answer) {
                              type = OptionType.right;
                            }
                            if (index == model.chosenOption && model.answer != model.chosenOption) {
                              type = OptionType.error;
                            }
                          }
                          return OptionButton(
                            onTap: () => model.chosenOption != null ? null : model.toAnswer(index),
                            text: model.nowQuestion.options[index],
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
                onPressed: model.nextQuestion,
              ),
            ),
          ],
        ),
      ),
    ).unfocusOnTap();
  }
}
