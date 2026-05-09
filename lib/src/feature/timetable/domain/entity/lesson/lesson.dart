import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';

@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({
    required String id,
    required String day,
    required String time,
    required String teacher,
    String?   teacherId,
    required String subject,
    required String type,
    required String place,
    required String building,
    required List<String> groups,
    required String sync,
  }) = _Lesson;
}
