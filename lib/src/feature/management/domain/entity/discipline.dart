import 'package:freezed_annotation/freezed_annotation.dart';

part 'discipline.freezed.dart';

@freezed
abstract class Discipline with _$Discipline {
  const factory Discipline({
    required String id,
    required String name,
    required String teacherId,
    required String teacherName,
    required int credits,
    required String level,
    required int totalSeats,
    required int takenSeats,
    required bool isEnrolled,
  }) = _Discipline;

  // bool get isFull => takenSeats >= totalSeats;
  // int  get freeSeats => totalSeats - takenSeats;
}
