import 'package:firebase_auth/firebase_auth.dart';
import 'package:sfu/src/core/auth/data/DTO/token_dto.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;

  const AuthRepositoryImpl({
    required AuthLocalDataSource local,
    required AuthRemoteDataSource remote,
  }) : _local = local,
       _remote = remote;

  @override
  Future<bool> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    await _local.clear();
    await FirebaseAuth.instance.signOut();
    return true;
  }

  @override
  Future<bool> resetPassword(String newPassword) async {
    try {
      await _remote.resetPassword(newPassword);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> signIn(String login, String password) async {
    try {
      final TokenDTO token = await _remote.signIn(login, password);
      await _local.cacheAccessToken(token.access);
      await _local.cacheRefreshToken(token.refresh);

      final String group = await _remote.getUserGroup();
      final String role = await _remote.getUserRole();
      await _local.cacheUserGroup(group);
      await _local.cacheUserRole(role);

      return true;
    } catch (_) {
      rethrow;
    }
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
    try {
      final TokenDTO tokenDTO = await _remote.signUp(
        email,
        password,
        name,
        group,
        subgroup,
        role,
      );
      await _local.cacheAccessToken(tokenDTO.access);
      await _local.cacheRefreshToken(tokenDTO.refresh);
      await _local.cacheUserGroup(group);
      await _local.cacheUserRole(role);
      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  @override
  Future<bool> checkAuthStatus() async {
    final String? token = await _local.getAccessToken();

    if (token != null) {
      return true;
    }

    final String? refreshToken = await _local.getRefreshToken();

    if (refreshToken == null) {
      throw Exception();
    }

    try {
      final TokenDTO newToken = await _remote.refreshToken(refreshToken);
      final String group = await _remote.getUserGroup();
      final String role = await _remote.getUserRole();

      await _local.cacheAccessToken(newToken.access);
      await _local.cacheRefreshToken(newToken.refresh);
      await _local.cacheUserGroup(group);
      await _local.cacheUserRole(role);
      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
