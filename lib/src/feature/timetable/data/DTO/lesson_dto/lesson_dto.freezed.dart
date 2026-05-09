// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LessonDTO {

 String get id; String get day;@JsonKey(name: 'time_start') String get timeStart;@JsonKey(name: 'time_end') String get timeEnd; String get subject;@JsonKey(name: 'lesson_type') String get type; String get place; String get building; String get room; String get teacher;@JsonKey(name: 'teacher_id') String? get teacherId; List<String> get groups; String get sync;
/// Create a copy of LessonDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonDTOCopyWith<LessonDTO> get copyWith => _$LessonDTOCopyWithImpl<LessonDTO>(this as LessonDTO, _$identity);

  /// Serializes this LessonDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.day, day) || other.day == day)&&(identical(other.timeStart, timeStart) || other.timeStart == timeStart)&&(identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.type, type) || other.type == type)&&(identical(other.place, place) || other.place == place)&&(identical(other.building, building) || other.building == building)&&(identical(other.room, room) || other.room == room)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&const DeepCollectionEquality().equals(other.groups, groups)&&(identical(other.sync, sync) || other.sync == sync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,day,timeStart,timeEnd,subject,type,place,building,room,teacher,teacherId,const DeepCollectionEquality().hash(groups),sync);

@override
String toString() {
  return 'LessonDTO(id: $id, day: $day, timeStart: $timeStart, timeEnd: $timeEnd, subject: $subject, type: $type, place: $place, building: $building, room: $room, teacher: $teacher, teacherId: $teacherId, groups: $groups, sync: $sync)';
}


}

