import 'package:json_annotation/json_annotation.dart';

part 'quest_mistake.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestMistake {
  DateTime time;
  String mistake;
  QuestMistake();

  factory QuestMistake.fromJson(Map<String, dynamic> json) => _$QuestMistakeFromJson(json);

  Map<String, dynamic> toJson() => _$QuestMistakeToJson(this);
}
