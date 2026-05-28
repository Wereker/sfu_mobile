import 'package:sfu/src/feature/profile/domain/entity/user.dart';

abstract class ProfileRepository {
  Future<User> getProfile();
  Future<String> getAvatarUrl(int userId);
  Future<void> uploadAvatar(String filePath);
}