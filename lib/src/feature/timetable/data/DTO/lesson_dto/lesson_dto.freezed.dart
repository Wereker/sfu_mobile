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

@JsonKey(fromJson: _intToString) String get id;@JsonKey(name: 'group_id', fromJson: _intToString) String get groupId;@JsonKey(name: 'teacher_id', fromJson: _intToStringNullable) String? get teacherId;@JsonKey(name: 'teacher_name') String? get teacherName;@JsonKey(fromJson: _intToString) String get day;@JsonKey(fromJson: _intToString) String get week;@JsonKey(name: 'time_start') String get timeStart;@JsonKey(name: 'time_end') String get timeEnd; String get subject;@JsonKey(name: 'lesson_type') String get lessonType; String get room; String get building;
/// Create a copy of LessonDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonDTOCopyWith<LessonDTO> get copyWith => _$LessonDTOCopyWithImpl<LessonDTO>(this as LessonDTO, _$identity);

  /// Serializes this LessonDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.day, day) || other.day == day)&&(identical(other.week, week) || other.week == week)&&(identical(other.timeStart, timeStart) || other.timeStart == timeStart)&&(identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.lessonType, lessonType) || other.lessonType == lessonType)&&(identical(other.room, room) || other.room == room)&&(identical(other.building, building) || other.building == building));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,teacherId,teacherName,day,week,timeStart,timeEnd,subject,lessonType,room,building);

@override
String toString() {
  return 'LessonDTO(id: $id, groupId: $groupId, teacherId: $teacherId, teacherName: $teacherName, day: $day, week: $week, timeStart: $timeStart, timeEnd: $timeEnd, subject: $subject, lessonType: $lessonType, room: $room, building: $building)';
}


}

/// @nodoc
abstract mixin class $LessonDTOCopyWith<$Res>  {
  factory $LessonDTOCopyWith(LessonDTO value, $Res Function(LessonDTO) _then) = _$LessonDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intToString) String id,@JsonKey(name: 'group_id', fromJson: _intToString) String groupId,@JsonKey(name: 'teacher_id', fromJson: _intToStringNullable) String? teacherId,@JsonKey(name: 'teacher_name') String? teacherName,@JsonKey(fromJson: _intToString) String day,@JsonKey(fromJson: _intToString) String week,@JsonKey(name: 'time_start') String timeStart,@JsonKey(name: 'time_end') String timeEnd, String subject,@JsonKey(name: 'lesson_type') String lessonType, String room, String building
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? groupId = null,Object? teacherId = freezed,Object? teacherName = freezed,Object? day = null,Object? week = null,Object? timeStart = null,Object? timeEnd = null,Object? subject = null,Object? lessonType = null,Object? room = null,Object? building = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,teacherName: freezed == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String?,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,timeStart: null == timeStart ? _self.timeStart : timeStart // ignore: cast_nullable_to_non_nullable
as String,timeEnd: null == timeEnd ? _self.timeEnd : timeEnd // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,lessonType: null == lessonType ? _self.lessonType : lessonType // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String,building: null == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'group_id', fromJson: _intToString)  String groupId, @JsonKey(name: 'teacher_id', fromJson: _intToStringNullable)  String? teacherId, @JsonKey(name: 'teacher_name')  String? teacherName, @JsonKey(fromJson: _intToString)  String day, @JsonKey(fromJson: _intToString)  String week, @JsonKey(name: 'time_start')  String timeStart, @JsonKey(name: 'time_end')  String timeEnd,  String subject, @JsonKey(name: 'lesson_type')  String lessonType,  String room,  String building)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonDTO() when $default != null:
return $default(_that.id,_that.groupId,_that.teacherId,_that.teacherName,_that.day,_that.week,_that.timeStart,_that.timeEnd,_that.subject,_that.lessonType,_that.room,_that.building);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'group_id', fromJson: _intToString)  String groupId, @JsonKey(name: 'teacher_id', fromJson: _intToStringNullable)  String? teacherId, @JsonKey(name: 'teacher_name')  String? teacherName, @JsonKey(fromJson: _intToString)  String day, @JsonKey(fromJson: _intToString)  String week, @JsonKey(name: 'time_start')  String timeStart, @JsonKey(name: 'time_end')  String timeEnd,  String subject, @JsonKey(name: 'lesson_type')  String lessonType,  String room,  String building)  $default,) {final _that = this;
switch (_that) {
case _LessonDTO():
return $default(_that.id,_that.groupId,_that.teacherId,_that.teacherName,_that.day,_that.week,_that.timeStart,_that.timeEnd,_that.subject,_that.lessonType,_that.room,_that.building);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'group_id', fromJson: _intToString)  String groupId, @JsonKey(name: 'teacher_id', fromJson: _intToStringNullable)  String? teacherId, @JsonKey(name: 'teacher_name')  String? teacherName, @JsonKey(fromJson: _intToString)  String day, @JsonKey(fromJson: _intToString)  String week, @JsonKey(name: 'time_start')  String timeStart, @JsonKey(name: 'time_end')  String timeEnd,  String subject, @JsonKey(name: 'lesson_type')  String lessonType,  String room,  String building)?  $default,) {final _that = this;
switch (_that) {
case _LessonDTO() when $default != null:
return $default(_that.id,_that.groupId,_that.teacherId,_that.teacherName,_that.day,_that.week,_that.timeStart,_that.timeEnd,_that.subject,_that.lessonType,_that.room,_that.building);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LessonDTO implements LessonDTO {
  const _LessonDTO({@JsonKey(fromJson: _intToString) required this.id, @JsonKey(name: 'group_id', fromJson: _intToString) required this.groupId, @JsonKey(name: 'teacher_id', fromJson: _intToStringNullable) this.teacherId, @JsonKey(name: 'teacher_name') this.teacherName, @JsonKey(fromJson: _intToString) required this.day, @JsonKey(fromJson: _intToString) required this.week, @JsonKey(name: 'time_start') required this.timeStart, @JsonKey(name: 'time_end') required this.timeEnd, required this.subject, @JsonKey(name: 'lesson_type') this.lessonType = '', this.room = '', this.building = ''});
  factory _LessonDTO.fromJson(Map<String, dynamic> json) => _$LessonDTOFromJson(json);

@override@JsonKey(fromJson: _intToString) final  String id;
@override@JsonKey(name: 'group_id', fromJson: _intToString) final  String groupId;
@override@JsonKey(name: 'teacher_id', fromJson: _intToStringNullable) final  String? teacherId;
@override@JsonKey(name: 'teacher_name') final  String? teacherName;
@override@JsonKey(fromJson: _intToString) final  String day;
@override@JsonKey(fromJson: _intToString) final  String week;
@override@JsonKey(name: 'time_start') final  String timeStart;
@override@JsonKey(name: 'time_end') final  String timeEnd;
@override final  String subject;
@override@JsonKey(name: 'lesson_type') final  String lessonType;
@override@JsonKey() final  String room;
@override@JsonKey() final  String building;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.day, day) || other.day == day)&&(identical(other.week, week) || other.week == week)&&(identical(other.timeStart, timeStart) || other.timeStart == timeStart)&&(identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.lessonType, lessonType) || other.lessonType == lessonType)&&(identical(other.room, room) || other.room == room)&&(identical(other.building, building) || other.building == building));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,teacherId,teacherName,day,week,timeStart,timeEnd,subject,lessonType,room,building);

