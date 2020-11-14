// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) {
  return AnswerModel(
    question: json['question'] == null
        ? null
        : QuestionModel.fromJson(json['question'] as Map<String, dynamic>),
    userAnswer: json['userAnswer'] as int,
    seconds: json['seconds'] as int,
  );
}

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'question': instance.question?.toJson(),
      'userAnswer': instance.userAnswer,
      'seconds': instance.seconds,
    };
