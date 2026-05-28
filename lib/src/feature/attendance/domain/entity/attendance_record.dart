import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_record.freezed.dart';

@freezed
abstract class AttendanceRecord with _$AttendanceRecord {
  const factory AttendanceRecord({
    // — с сервера —
    required String id,
    required String lessonId,
    required String studentId,
    required String markedVia,   // 'qr' | 'manual'
    required DateTime createdAt,

    // — синтетика —
    @Default('') String lessonSubject,   // название предмета из расписания
    @Default('') String lessonTime,      // время пары
    @Default('') String studentName,     // имя студента из mock-списка
  }) = _AttendanceRecord;
}