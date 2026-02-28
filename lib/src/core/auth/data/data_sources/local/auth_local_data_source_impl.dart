import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sfu/src/core/auth/data/DTO/auth_user_data.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _pref;

  const AuthLocalDataSourceImpl(this._secureStorage, this._pref);

  @override
  Future<void> cacheAccessToken(String token) async {
    await _secureStorage.write(key: 'user.token.access', value: token);
  }

  @override
  Future<void> cacheRefreshToken(String token) async {
    await _secureStorage.write(key: 'user.token.refresh', value: token);
  }

  @override
  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: 'user.token.access');
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: 'user.token.refresh');
  }

  @override
  Future<String?> getUserGroup(String uid) async {
    return _pref.getString('user.$uid.group');
  }

  @override
  Future<String?> getUserRole(String uid) async {
    return _pref.getString('user.$uid.role');
  }

  @override
  Future<String?> getUserSubgroup(String uid) async {
    return _pref.getString('user.$uid.subgroup');
  }

  @override
  Future<String?> getUserName(String uid) async {
    return _pref.getString('user.$uid.name');
  }

  @override
  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }

  @override
  Future<void> cacheUserData({
    required String uid,
    String? name,
    String? group,
    String? role,
    String? subgroup,
  }) async {
    if (name != null) {
      await _pref.setString('user.$uid.name', name);
    }
    if (group != null) {
      await _pref.setString('user.$uid.group', group);
    }
    if (role != null) {
      await _pref.setString('user.$uid.role', role);
    }
    if (subgroup != null) {
      await _pref.setString('user.$uid.subgroup', subgroup);
    }
  }

  @override
  Future<AuthMetadata> getUserData(String uid) async {
    return AuthMetadata(
      name: _pref.getString('user.$uid.name'),
      group: _pref.getString('user.$uid.group'),
      role: _pref.getString('user.$uid.role'),
      subgroup: _pref.getString('user.$uid.subgroup'),
    );
  }
}
