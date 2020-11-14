import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionModel {
  QuestionModel({
    this.title,
    this.options,
    this.answer,
  });

  String title;
  List<String> options;
  String tag;
  int answer;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