/// @nodoc
abstract mixin class $LessonDTOCopyWith<$Res>  {
  factory $LessonDTOCopyWith(LessonDTO value, $Res Function(LessonDTO) _then) = _$LessonDTOCopyWithImpl;
@useResult
$Res call({
 String id, String day,@JsonKey(name: 'time_start') String timeStart,@JsonKey(name: 'time_end') String timeEnd, String subject,@JsonKey(name: 'lesson_type') String type, String place, String building, String room, String teacher,@JsonKey(name: 'teacher_id') String? teacherId, List<String> groups, String sync
});




}
/// @nodoc
class _$LessonDTOCopyWithImpl<$Res>
    implements $LessonDTOCopyWith<$Res> {
  _$LessonDTOCopyWithImpl(this._self, this._then);

  final LessonDTO _self;
  final $Res Function(LessonDTO) _then;

/// Create a copy of LessonDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? day = null,Object? timeStart = null,Object? timeEnd = null,Object? subject = null,Object? type = null,Object? place = null,Object? building = null,Object? room = null,Object? teacher = null,Object? teacherId = freezed,Object? groups = null,Object? sync = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,timeStart: null == timeStart ? _self.timeStart : timeStart // ignore: cast_nullable_to_non_nullable
as String,timeEnd: null == timeEnd ? _self.timeEnd : timeEnd // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,building: null == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<String>,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonDTO].
extension LessonDTOPatterns on LessonDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonDTO value)  $default,){
final _that = this;
switch (_that) {
case _LessonDTO():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonDTO value)?  $default,){
final _that = this;
switch (_that) {
case _LessonDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String day, @JsonKey(name: 'time_start')  String timeStart, @JsonKey(name: 'time_end')  String timeEnd,  String subject, @JsonKey(name: 'lesson_type')  String type,  String place,  String building,  String room,  String teacher, @JsonKey(name: 'teacher_id')  String? teacherId,  List<String> groups,  String sync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonDTO() when $default != null:
return $default(_that.id,_that.day,_that.timeStart,_that.timeEnd,_that.subject,_that.type,_that.place,_that.building,_that.room,_that.teacher,_that.teacherId,_that.groups,_that.sync);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String day, @JsonKey(name: 'time_start')  String timeStart, @JsonKey(name: 'time_end')  String timeEnd,  String subject, @JsonKey(name: 'lesson_type')  String type,  String place,  String building,  String room,  String teacher, @JsonKey(name: 'teacher_id')  String? teacherId,  List<String> groups,  String sync)  $default,) {final _that = this;
switch (_that) {
case _LessonDTO():
return $default(_that.id,_that.day,_that.timeStart,_that.timeEnd,_that.subject,_that.type,_that.place,_that.building,_that.room,_that.teacher,_that.teacherId,_that.groups,_that.sync);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String day, @JsonKey(name: 'time_start')  String timeStart, @JsonKey(name: 'time_end')  String timeEnd,  String subject, @JsonKey(name: 'lesson_type')  String type,  String place,  String building,  String room,  String teacher, @JsonKey(name: 'teacher_id')  String? teacherId,  List<String> groups,  String sync)?  $default,) {final _that = this;
switch (_that) {
case _LessonDTO() when $default != null:
return $default(_that.id,_that.day,_that.timeStart,_that.timeEnd,_that.subject,_that.type,_that.place,_that.building,_that.room,_that.teacher,_that.teacherId,_that.groups,_that.sync);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LessonDTO implements LessonDTO {
  const _LessonDTO({required this.id, required this.day, @JsonKey(name: 'time_start') required this.timeStart, @JsonKey(name: 'time_end') required this.timeEnd, required this.subject, @JsonKey(name: 'lesson_type') this.type = '', this.place = '', this.building = '', this.room = '', this.teacher = '', @JsonKey(name: 'teacher_id') this.teacherId, final  List<String> groups = const [], this.sync = ''}): _groups = groups;
  factory _LessonDTO.fromJson(Map<String, dynamic> json) => _$LessonDTOFromJson(json);

@override final  String id;
@override final  String day;
@override@JsonKey(name: 'time_start') final  String timeStart;
@override@JsonKey(name: 'time_end') final  String timeEnd;
@override final  String subject;
@override@JsonKey(name: 'lesson_type') final  String type;
@override@JsonKey() final  String place;
@override@JsonKey() final  String building;
@override@JsonKey() final  String room;
@override@JsonKey() final  String teacher;
@override@JsonKey(name: 'teacher_id') final  String? teacherId;
 final  List<String> _groups;
@override@JsonKey() List<String> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

@override@JsonKey() final  String sync;

/// Create a copy of LessonDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonDTOCopyWith<_LessonDTO> get copyWith => __$LessonDTOCopyWithImpl<_LessonDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LessonDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.day, day) || other.day == day)&&(identical(other.timeStart, timeStart) || other.timeStart == timeStart)&&(identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.type, type) || other.type == type)&&(identical(other.place, place) || other.place == place)&&(identical(other.building, building) || other.building == building)&&(identical(other.room, room) || other.room == room)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&const DeepCollectionEquality().equals(other._groups, _groups)&&(identical(other.sync, sync) || other.sync == sync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,day,timeStart,timeEnd,subject,type,place,building,room,teacher,teacherId,const DeepCollectionEquality().hash(_groups),sync);

@override
String toString() {
  return 'LessonDTO(id: $id, day: $day, timeStart: $timeStart, timeEnd: $timeEnd, subject: $subject, type: $type, place: $place, building: $building, room: $room, teacher: $teacher, teacherId: $teacherId, groups: $groups, sync: $sync)';
}


}

/// @nodoc
abstract mixin class _$LessonDTOCopyWith<$Res> implements $LessonDTOCopyWith<$Res> {
  factory _$LessonDTOCopyWith(_LessonDTO value, $Res Function(_LessonDTO) _then) = __$LessonDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String day,@JsonKey(name: 'time_start') String timeStart,@JsonKey(name: 'time_end') String timeEnd, String subject,@JsonKey(name: 'lesson_type') String type, String place, String building, String room, String teacher,@JsonKey(name: 'teacher_id') String? teacherId, List<String> groups, String sync
});




}
/// @nodoc
class __$LessonDTOCopyWithImpl<$Res>
    implements _$LessonDTOCopyWith<$Res> {
  __$LessonDTOCopyWithImpl(this._self, this._then);

  final _LessonDTO _self;
  final $Res Function(_LessonDTO) _then;

/// Create a copy of LessonDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? day = null,Object? timeStart = null,Object? timeEnd = null,Object? subject = null,Object? type = null,Object? place = null,Object? building = null,Object? room = null,Object? teacher = null,Object? teacherId = freezed,Object? groups = null,Object? sync = null,}) {
  return _then(_LessonDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,timeStart: null == timeStart ? _self.timeStart : timeStart // ignore: cast_nullable_to_non_nullable
as String,timeEnd: null == timeEnd ? _self.timeEnd : timeEnd // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,building: null == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<String>,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
