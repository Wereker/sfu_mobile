import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:sfu/src/feature/profile/data/mapper/user_mapper.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryMock implements ProfileRepository {
  final ProfileRemoteDataSource _remote;

  const ProfileRepositoryMock(this._remote);

  @override
  Future<User> loadData() async {
    return ExceptionHandler.handle(() async {
      final dto = await _remote.getProfile();
      return UserMapper.fromDTO(dto);
    });
  }
}