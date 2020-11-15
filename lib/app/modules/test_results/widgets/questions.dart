import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/quest_attempt.dart';
import 'package:rosset_client/theme/app_colors.dart';

class QuestionsWidget extends StatelessWidget {
  const QuestionsWidget({Key key, @required this.questAttempt}) : super(key: key);

  final QuestAttempt questAttempt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: questAttempt.mistakes?.isEmpty ?? true
          ? [
              Card(
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
                          children: [
                            Icon(
                              EvaIcons.doneAllOutline,
                              color: Color(0xFF0D964D),
                              size: 18,
                            ),
                            SizedBox(width: 20),
                            Flexible(
                              child: Text(
                                'Ура! Вы справились с настройкой IED без ошибок!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
          : List.generate(
              questAttempt.mistakes.length,
              (index) {
                final String mistake = questAttempt.mistakes[index].mistake;
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
                            children: [
                              Icon(
                                EvaIcons.alertTriangleOutline,
                                color: AppColors.redStatus,
                                size: 18,
                              ),
                              SizedBox(width: 20),
                              Flexible(
                                child: Text(
                                  mistake,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.text,
                                  ),
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
