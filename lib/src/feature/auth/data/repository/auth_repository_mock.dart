import 'package:sfu/src/core/domain/entity/user.dart';
import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<User> signIn(String login, String password) async {
    await Future.delayed(Duration(seconds: 1));

    return User(
        id: 'mock_123',
        firstName: 'Иванов',
        lastName: 'Иван',
        birthdate: DateTime(2000, 3, 11),
        sex: 'M',
        phone: '+7 (983) 137-91-20',
        role: 'student',
    );
  }

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> resetPassword(String password) async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> singUp() async {
    await Future.delayed(Duration(seconds: 1));
  }

}