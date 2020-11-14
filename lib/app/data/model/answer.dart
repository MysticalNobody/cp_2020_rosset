import 'package:json_annotation/json_annotation.dart';
import 'package:rosset_client/app/data/model/question.dart';

part 'answer.g.dart';

@JsonSerializable(explicitToJson: true)
class AnswerModel {
  AnswerModel({
    this.question,
    this.userAnswer,
  });

  QuestionModel question;
  int userAnswer;

  factory AnswerModel.fromJson(Map<String, dynamic> json) => _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
