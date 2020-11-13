import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rosset_client/app/data/model/user_model.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: "https://al.itis.team")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient get instance => Get.find<RestClient>();

  ///
  ///
  /// AUTH
  ///
  ///
  @POST("/auth/signin")
  Future<UserModel> signIn(
    @Field('login') String login,
    @Field('password') String password,
  );
}
