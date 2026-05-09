import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/logout_use_case.dart';
import 'package:sfu/src/core/error/exception_handler.dart';

class LogoutUseCaseImpl implements LogoutUseCase {
  final AuthRepository _repo;
  const LogoutUseCaseImpl(this._repo);

  @override
  Future<void> call() => ExceptionHandler.handle(_repo.logout);
}