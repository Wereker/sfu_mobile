import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryMock implements ProfileRepository {
  const ProfileRepositoryMock();

  @override
  Future<User> loadData() async {
    return User(
      id: '1',
      firstName: 'Тарас',
      lastName: 'Бубля',
      phone: '89133451825',
      role: 'student',
      institute: 'ИКИТ',
      group: 'КИ22-13Б',
      subgroup: '1 подгруппа',
      recordBookNumber: '032049803',
    );
  }
}
