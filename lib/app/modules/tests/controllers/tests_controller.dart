import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/question.dart';

class TestsController extends GetxController {
  // final _testsApi = Get.find<TestsApi>();

  bool get isBusy => _isBusy.value;
  QuestionModel get nowQuestion => questions[nowQuestionIndex.value];
  int get chosenOption => _chosenOption.value;

  RxBool _isBusy = false.obs;
  RxInt nowQuestionIndex = 0.obs;
  RxInt _chosenOption = RxInt();

  List<QuestionModel> questions = [];
  Map<int, bool> answers = Map<int, bool>();

  void exitTest() {
    Get.back();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _isBusy.value = true;
    String data = await DefaultAssetBundle.of(Get.context).loadString("assets/data/questions.json");
    final jsonResult = json.decode(data);
    for (final item in jsonResult) {
      var q = QuestionModel.fromJson(item);
      questions.add(q);
    }
    // var q = await _testsApi.getQuestions();
    // questions.addAll(q);
    _isBusy.value = false;
  }

  void nextQuestion() {
    if (nowQuestionIndex.value + 1 == questions.length) Get.back();
    _chosenOption.value = null;
    nowQuestionIndex.value += 1;
  }

  void answer(int index) {
    _chosenOption.value = index;
    answers[nowQuestionIndex.value] = nowQuestion.answer == index;
  }

  @override
  void onClose() {}
}
