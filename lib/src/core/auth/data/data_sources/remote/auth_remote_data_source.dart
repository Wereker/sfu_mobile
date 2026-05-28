import 'package:sfu/src/core/auth/data/dto/group_dto.dart';
import 'package:sfu/src/core/auth/data/dto/token_dto.dart';

abstract class AuthRemoteDataSource {
  Future<TokenDTO> signIn(String email, String password);

  Future<void> signUp({
    required String name,
    required String surname,
    required String patronymic,
    required String email,
    required String password,
    required int groupId,
  });

  Future<List<GroupDTO>> getGroups();

  Future<void> resetPassword(String newPassword);
  Future<TokenDTO> refreshToken(String token);
}