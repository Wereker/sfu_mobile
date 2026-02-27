import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_up_use_case.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  final AuthRepository authRepo;

  const SignUpUseCaseImpl(this.authRepo);

  @override
  Future<bool> call({
    required String email,
    required String password1,
    required String password2,
    required String name,
    required String role,
    required String group,
  }) async {
    if (password1 != password2) {
      throw Exception();
    }

    final parts = group.split('(');
    final shortGroup = parts[0].trim();
    final subgroup = parts[1].replaceAll(')', '').trim();

    return await authRepo.signUp(
      email: email,
      password: password1,
      name: name,
      group: shortGroup,
      subgroup: subgroup,
      role: role,
    );
  }
}
