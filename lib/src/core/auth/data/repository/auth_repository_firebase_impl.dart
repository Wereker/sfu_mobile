import 'package:firebase_auth/firebase_auth.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';

class AuthRepositoryFirebaseImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;

  const AuthRepositoryFirebaseImpl({
    required AuthLocalDataSource local,
    required AuthRemoteDataSource remote,
  }) : _local = local,
       _remote = remote;

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
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
      await _remote.signIn(login, password);

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not found');
      }
      final localUserData = await _local.getUserData(user.uid);

      if (localUserData.name == null) {
        final remoteUserData = await _remote.getUserData(user.uid);
        await _local.cacheUserData(
          uid: user.uid,
          name: remoteUserData.name,
          group: remoteUserData.group,
          role: remoteUserData.role,
          subgroup: remoteUserData.subgroup,
        );
      }
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
      await _remote.signUp(email, password, name, group, subgroup, role);

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not found');
      }
      final localUserData = await _local.getUserData(user.uid);

      if (localUserData.name == null) {
        final remoteUserData = await _remote.getUserData(user.uid);
        await _local.cacheUserData(
          uid: user.uid,
          name: remoteUserData.name,
          group: remoteUserData.group,
          role: remoteUserData.role,
          subgroup: remoteUserData.subgroup,
        );
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  @override
  Future<void> checkAuthStatus() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not found');
      }

      final localUserData = await _local.getUserData(user.uid);

      if (localUserData.name == null) {
        final remoteUserData = await _remote.getUserData(user.uid);
        await _local.cacheUserData(
          uid: user.uid,
          name: remoteUserData.name,
          group: remoteUserData.group,
          role: remoteUserData.role,
          subgroup: remoteUserData.subgroup,
        );
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError('Sign in with Google not implemented');
  }
}
