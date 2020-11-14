import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/test_results/controllers/test_result_controller.dart';
import 'package:rosset_client/app/modules/test_results/widgets/answers.dart';
import 'package:rosset_client/app/modules/test_results/widgets/appbar.dart';
import 'package:rosset_client/app/modules/test_results/widgets/card.dart';
import 'package:rosset_client/app/modules/test_results/widgets/left_card.dart';
import 'package:rosset_client/theme/app_colors.dart';
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
              TestResultAppbar(
                onBackTap: model.onClosedTap,
              ),
              SizedBox(height: Get.height * .01),
              if (model.answers?.isEmpty ?? true)
                CircularProgressIndicator()
              else
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * .025,
                      vertical: Get.height * 0.04,
                    ),
                    children: [
                      Wrap(
                        children: [
                          ResultCard(
                            title: 'Время на один вопрос',
                            text: '${model.secondsPerQuestion} сек',
                            type: model.secPerQCardType,
                          ),
                          ResultCard(
                            title: 'Время выполнения',
                            text: '${model.summaryTime} мин',
                            type: model.sumTimeCardType,
                          ),
                          ResultCard(
                            title: 'Минимальное время',
                            text: '${model.minTime} сек',
                            type: model.minTimeCardType,
                          ),
                          ResultCard(
                            title: 'Максимальное время',
                            text: '${model.maxTime} сек',
                            type: model.maxTimeCardType,
                          ),
                          ResultCard(
                            title: 'Верных ответов',
                            text: '${model.accuracy}%',
                            type: model.accuracyCardType,
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * .03),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LeftCard(
                            onTap: model.changeTab,
                            chosen: model.tabIndex,
                          ),
                          if (model.tabIndex == 0)
                            Container()
                          else
                            AnswersWidget(
                              answers: model.answers,
                            ),
                          Container(),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    ).unfocusOnTap();
  }
}
