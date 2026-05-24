import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/domain/entity/week/week.dart';

part 'timetable.freezed.dart';

@freezed
abstract class Timetable with _$Timetable {
  const factory Timetable({
    required int groupId,
    required Week week1,
    required Week week2,
  }) = _Timetable;
}
