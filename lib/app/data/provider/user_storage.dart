import 'package:get_storage/get_storage.dart';
import 'package:rosset_client/app/data/model/user_model.dart';
import 'package:rosset_client/utils/logger.dart';

class UserStorage {
  final _accessToken =
      ReadWriteValue<Map<String, dynamic>>('accessToken', null);
  final _user = ReadWriteValue<Map<String, dynamic>>('user', null);

  String getToken() =>
      _accessToken?.val == null ? null : _accessToken.val['token'];
  UserModel getUser() =>
      _user?.val == null ? null : UserModel?.fromJson(_user.val);

  Future<String> saveToken(String userToken) async {
    _accessToken.val = {'token': userToken};
    logger.i('Saved token');
    return userToken;
  }

  Future<UserModel> saveUser(UserModel user) async {
    _user.val = user.toJson();
    logger.i('Saved user ${user.toJson()}');
    return user;
  }

  Future<void> clear() async {
    await GetStorage().erase();
  }
}
