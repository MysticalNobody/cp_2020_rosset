import 'dart:async';

import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/quest_attempt.dart';
import 'package:rosset_client/app/data/provider/quest_storage.dart';

class QuestRepository {
  static QuestRepository get instance => Get.find<QuestRepository>();

  QuestStorage _testStorage = QuestStorage();
  QuestAttempt _attempt;

  QuestAttempt get attempt => _attempt;

  QuestRepository init() {
    _attempt = _testStorage.getAttempt();
    return this;
  }

  Future<void> updateAttempt(QuestAttempt attempt) async => _attempt = await _testStorage.saveAttempt(attempt);

  Future<void> clear() async => await _testStorage.clear();
}
