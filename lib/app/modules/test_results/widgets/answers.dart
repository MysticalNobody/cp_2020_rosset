import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/answer.dart';
import 'package:rosset_client/app/data/model/question.dart';
import 'package:rosset_client/theme/app_colors.dart';

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({Key key, @required this.answers, @required this.tagsToLearn}) : super(key: key);

  final List<AnswerModel> answers;
  final Set<String> tagsToLearn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: Get.width * .5,
          child: Text('Рекомендуемые темы для изучения по итогам теста: ${tagsToLearn.join(', ')}'),
        ),
        SizedBox(height: 10),
        ...List.generate(
          answers.length,
          (qIndex) {
            final int userAnswer = answers[qIndex].userAnswer;
            final int seconds = answers[qIndex].seconds;
            final QuestionModel question = answers[qIndex].question;
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                ),
                width: Get.width * .5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              question.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.text,
                              ),
                            ),
                          ),
                          if (seconds + 30 > 45)
                            Padding(
                              padding: EdgeInsets.only(
                                top: 4,
                                left: 20,
                              ),
                              child: Icon(
                                EvaIcons.clockOutline,
                                color: Color(0xFFf6A421),
                                size: 18,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Color(0xFFF5F5F5),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.options[question.answer],
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF0D964D),
                            ),
                          ),
                          if (userAnswer != question.answer)
                            Text(
                              'Вы ответили: ${question.options[userAnswer]}',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.redStatus,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
