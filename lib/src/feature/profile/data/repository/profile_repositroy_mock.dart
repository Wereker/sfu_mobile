import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';

class ProfileRepositroyMock implements ProfileRepository {
  @override
  Future<User> loadData() async {
    await Future.delayed(Duration(seconds: 2));

    return User(
      id: '1',
      firstName: 'Тарас',
      lastName: 'Бубля',
      phone: '89133451825',
      role: 'студент',
      institute: 'ИКИТ',
      group: 'КИ22-13Б',
      recordBookNumber: '032049803',
    );
  }
}
