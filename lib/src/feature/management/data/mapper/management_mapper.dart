import 'package:sfu/src/feature/management/data/DTO/managed_student_dto.dart';
import 'package:sfu/src/feature/management/data/dto/thesis_dto.dart';
import 'package:sfu/src/feature/management/data/dto/discipline_dto.dart';
import 'package:sfu/src/feature/management/domain/entity/managed_student.dart';
import 'package:sfu/src/feature/management/domain/entity/thesis.dart';
import 'package:sfu/src/feature/management/domain/entity/discipline.dart';

abstract class ManagementMapper {
  static ManagedStudent studentFromDTO(ManagedStudentDTO dto) =>
      ManagedStudent(
        id:        dto.id,
        name:      dto.name,
        groupId:   dto.groupId,
        groupName: dto.groupName,
        stream:    dto.stream,
        isHeadman: dto.isHeadman,
        phone:     dto.phone,
        telegram:  dto.telegram,
        email:     dto.email,
        avatarUrl: dto.avatarUrl,
      );

  static Thesis thesisFromDTO(ThesisDTO dto) => Thesis(
    id:          dto.id,
    title:       dto.title,
    teacherId:   dto.teacherId,
    teacherName: dto.teacherName,
    isFree:      dto.isFree,
    takenBy:     dto.takenBy,
    takenById:   dto.takenById,
  );

  static Discipline disciplineFromDTO(DisciplineDTO dto) => Discipline(
    id:          dto.id,
    name:        dto.name,
    teacherId:   dto.teacherId,
    teacherName: dto.teacherName,
    credits:     dto.credits,
    level:       dto.level,
    totalSeats:  dto.totalSeats,
    takenSeats:  dto.takenSeats,
    isEnrolled:  dto.isEnrolled,
  );
}