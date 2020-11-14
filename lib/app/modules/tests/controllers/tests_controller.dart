import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/answer.dart';
import 'package:rosset_client/app/data/model/question.dart';
import 'package:rosset_client/app/routes/app_pages.dart';

class TestsController extends GetxController {
  // final _testsApi = Get.find<TestsApi>();

  QuestionModel get nowQuestion => questions[nowQuestionIndex];
  int get answer => nowQuestion.answer - 1;

  int nowQuestionIndex = 0;
  int chosenOption;
  List<QuestionModel> questions = [];
  List<AnswerModel> answers = [];

  void exitTest() {
    Get.back();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    // _isBusy.value = true;
    String data = await DefaultAssetBundle.of(Get.context).loadString("assets/data/questions.json");
    final jsonResult = json.decode(data);
    for (final item in jsonResult) {
      var q = QuestionModel.fromJson(item);
      questions.add(q);
    }
    update();
    // var q = await _testsApi.getQuestions();
    // questions.addAll(q);
    // _isBusy.value = false;
  }

  void nextQuestion() {
    if (nowQuestionIndex + 1 == questions.length) {
      Get.toNamed(
        Routes.TEST_RESULT,
        arguments: answers,
      );
      return;
    }
    chosenOption = null;
    nowQuestionIndex++;
    update();
  }

  void toAnswer(int index) {
    chosenOption = index;
    answers.add(AnswerModel(
      question: nowQuestion,
      userAnswer: index,
    ));
    update();
  }

  @override
  void onClose() {}
}
