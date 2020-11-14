// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tests.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TestsApi implements TestsApi {
  _TestsApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://tod.itis.team/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<QuestionModel>> getQuestions() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('questions.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => QuestionModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
