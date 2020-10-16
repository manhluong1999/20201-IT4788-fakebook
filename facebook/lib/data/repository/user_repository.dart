import 'package:facebook/data/models/user.dart';
import 'package:facebook/data/source/base/user_database.dart';
import 'package:facebook/data/source/base/user_models.dart';
import 'package:facebook/data/source/localdatasource/local_data.dart';

import 'package:facebook/data/source/localdatasource/user_local_datasource.dart';
import 'package:facebook/data/source/remotedatasource/user_remotedatasource.dart';

abstract class UserRepository {
  signUp(User user, Function onSuccess, Function(String) onError);
  signIn(String phone, String password, Function onSuccess,
      Function(String) onError);
  setCurrentUser();
}

class UserRepositoryImpl extends UserRepository {
  UserRemoteDatasource _userRemoteDatasource;
  UserLocalDatasource _userLocalDatasource;
  UserRepositoryImpl(this._userLocalDatasource, this._userRemoteDatasource);

  @override
  signUp(User user, Function onSuccess, Function(String) onError) {
    _userRemoteDatasource.apiRegister(user, onSuccess, onError);
  }

  @override
  signIn(String phone, String password, Function onSuccess,
      Function(String p1) onError) {
    _userRemoteDatasource.apiSignin(phone, password, onSuccess, onError);
  }

  @override
  setCurrentUser() async {
    // TODO: implement setCurrentUser
    await _userLocalDatasource.setLocalUser();
  }
}
