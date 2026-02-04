import 'package:sfu/src/core/data/DTO/user_dto.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserDTO user);
  Future<UserDTO> getCachedUser();
  Future<void> cacheToken(String token);
  Future<String> getCachedToken();
  Future<void> clear();
}