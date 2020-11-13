import 'dart:async';

import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/user_model.dart';
import 'package:rosset_client/app/data/provider/user_storage.dart';

class UserRepository {
  static UserRepository get instance => Get.find<UserRepository>();

  UserStorage _userStorage = UserStorage();
  String _token;
  UserModel _user;

  String get accessToken => _token;
  UserModel get user => _userStorage.getUser();
  bool get authorized => user != null;

  Future<UserRepository> init() async {
    _token = _userStorage.getToken();
    _user = _userStorage.getUser();
    return this;
  }

  Future updateUser(UserModel user) async =>
      _user = await _userStorage.saveUser(user);
  Future updateToken(String token) async =>
      _token = await _userStorage.saveToken(token);

  Future logout() async => await _userStorage.clear();
}
