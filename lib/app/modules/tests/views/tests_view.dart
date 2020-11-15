import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/tests/controllers/tests_controller.dart';
import 'package:rosset_client/app/modules/tests/widgets/appbar.dart';
import 'package:rosset_client/app/modules/tests/widgets/option.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class TestsView extends GetView<TestsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: GetBuilder<TestsController>(
          init: controller,
          builder: (model) => Container(
            height: Get.height,
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
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TestsAppbar(onBackTap: model.exitTest),
                      SizedBox(height: Get.height * .15),
                      if (model.questions.isEmpty)
                        CircularProgressIndicator()
                      else
                        Column(
                          children: [
                            if (Get.width < 600) SizedBox(height: 24),
                            Container(
                              constraints: BoxConstraints(maxWidth: Get.width * .8),
                              child: Text(
                                model.nowQuestion.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: Get.width > 600 ? 36 : 24,
                                  color: Color(0xFF303C74),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Вопрос ${model.nowQuestionIndex + 1} из ${model.questions.length}',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.secondary.copyWith(color: Color(0xFF9096B5)),
                            ),
                            SizedBox(height: 40),
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
                      if (Get.width < 600) SizedBox(height: 12) else SizedBox(height: Get.height * .06),
                      RaisedButton(
                        color: AppColors.secondary,
                        child: Text(
                          model.isLastQuestion ? 'К результатам' : 'Следующий вопрос',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: model.chosenOption == null ? null : model.nextQuestion,
                      ),
                      if (Get.width < 600) SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).unfocusOnTap();
  }
}
