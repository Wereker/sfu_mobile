part of 'students_bloc.dart';

@freezed
abstract class StudentsEvent with _$StudentsEvent {
  const factory StudentsEvent.load({
    String? stream,
    String? groupId,
    String? search,
  }) = _Load;
}