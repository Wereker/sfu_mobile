import 'package:sfu/src/core/auth/data/DTO/auth_user_data.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAccessToken(String token);

  Future<void> cacheRefreshToken(String token);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<String?> getUserGroup(String uid);

  Future<String?> getUserRole(String uid);

  Future<String?> getUserSubgroup(String uid);

  Future<String?> getUserName(String uid);

  Future<void> cacheUserData({
    required String uid,
    String? name,
    String? group,
    String? role,
    String? subgroup,
  });
  Future<AuthMetadata> getUserData(String uid);

  Future<void> clear();
}
