import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';

@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({
    required int id,
    required int groupId,
    String? teacherId,
    required String teacherName,
    required int day,
    required String timeStart,
    required String timeEnd,
    required String subject,
    required LessonType type,
    required String room,
    required String building,
    required bool isOnline,
  }) = _Lesson;
}

enum LessonType { lecture, practice, lab, unknown }
