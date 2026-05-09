import 'package:sfu/src/feature/management/domain/entity/managed_student.dart';

abstract class GetStudentsUseCase {
  Future<List<ManagedStudent>> call({
    String? stream,
    String? groupId,
    String? search,
  });
}