import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';

part 'week.freezed.dart';

@freezed
abstract class Week with _$Week {
  const factory Week({required String week, required List<Lesson> lessons}) =
      _Week;
}
