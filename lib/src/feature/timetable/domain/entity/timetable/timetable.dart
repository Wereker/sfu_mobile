import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/data/DTO/timetable_dto/timetable_dto.dart';
import 'package:sfu/src/feature/timetable/domain/entity/week/week.dart';

part 'timetable.freezed.dart';

@freezed
abstract class Timetable with _$Timetable {
  const factory Timetable({
    required String target,
    required String type,
    required String institute,
    required List<Week> weeks,
  }) = _Timetable;

  static Timetable fromDTO(TimetableDTO dto) => Timetable(
    target: dto.target,
    type: dto.type,
    institute: dto.institute,
    weeks: dto.weeks.map((week) => Week.fromDTO(week)).toList(),
  );
}
