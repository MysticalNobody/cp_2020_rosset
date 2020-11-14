import 'package:get_storage/get_storage.dart';
import 'package:rosset_client/app/data/model/quest_attempt.dart';
import 'package:rosset_client/utils/logger.dart';

class QuestStorage {
  final _attempt = ReadWriteValue<Map<String, dynamic>>('attempt', null);

  QuestAttempt getAttempt() {
    if (_attempt?.val == null) return null;
    return QuestAttempt.fromJson(_attempt?.val);
  }

  Future<QuestAttempt> saveAttempt(QuestAttempt attempt) async {
    _attempt.val = attempt.toJson();
    logger.i('Saved attempt');
    return attempt;
  }

  Future<void> clear() async {
    _attempt.val = null;
  }
}
