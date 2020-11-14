import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/answer.dart';
import 'package:rosset_client/app/data/model/question.dart';
import 'package:rosset_client/theme/app_colors.dart';

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({Key key, @required this.answers}) : super(key: key);

  final List<AnswerModel> answers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        answers.length,
        (qIndex) {
          final int userAnswer = answers[qIndex].userAnswer;
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
                    child: Text(
                      question.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.text,
                      ),
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
                          question.options[question.answer - 1],
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF0D964D),
                          ),
                        ),
                        if (userAnswer != question.answer - 1)
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
    );
  }
}
