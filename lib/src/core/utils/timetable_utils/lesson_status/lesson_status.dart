import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_status.freezed.dart';

@freezed
abstract class LessonStatus with _$LessonStatus {
  const factory LessonStatus.notToday() = _NotToday;
  const factory LessonStatus.finished() = _Finished;
  const factory LessonStatus.willStartIn({required int minutes}) = _WillStartIn;
  const factory LessonStatus.inProgress({required int minutes}) = _InProgress;
  const factory LessonStatus.willEndIn({required int minutes}) = _WillEndIn;
}