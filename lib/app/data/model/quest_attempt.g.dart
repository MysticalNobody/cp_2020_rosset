// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestAttempt _$QuestAttemptFromJson(Map<String, dynamic> json) {
  return QuestAttempt()
    ..start =
        json['start'] == null ? null : DateTime.parse(json['start'] as String)
    ..end = json['end'] == null ? null : DateTime.parse(json['end'] as String)
    ..mistakes = (json['mistakes'] as List)
        ?.map((e) =>
            e == null ? null : QuestMistake.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$QuestAttemptToJson(QuestAttempt instance) =>
    <String, dynamic>{
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'mistakes': instance.mistakes?.map((e) => e?.toJson())?.toList(),
    };
