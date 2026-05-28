import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';
import 'package:sfu/src/feature/profile/domain/use_case/get_profile_use_case.dart';

class GetProfileUseCaseImpl implements GetProfileUseCase {
  final ProfileRepository _repo;
  const GetProfileUseCaseImpl(this._repo);

  @override
  Future<User> call() => ExceptionHandler.handle(_repo.getProfile);
}
