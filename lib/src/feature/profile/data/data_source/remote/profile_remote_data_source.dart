import 'package:sfu/src/feature/profile/data/dto/user_dto.dart';

abstract class ProfileRemoteDataSource {
  Future<UserDTO> getProfile();
  Future<String> getAvatarUrl(int userId);
  Future<void> uploadAvatar(String filePath);
}