import 'package:sfu/src/core/auth/data/dto/token_dto.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/error/auth_exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;

  const AuthRepositoryImpl({
    required AuthLocalDataSource local,
    required AuthRemoteDataSource remote,
  }) : _local = local,
       _remote = remote;

  @override
  Future<void> signIn(String login, String password) async {
    final TokenDTO token = await _remote.signIn(login, password);
    await _local.cacheAccessToken(token.access);
    await _local.cacheRefreshToken(token.refresh);
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
    final TokenDTO token = await _remote.signUp(
      email,
      password,
      name,
      group,
      subgroup,
      role,
    );
    await _local.cacheAccessToken(token.access);
    await _local.cacheRefreshToken(token.refresh);
  }

  @override
  Future<void> resetPassword(String newPassword) async {
    await _remote.resetPassword(newPassword);
  }

  @override
  Future<void> logout() async {
    await _local.clear();
  }

  @override
  Future<void> checkAuthStatus() async {
    final String? token = await _local.getAccessToken();
    if (token != null) return;


    final String? refreshToken = await _local.getRefreshToken();
    if (refreshToken == null) throw UnauthorizedException();

    final TokenDTO newToken = await _remote.refreshToken(refreshToken);
    await _local.cacheAccessToken(newToken.access);
    await _local.cacheRefreshToken(newToken.refresh);
  }

  @override
  Future<void> signInWithGoogle() {
    throw UnimplementedError('Google Sign-In не реализован');
  }
}
