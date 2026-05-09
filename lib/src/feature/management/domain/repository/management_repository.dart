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
    required String body,
    required String audience,
    bool isPinned,
    String? stream,
    String? groupId,
    List<String> tags,
  });
  Future<void> createEvent({
    required String title,
    required String body,
    required String date,
    required String time,
    required String location,
    required int totalSeats,
    required String audience,
    String? stream,
    String? groupId,
    List<String> tags,
  });
}
