import 'package:sfu/src/feature/management/domain/entity/managed_student.dart';
import 'package:sfu/src/feature/management/domain/entity/thesis.dart';

abstract class ManagementRepository {
  Future<List<ManagedStudent>> getStudents({
    String? stream,
    String? groupId,
    String? search,
  });
  Future<List<Thesis>> getMyTheses();
  Future<Thesis> createThesis(String title);
  Future<Thesis> updateThesis(String id, {String? title, bool? isFree});

  Future<void> createAnnouncement({
    required String title,
    required String content,
    required String publishAt,
    required String expiresAt,
    required List<int> targetGroupIds,
    required List<int> targetStreamIds,
  });

  Future<void> createEvent({
    required String title,
    required String annotation,
    required String startsAt,
    required String endsAt,
    required int roomId,
  });
}
