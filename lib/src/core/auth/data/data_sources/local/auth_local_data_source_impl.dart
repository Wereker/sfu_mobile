import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static final String _userAccessKey = 'access_token';
  static final String _userRefreshToken = 'refresh_token';
  static final String _userGroupKey = 'user_group';
  static final String _userSubgroupKey = 'user_subgroup';
  static final String _userRoleKey = 'user_role';

  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _pref;

  const AuthLocalDataSourceImpl(this._secureStorage, this._pref);

  @override
  Future<void> cacheAccessToken(String token) async {
    await _secureStorage.write(key: _userAccessKey, value: token);
  }

  @override
  Future<void> cacheRefreshToken(String token) async {
    await _secureStorage.write(key: _userRefreshToken, value: token);
  }

  @override
  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: _userAccessKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _userRefreshToken);
  }

  @override
  Future<void> cacheUserGroup(String group) async {
    await _pref.setString(_userGroupKey, group);
  }

  @override
  Future<void> cacheUserRole(String role) async {
    await _pref.setString(_userRoleKey, role);
  }

  @override
  Future<void> cacheUserSubgroup(String subgroup) async {
    await _pref.setString(_userSubgroupKey, subgroup);
  }

  @override
  Future<String?> getUserGroup() async {
    return _pref.getString(_userGroupKey);
  }

  @override
  Future<String?> getUserRole() async {
    return _pref.getString(_userRoleKey);
  }

  @override
  Future<String?> getUserSubgroup() async {
    return _pref.getString(_userSubgroupKey);
  }

  @override
  Future<void> clear() async {
    await _secureStorage.deleteAll();
    await _pref.clear();
  }
}
