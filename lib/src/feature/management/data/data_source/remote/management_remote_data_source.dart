import 'package:sfu/src/feature/management/data/dto/managed_student_dto.dart';
import 'package:sfu/src/feature/management/data/dto/thesis_dto.dart';

abstract class ManagementRemoteDataSource {
  Future<List<ManagedStudentDTO>> getStudents({
    String? stream,
    String? groupId,
    String? search,
  });
  Future<List<ThesisDTO>> getMyTheses();
  Future<ThesisDTO> createThesis(String title);
  Future<ThesisDTO> updateThesis(String id, {String? title, bool? isFree});

  // POST /events
  Future<void> createEvent({
    required String title,
    required String annotation,
    required String startsAt,
    required String endsAt,
    required int roomId,
  });

  // POST /announcements
  Future<void> createAnnouncement({
    required String title,
    required String content,
    required String publishAt,
    required String expiresAt,
    required List<int> targetGroupIds,
    required List<int> targetStreamIds,
  });
}