import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryMock implements ProfileRepository {
  final AuthLocalDataSource _authLocale;

  const ProfileRepositoryMock(this._authLocale);

  @override
  Future<User> loadData() async {
    return User(
      id: '1',
      firstName: 'Тарас',
      lastName: 'Бубля',
      phone: '89133451825',
      role: await _authLocale.getUserRole() ?? '',
      institute: 'ИКИТ',
      group: await _authLocale.getUserGroup() ?? '',
      subgroup: await _authLocale.getUserSubgroup() ?? '',
      recordBookNumber: '032049803',
    );
  }
}
