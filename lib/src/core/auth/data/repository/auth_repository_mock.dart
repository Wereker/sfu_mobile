import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<bool> signIn(String login, String password) async {
    await Future.delayed(Duration(seconds: 1));

    return true;
  }

  @override
  Future<bool> logout() async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> resetPassword(String newPassword) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
    required String group,
    required String subgroup,
    required String role,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> checkAuthStatus() async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> signInWithGoogle() async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }
}
