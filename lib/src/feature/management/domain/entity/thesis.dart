import 'package:freezed_annotation/freezed_annotation.dart';

part 'thesis.freezed.dart';

@freezed
abstract class Thesis with _$Thesis {
  const factory Thesis({
    required String id,
    required String title,
    required String teacherId,
    required String teacherName,
    required bool isFree,
    String? takenBy,
    String? takenById,
    @Default('') String description,
    @Default(1) int maxStudents,
    @Default([]) List<String> tags,
  }) = _Thesis;
}