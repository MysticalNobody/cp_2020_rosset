import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/answer.dart';
import 'package:rosset_client/app/data/model/question.dart';
import 'package:rosset_client/app/data/repository/test_repository.dart';
import 'package:rosset_client/app/modules/test_results/widgets/card.dart';

class TestResultController extends GetxController {
  final TestRepository testRepository = Get.find<TestRepository>();

  List<QuestionModel> questions = [];
  List<AnswerModel> get answers => testRepository.answers;
  int get allQuestionsCount => questions?.length ?? 0;
  bool get isTestCompleted => allQuestionsCount == (answers?.length ?? 0);

  int tabIndex = 1;

  int secondsPerQuestion = 0;
  int summaryTime = 0;
  int minTime = 1000000;
  int maxTime = 0;
  int accuracy = 0;
  CardResultType secPerQCardType = CardResultType.normal;
  CardResultType sumTimeCardType = CardResultType.normal;
  CardResultType minTimeCardType = CardResultType.normal;
  CardResultType maxTimeCardType = CardResultType.normal;
  CardResultType accuracyCardType = CardResultType.normal;
  Set<String> tagsToLearn = Set<String>();

  @override
  Future<void> onInit() async {
    super.onInit();
    String data = await DefaultAssetBundle.of(Get.context).loadString("assets/data/questions.json");
    final jsonResult = json.decode(data);
    for (final item in jsonResult) {
      var q = QuestionModel.fromJson(item);
      questions.add(q);
    }
    calculateData();
    update();
  }

  void calculateData() {
    for (final AnswerModel answer in (answers ?? [])) {
      summaryTime += answer.seconds;
      if (answer.seconds < minTime) minTime = answer.seconds;
      if (answer.seconds > maxTime) maxTime = answer.seconds;
      if (answer.userAnswer == answer.question.answer) {
        accuracy++;
      } else {
        tagsToLearn.add(answer.question.tag);
      }
    }
    secondsPerQuestion = (summaryTime / answers.length).floor();
    summaryTime = (summaryTime / 60).floor();
    accuracy = (accuracy / answers.length * 100).floor();
    if (secondsPerQuestion < 15)
      secPerQCardType = sumTimeCardType = CardResultType.good;
    else if (secondsPerQuestion > 30) secPerQCardType = sumTimeCardType = CardResultType.warning;
    if (minTime < 5)
      minTimeCardType = CardResultType.good;
    else if (minTime > 30) minTimeCardType = CardResultType.warning;
    if (maxTime < 30)
      maxTimeCardType = CardResultType.good;
    else if (maxTime > 45) maxTimeCardType = CardResultType.warning;
    if (accuracy > 90)
      accuracyCardType = CardResultType.good;
    else if (accuracy < 50) accuracyCardType = CardResultType.warning;
  }

  void changeTab(int index) {
    tabIndex = index;
    update();
  }
}
