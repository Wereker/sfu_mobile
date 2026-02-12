import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  const AuthRepositoryImpl({required this.local, required this.remote});

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> resetPassword(String password) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> signIn(String login, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<bool> singUp({
    required String login,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    // TODO: implement singUp
    throw UnimplementedError();
  }

  @override
  Future<bool> checkAuthStatus() {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }
}
