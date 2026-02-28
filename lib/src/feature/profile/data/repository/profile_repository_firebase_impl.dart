import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryFirebaseImpl implements ProfileRepository {
  final AuthLocalDataSource _locale;

  const ProfileRepositoryFirebaseImpl(this._locale);

  @override
  Future<User> loadData() async {
    final user = firebase_auth.FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    return User(
      id: '1',
      firstName: await _locale.getUserName(user.uid) ?? 'Тарас',
      lastName: 'Бубля',
      phone: '89133451825',
      role: await _locale.getUserRole(user.uid) ?? 'student',
      institute: 'ИКИТ',
      group: await _locale.getUserGroup(user.uid) ?? 'КИ22-13Б',
      subgroup: await _locale.getUserSubgroup(user.uid) ??'1 подгруппа',
      recordBookNumber: '032049803',
    );
  }
}