import 'package:sfu/src/core/auth/domain/entity/token.dart';
import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<bool> signIn(String login, String password) async {
    await Future.delayed(Duration(seconds: 1));

    final token = Token(
      access: "i0L7CtovHpaCCDlsY22ObO4qACz57Khr",
      refresh: "dyqcelydolMLJQbT68x2EB9VqvvgMQmT",
      type: "Bearer",
      expires: 3600,
    );
    return true;
  }

  @override
  Future<bool> logout() async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> resetPassword(String password) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> singUp({
    required String login,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> checkAuthStatus() async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }
}
