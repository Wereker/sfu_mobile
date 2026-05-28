import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';
import 'package:sfu/src/feature/profile/domain/use_case/upload_avatar_use_case.dart';

class UploadAvatarUseCaseImpl implements UploadAvatarUseCase {
  final ProfileRepository _repo;
  const UploadAvatarUseCaseImpl(this._repo);

  @override
  Future<void> call(String filePath) =>
      ExceptionHandler.handle(() => _repo.uploadAvatar(filePath));
}