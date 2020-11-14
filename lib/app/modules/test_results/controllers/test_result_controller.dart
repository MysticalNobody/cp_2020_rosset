import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/answer.dart';
import 'package:rosset_client/app/data/model/question.dart';

class TestResultController extends GetxController {
  List<AnswerModel> answers = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    String data = await DefaultAssetBundle.of(Get.context).loadString("assets/data/questions.json");
    final jsonResult = json.decode(data);
    for (final item in jsonResult) {
      var q = QuestionModel.fromJson(item);
      answers.add(
        AnswerModel(
          question: q,
          userAnswer: Random().nextInt(q.options.length - 1),
        ),
      );
    }
    update();
    // var q = await _testsApi.getQuestions();
    // questions.addAll(q);
    // _isBusy.value = false;
  }
}