@override
String toString() {
  return 'LessonDTO(id: $id, groupId: $groupId, teacherId: $teacherId, teacherName: $teacherName, day: $day, week: $week, timeStart: $timeStart, timeEnd: $timeEnd, subject: $subject, lessonType: $lessonType, room: $room, building: $building)';
}


}

/// @nodoc
abstract mixin class _$LessonDTOCopyWith<$Res> implements $LessonDTOCopyWith<$Res> {
  factory _$LessonDTOCopyWith(_LessonDTO value, $Res Function(_LessonDTO) _then) = __$LessonDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intToString) String id,@JsonKey(name: 'group_id', fromJson: _intToString) String groupId,@JsonKey(name: 'teacher_id', fromJson: _intToStringNullable) String? teacherId,@JsonKey(name: 'teacher_name') String? teacherName,@JsonKey(fromJson: _intToString) String day,@JsonKey(fromJson: _intToString) String week,@JsonKey(name: 'time_start') String timeStart,@JsonKey(name: 'time_end') String timeEnd, String subject,@JsonKey(name: 'lesson_type') String lessonType, String room, String building
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? groupId = null,Object? teacherId = freezed,Object? teacherName = freezed,Object? day = null,Object? week = null,Object? timeStart = null,Object? timeEnd = null,Object? subject = null,Object? lessonType = null,Object? room = null,Object? building = null,}) {
  return _then(_LessonDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,teacherName: freezed == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String?,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,timeStart: null == timeStart ? _self.timeStart : timeStart // ignore: cast_nullable_to_non_nullable
as String,timeEnd: null == timeEnd ? _self.timeEnd : timeEnd // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,lessonType: null == lessonType ? _self.lessonType : lessonType // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String,building: null == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
