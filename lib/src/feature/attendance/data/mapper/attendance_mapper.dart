import 'package:sfu/src/feature/attendance/data/dto/attendance_record_dto.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_session_dto.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_session.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';

abstract class AttendanceMapper {
  // Синтетические студенты по реальным DB id
  static const _mockStudents = {
    '4':  ('Иванов Алексей Петрович',   false),
    '7':  ('Соколов Дмитрий Андреевич', true),   // Ст. — из реальных данных
    '2':  ('Белова Мария Ивановна',     false),
    '21': ('Козлов Никита Сергеевич',   false),
    '23': ('Федорова Анна Юрьевна',     false),
  };

  static const _mockLessons = {
    // lesson_id → (subject, time)
    '1': ('Машинное обучение',   '10:15–11:50'),
    '2': ('Глубокое обучение',   '12:00–13:35'),
    '3': ('Компьютерное зрение', '14:10–15:45'),
    '4': ('Анализ данных',       '08:30–10:05'),
    '5': ('Методы проектирования ИС', '15:55–17:30'),
  };

  static AttendanceSession sessionFromDTO(AttendanceSessionDTO dto) =>
      AttendanceSession(
        id: dto.id,
        lessonId: dto.lessonId,
        token: dto.token,
        expiresAt: DateTime.parse(dto.expiresAt),
        isActive: dto.isActive,
      );

  static AttendanceRecord recordFromDTO(AttendanceRecordDTO dto) {
    final lesson  = _mockLessons[dto.lessonId];
    final student = _mockStudents[dto.studentId];

    return AttendanceRecord(
      id: dto.id,
      lessonId: dto.lessonId,
      studentId: dto.studentId,
      markedVia: dto.markedVia,
      createdAt: DateTime.parse(dto.createdAt),
      lessonSubject: lesson?.$1 ?? 'Предмет ${dto.lessonId}',
      lessonTime:    lesson?.$2 ?? '',
      studentName:   student?.$1 ?? 'Студент ${dto.studentId}',
    );
  }

  /// Строим список студентов из mock-данных,
  /// проставляя статус из реальных records с сервера.
  static List<AttendanceStudent> buildStudentList(
      List<AttendanceRecordDTO> records) {
    // Создаём map studentId → record для быстрого поиска
    final markedMap = {
      for (final r in records) r.studentId: r,
    };

    return _mockStudents.entries.map((e) {
      final dbId   = e.key;
      final name   = e.value.$1;
      final isHead = e.value.$2;
      final record = markedMap[dbId];

      return AttendanceStudent(
        id: dbId,
        name: name,
        isHeadman: isHead,
        status: record != null
            ? AttendanceStatus.present
            : AttendanceStatus.absent,
        markedAt: record != null
            ? DateTime.parse(record.createdAt)
            : null,
      );
    }).toList();
  }
}