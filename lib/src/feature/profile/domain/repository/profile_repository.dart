import 'package:sfu/src/feature/profile/domain/entity/user.dart';

abstract class ProfileRepository {
  Future<User> loadData();
}