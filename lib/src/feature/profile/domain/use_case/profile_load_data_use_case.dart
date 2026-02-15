import 'package:sfu/src/feature/profile/domain/entity/user.dart';

abstract class ProfileLoadDataUseCase {
  Future<User> call();
}