import 'package:sfu/src/feature/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/feature/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:sfu/src/core/domain/entity/user.dart';
import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  const AuthRepositoryImpl({required this.local, required this.remote});

  @override
  Future<User> signIn(String login, String password) async {
    final dto = await remote.signIn(login, password);

    return User(
        id: dto.id,
        firstName: dto.firstName,
        lastName: dto.lastName,
        phone: dto.phone,
        role: dto.role,
    );
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String password) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> singUp() {
    // TODO: implement singUp
    throw UnimplementedError();
  }
}