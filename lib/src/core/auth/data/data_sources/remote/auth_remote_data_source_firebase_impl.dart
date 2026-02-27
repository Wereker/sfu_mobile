import 'package:sfu/src/core/auth/data/DTO/token_dto.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSourceFirebaseImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<TokenDTO> signIn(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return TokenDTO(
      access: userCredential.user!.uid,
      refresh: '',
      type: 'Firebase',
      expires: '3600',
    );
  }

  @override
  Future<TokenDTO> signUp(
      String email,
      String password,
      String name,
      String group,
      String subgroup,
      String role,
      ) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return TokenDTO(
      access: userCredential.user!.uid,
      refresh: '',
      type: 'Firebase',
      expires: '3600',
    );
  }

  @override
  Future<TokenDTO> resetPassword(String newPassword) {
    throw UnimplementedError('Reset password not supported in Firebase');
  }

  @override
  Future<TokenDTO> refreshToken(String token) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) throw Exception('Not authenticated');
    return TokenDTO(
      access: user.uid,
      refresh: '',
      type: 'Firebase',
      expires: '3600',
    );
  }

  @override
  Future<String> getUserGroup() => Future.value('');
  @override
  Future<String> getUserRole() => Future.value('');
  @override
  Future<String> getUserSubgroup() => Future.value('');
}
