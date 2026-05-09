part of 'theses_bloc.dart';

@freezed
class ThesesEvent with _$ThesesEvent {
  const factory ThesesEvent.load() = _Load;
  const factory ThesesEvent.create(String title) = _Create;
  const factory ThesesEvent.update(String id, {String? title, bool? isFree}) =
      _Update;
}
