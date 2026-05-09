import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/check_auth_status_use_case.dart';
import 'package:sfu/src/core/error/exception_handler.dart';

class CheckAuthStatusUseCaseImpl implements CheckAuthStatusUseCase {
  final AuthRepository _repo;
  const CheckAuthStatusUseCaseImpl(this._repo);

  @override
  Future<void> call() => ExceptionHandler.handle(_repo.checkAuthStatus);
}