import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:rosset_client/app/data/repository/user_repository.dart';
import 'package:rosset_client/utils/logger.dart';

@immutable
class AuthHeaderInterceptor implements Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    final accessToken = UserRepository.instance.accessToken;
    if (accessToken == null) return options;
    final headers = Map<String, String>.from(options.headers);
    headers['authorization'] = 'Bearer $accessToken';
    return options..headers = headers;
  }

  @override
  Future onError(DioError err) {
    throw err;
  }

  @override
  Future onResponse(Response response) {
    return Future(() => response);
  }
}

@immutable
class LoggerInterceptor implements Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    try {
      String headers =
          options.headers.entries.map((e) => '${e.key}: ${e.value}').join('\n');
      silentLogger.i('-> ${options.method} ${options.uri}\n$headers');
      silentLogger.i(options.data);
      silentLogger.i('-> END ${options.method}');
      // ignore: empty_catches
    } catch (e) {
      logger.e(e);
    }
    return options;
  }

  @override
  Future onError(DioError err) {
    throw err;
  }

  @override
  Future onResponse(Response response) {
    final base = response.request;
    String headers =
        base.headers.entries.map((e) => '<- ${e.key}: ${e.value}').join('\n');
    Level level = Level.info;
    if (response.statusCode >= 500) level = Level.debug;
    if (response.statusCode >= 400) level = Level.error;
    if (response.statusCode > 300) level = Level.warning;
    silentLogger.log(level,
        '<- ${response.statusCode} ${base.method} ${base.uri}\n$headers');
    // silentLogger.log(level, response.data);
    silentLogger.log(level, '<- END ${base.method}');
    return Future(() => response);
  }
}
