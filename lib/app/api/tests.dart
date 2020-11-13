import 'package:dio/dio.dart';
import 'package:rosset_client/app/data/model/question.dart';
import 'package:retrofit/retrofit.dart';

part 'tests.g.dart';

@RestApi(baseUrl: 'http://tod.itis.team/')
abstract class TestsApi {
  factory TestsApi(Dio dio, {String baseUrl}) = _TestsApi;

  @GET("questions.json")
  Future<List<QuestionModel>> getQuestions();
}
