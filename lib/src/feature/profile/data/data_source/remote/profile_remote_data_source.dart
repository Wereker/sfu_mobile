import 'package:sfu/src/feature/profile/data/dto/user_dto.dart';

abstract class ProfileRemoteDataSource {
  Future<UserDTO> getProfile();
}