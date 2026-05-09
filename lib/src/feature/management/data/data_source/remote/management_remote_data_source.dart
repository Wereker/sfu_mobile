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
