// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_mistake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestMistake _$QuestMistakeFromJson(Map<String, dynamic> json) {
  return QuestMistake()
    ..time =
        json['time'] == null ? null : DateTime.parse(json['time'] as String)
    ..mistake = json['mistake'] as String;
}

Map<String, dynamic> _$QuestMistakeToJson(QuestMistake instance) =>
    <String, dynamic>{
      'time': instance.time?.toIso8601String(),
      'mistake': instance.mistake,
    };
