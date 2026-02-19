abstract class AuthLocalDataSource {
  Future<void> cacheAccessToken(String token);
  Future<void> cacheRefreshToken(String token);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> cacheUserGroup(String group);
  Future<void> cacheUserRole(String role);
  Future<void> cacheUserSubgroup(String subgroup);
  Future<String?> getUserGroup();
  Future<String?> getUserRole();
  Future<String?> getUserSubgroup();
  Future<void> clear();
}