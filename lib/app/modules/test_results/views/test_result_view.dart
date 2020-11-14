import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/question.dart';
import 'package:rosset_client/app/modules/test_results/controllers/test_result_controller.dart';
import 'package:rosset_client/app/modules/test_results/widgets/option.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class TestResultView extends GetView<TestResultController> {
  // final List<AnswerModel> answers;

  // TestResultView(this.answers);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GetBuilder<TestResultController>(
        init: controller,
        builder: (model) => SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
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
                    'Результаты тестирования',
                    style: AppTextStyles.subtitle.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  RaisedButton(
                    child: Text('Назад'),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: Get.height * .05),
              if (model.answers?.isEmpty ?? true)
                CircularProgressIndicator()
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: model.answers.length,
                    itemBuilder: (context, qIndex) {
                      final int userAnswer = model.answers[qIndex].userAnswer;
                      final QuestionModel question = model.answers[qIndex].question;
                      return Card(
                        child: Column(
                          children: [
                            Text(question.title),
                            ...List.generate(
                              question.options.length,
                              (index) {
                                OptionType type = OptionType.normal;
                                if (index == (question.answer - 1)) {
                                  type = OptionType.right;
                                } else if (index == userAnswer && (question.answer - 1) != userAnswer) {
                                  type = OptionType.error;
                                }
                                return OptionButton(
                                  text: question.options[index],
                                  onTap: () {},
                                  type: type,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    ).unfocusOnTap();
  }
}
