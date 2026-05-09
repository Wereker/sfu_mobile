import 'package:sfu/src/feature/profile/domain/entity/user.dart';

abstract class GetProfileUseCase {
  Future<User> call();
}
