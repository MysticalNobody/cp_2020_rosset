import 'package:json_annotation/json_annotation.dart';
import 'package:rosset_client/app/data/model/quest_mistake.dart';

part 'quest_attempt.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestAttempt {
  DateTime start;
  DateTime end;
  List<QuestMistake> mistakes;
  QuestAttempt();
  factory QuestAttempt.fromJson(Map<String, dynamic> json) => _$QuestAttemptFromJson(json);

  Map<String, dynamic> toJson() => _$QuestAttemptToJson(this);
}
