import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/answer.dart';
import 'package:rosset_client/app/data/model/question.dart';
import 'package:rosset_client/app/data/repository/test_repository.dart';
import 'package:rosset_client/app/routes/app_pages.dart';

class TestsController extends GetxController {
  final TestRepository testRepository = Get.find<TestRepository>();

  QuestionModel get nowQuestion => questions[nowQuestionIndex];
  int get answer => nowQuestion.answer;
  bool get isLastQuestion => (nowQuestionIndex + 1) == questions.length;

  int nowQuestionIndex = 0;
  int chosenOption;
  List<QuestionModel> questions = [];
  List<AnswerModel> get answers => testRepository.answers;

  int stopWatch = 0;
  Timer timer;

  void exitTest() => Get.toNamed(Routes.TEST_RESULT);

  @override
  Future<void> onInit() async {
    super.onInit();
    String data = await DefaultAssetBundle.of(Get.context).loadString("assets/data/questions.json");
    final jsonResult = json.decode(data);
    for (final item in jsonResult) {
      var q = QuestionModel.fromJson(item);
      questions.add(q);
    }
    List<AnswerModel> a = answers;
    if (answers.isNotEmpty && answers.length != questions.length) {
      nowQuestionIndex = answers.length;
    }
    timer = Timer.periodic(
      1.seconds,
      (t) => stopWatch++,
    );
    update();
  }

  void resetOverwatch() {
    timer.cancel();
    stopWatch = 0;
    timer = Timer.periodic(
      1.seconds,
      (t) => stopWatch++,
    );
  }

  void nextQuestion() {
    if (nowQuestionIndex + 1 == questions.length) {
      Get.toNamed(
        Routes.TEST_RESULT,
        arguments: answers,
      );
      return;
    }
    resetOverwatch();
    chosenOption = null;
    nowQuestionIndex++;
    update();
  }

  void toAnswer(int index) {
    chosenOption = index;
    testRepository.addAnswer(
      AnswerModel(
        question: nowQuestion,
        userAnswer: index,
        seconds: stopWatch,
      ),
    );
    update();
  }

  @override
  void onClose() {}
}
