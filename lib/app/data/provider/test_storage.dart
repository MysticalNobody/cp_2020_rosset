import 'package:get_storage/get_storage.dart';
import 'package:rosset_client/app/data/model/answer.dart';
import 'package:rosset_client/utils/logger.dart';

class TestStorage {
  final _answers = ReadWriteValue<Map<String, dynamic>>('answers', null);

  List<AnswerModel> getAnswers() {
    if (_answers?.val == null) return [];
    List<AnswerModel> aList = [];
    final fromStorage = _answers?.val['answers'];
    for (final json in fromStorage) {
      aList.add(AnswerModel.fromJson(json));
    }
    return aList;
  }

  Future<List<AnswerModel>> saveAnswers(List<AnswerModel> answers) async {
    List<dynamic> jsons = [];
    for (final AnswerModel a in answers) {
      jsons.add(a.toJson());
    }
    _answers.val = {'answers': jsons};
    logger.i('Saved answers');
    return answers;
  }

  Future<void> clear() async {
    await GetStorage().erase();
  }
}
