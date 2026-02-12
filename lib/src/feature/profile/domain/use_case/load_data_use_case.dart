import 'package:sfu/src/feature/profile/domain/entity/user.dart';

abstract class LoadDataUseCase {
  Future<User> call();
}