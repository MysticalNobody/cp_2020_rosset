import 'dart:async';

import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/answer.dart';
import 'package:rosset_client/app/data/provider/test_storage.dart';

class TestRepository {
  static TestRepository get instance => Get.find<TestRepository>();

  TestStorage _testStorage = TestStorage();
  List<AnswerModel> _answers;

  List<AnswerModel> get answers => _answers;

  TestRepository init() {
    _answers = _testStorage.getAnswers();
    return this;
  }

  Future<void> updateAnswers(List<AnswerModel> answers) async => _answers = await _testStorage.saveAnswers(answers);
  Future<void> addAnswer(AnswerModel answer) async {
    List<AnswerModel> a = answers.toList();
    a.add(answer);
    _answers = await _testStorage.saveAnswers(a);
  }

  Future logout() async => await _testStorage.clear();
}
