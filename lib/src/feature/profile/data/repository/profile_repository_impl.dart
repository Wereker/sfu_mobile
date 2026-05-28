import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:sfu/src/feature/profile/data/mapper/user_mapper.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remote;

  const ProfileRepositoryImpl(this._remote);

  @override
  Future<User> getProfile() => ExceptionHandler.handle(() async {
    final dto = await _remote.getProfile();
    final user = UserMapper.fromDTO(dto);
    final avatarUrl = await _remote.getAvatarUrl(user.id);
    return user.copyWith(avatarUrl: avatarUrl);
  });

  @override
  Future<String> getAvatarUrl(int userId) => _remote.getAvatarUrl(userId);

  @override
  Future<void> uploadAvatar(String filePath) =>
      ExceptionHandler.handle(() => _remote.uploadAvatar(filePath));
}