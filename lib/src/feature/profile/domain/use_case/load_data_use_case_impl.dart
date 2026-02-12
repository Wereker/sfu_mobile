import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';
import 'package:sfu/src/feature/profile/domain/use_case/load_data_use_case.dart';

class LoadDataUseCaseImpl implements LoadDataUseCase {
  final ProfileRepository profileRepo;

  const LoadDataUseCaseImpl(this.profileRepo);

  @override
  Future<User> call() async {
    return await profileRepo.loadData();
  }
}