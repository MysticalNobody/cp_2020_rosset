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
      body: GetBuilder<TestsController>(
        init: controller,
        builder: (model) => Stack(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TestsAppbar(onBackTap: model.exitTest),
                Container(),
                Container(),
                if (model.questions.isEmpty)
                  CircularProgressIndicator()
                else
                  Column(
                    children: [
                      Text(
                        model.nowQuestion.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          color: Color(0xFF303C74),
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
                Container(
                  margin: EdgeInsets.only(left: 32),
                  child: RaisedButton(
                    color: AppColors.secondary,
                    child: Text(
                      'Следующий вопрос',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: model.chosenOption == null ? null : model.nextQuestion,
                  ),
                ),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ],
        ),
      ),
    ).unfocusOnTap();
  }
}
