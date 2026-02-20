import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';
import 'package:sfu/src/feature/profile/domain/use_case/profile_load_data_use_case.dart';

class ProfileLoadDataUseCaseImpl implements ProfileLoadDataUseCase {
  final ProfileRepository profileRepo;

  const ProfileLoadDataUseCaseImpl(this.profileRepo);

  @override
  Future<User> call() async {
    return await profileRepo.loadData();
  }
}