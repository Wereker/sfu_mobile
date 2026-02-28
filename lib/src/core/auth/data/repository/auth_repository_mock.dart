import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<void> signIn(String login, String password) async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> resetPassword(String newPassword) async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String group,
    required String subgroup,
    required String role,
  }) async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> checkAuthStatus() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> signInWithGoogle() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
