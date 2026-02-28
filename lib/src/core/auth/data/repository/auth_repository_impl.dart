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
  Future<void> logout() async {
    await _local.clear();
  }

  @override
  Future<void> resetPassword(String newPassword) async {
    try {
      await _remote.resetPassword(newPassword);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signIn(String login, String password) async {
    try {
      final TokenDTO token = await _remote.signIn(login, password);
      await _local.cacheAccessToken(token.access);
      await _local.cacheRefreshToken(token.refresh);
      // final String group = await _remote.getUserGroup();
      // final String role = await _remote.getUserRole();
      // final String subgroup = await _remote.getUserSubgroup();
      // await _local.cacheUserGroup(group);
      // await _local.cacheUserRole(role);
      // await _local.cacheUserSubgroup(subgroup);
    } catch (_) {
      rethrow;
    }
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
    try {
      final TokenDTO tokenDTO = await _remote.signUp(
        email,
        password,
        name,
        group,
        subgroup,
        role,
      );
      // await _local.cacheAccessToken(tokenDTO.access);
      // await _local.cacheRefreshToken(tokenDTO.refresh);
      // await _local.cacheUserGroup(group);
      // await _local.cacheUserRole(role);
      // await _local.cacheUserSubgroup(subgroup);
    } catch (_) {
      rethrow;
    }
  }

  @override
  @override
  Future<void> checkAuthStatus() async {
    final String? token = await _local.getAccessToken();

    if (token != null) {
      return;
    }

    final String? refreshToken = await _local.getRefreshToken();

    if (refreshToken == null) {
      throw Exception();
    }

    try {
      final TokenDTO newToken = await _remote.refreshToken(refreshToken);
      // final String group = await _remote.getUserGroup();
      // final String role = await _remote.getUserRole();
      // final String subgroup = await _remote.getUserSubgroup();
      //
      // await _local.cacheAccessToken(newToken.access);
      // await _local.cacheRefreshToken(newToken.refresh);
      // await _local.cacheUserGroup(group);
      // await _local.cacheUserRole(role);
      // await _local.cacheUserSubgroup(subgroup);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
