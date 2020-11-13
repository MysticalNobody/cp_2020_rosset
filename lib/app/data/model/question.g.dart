// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return QuestionModel(
    title: json['title'] as String,
    options: (json['options'] as List)?.map((e) => e as String)?.toList(),
    answer: json['answer'] as int,
  );
}

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'options': instance.options,
      'answer': instance.answer,
    };
