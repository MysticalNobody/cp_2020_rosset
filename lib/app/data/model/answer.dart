import 'package:json_annotation/json_annotation.dart';
import 'package:rosset_client/app/data/model/question.dart';

part 'answer.g.dart';

@JsonSerializable(explicitToJson: true)
class AnswerModel {
  AnswerModel({
    this.question,
    this.userAnswer,
    this.seconds,
  });

  QuestionModel question;
  int userAnswer;
  int seconds;

  factory AnswerModel.fromJson(Map<String, dynamic> json) => _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
