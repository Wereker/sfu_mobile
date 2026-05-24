// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Lesson {

 int get id; int get groupId; String? get teacherId; String get teacherName; int get day; String get timeStart; String get timeEnd; String get subject; LessonType get type; String get room; String get building; bool get isOnline;
/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonCopyWith<Lesson> get copyWith => _$LessonCopyWithImpl<Lesson>(this as Lesson, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lesson&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.day, day) || other.day == day)&&(identical(other.timeStart, timeStart) || other.timeStart == timeStart)&&(identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.type, type) || other.type == type)&&(identical(other.room, room) || other.room == room)&&(identical(other.building, building) || other.building == building)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}


@override
int get hashCode => Object.hash(runtimeType,id,groupId,teacherId,teacherName,day,timeStart,timeEnd,subject,type,room,building,isOnline);

@override
String toString() {
  return 'Lesson(id: $id, groupId: $groupId, teacherId: $teacherId, teacherName: $teacherName, day: $day, timeStart: $timeStart, timeEnd: $timeEnd, subject: $subject, type: $type, room: $room, building: $building, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class $LessonCopyWith<$Res>  {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) _then) = _$LessonCopyWithImpl;
@useResult
$Res call({
 int id, int groupId, String? teacherId, String teacherName, int day, String timeStart, String timeEnd, String subject, LessonType type, String room, String building, bool isOnline
});




}
/// @nodoc
class _$LessonCopyWithImpl<$Res>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._self, this._then);

  final Lesson _self;
  final $Res Function(Lesson) _then;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? groupId = null,Object? teacherId = freezed,Object? teacherName = null,Object? day = null,Object? timeStart = null,Object? timeEnd = null,Object? subject = null,Object? type = null,Object? room = null,Object? building = null,Object? isOnline = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,timeStart: null == timeStart ? _self.timeStart : timeStart // ignore: cast_nullable_to_non_nullable
as String,timeEnd: null == timeEnd ? _self.timeEnd : timeEnd // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LessonType,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String,building: null == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Lesson].
extension LessonPatterns on Lesson {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lesson value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lesson() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lesson value)  $default,){
final _that = this;
switch (_that) {
case _Lesson():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lesson value)?  $default,){
final _that = this;
switch (_that) {
case _Lesson() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int groupId,  String? teacherId,  String teacherName,  int day,  String timeStart,  String timeEnd,  String subject,  LessonType type,  String room,  String building,  bool isOnline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lesson() when $default != null:
return $default(_that.id,_that.groupId,_that.teacherId,_that.teacherName,_that.day,_that.timeStart,_that.timeEnd,_that.subject,_that.type,_that.room,_that.building,_that.isOnline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int groupId,  String? teacherId,  String teacherName,  int day,  String timeStart,  String timeEnd,  String subject,  LessonType type,  String room,  String building,  bool isOnline)  $default,) {final _that = this;
switch (_that) {
case _Lesson():
return $default(_that.id,_that.groupId,_that.teacherId,_that.teacherName,_that.day,_that.timeStart,_that.timeEnd,_that.subject,_that.type,_that.room,_that.building,_that.isOnline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int groupId,  String? teacherId,  String teacherName,  int day,  String timeStart,  String timeEnd,  String subject,  LessonType type,  String room,  String building,  bool isOnline)?  $default,) {final _that = this;
switch (_that) {
case _Lesson() when $default != null:
return $default(_that.id,_that.groupId,_that.teacherId,_that.teacherName,_that.day,_that.timeStart,_that.timeEnd,_that.subject,_that.type,_that.room,_that.building,_that.isOnline);case _:
  return null;

}
}

}

/// @nodoc


class _Lesson implements Lesson {
  const _Lesson({required this.id, required this.groupId, this.teacherId, required this.teacherName, required this.day, required this.timeStart, required this.timeEnd, required this.subject, required this.type, required this.room, required this.building, required this.isOnline});
  

@override final  int id;
@override final  int groupId;
@override final  String? teacherId;
@override final  String teacherName;
@override final  int day;
@override final  String timeStart;
@override final  String timeEnd;
@override final  String subject;
@override final  LessonType type;
@override final  String room;
@override final  String building;
@override final  bool isOnline;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonCopyWith<_Lesson> get copyWith => __$LessonCopyWithImpl<_Lesson>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lesson&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.day, day) || other.day == day)&&(identical(other.timeStart, timeStart) || other.timeStart == timeStart)&&(identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.type, type) || other.type == type)&&(identical(other.room, room) || other.room == room)&&(identical(other.building, building) || other.building == building)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}


@override
int get hashCode => Object.hash(runtimeType,id,groupId,teacherId,teacherName,day,timeStart,timeEnd,subject,type,room,building,isOnline);

@override
String toString() {
  return 'Lesson(id: $id, groupId: $groupId, teacherId: $teacherId, teacherName: $teacherName, day: $day, timeStart: $timeStart, timeEnd: $timeEnd, subject: $subject, type: $type, room: $room, building: $building, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class _$LessonCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$LessonCopyWith(_Lesson value, $Res Function(_Lesson) _then) = __$LessonCopyWithImpl;
@override @useResult
$Res call({
 int id, int groupId, String? teacherId, String teacherName, int day, String timeStart, String timeEnd, String subject, LessonType type, String room, String building, bool isOnline
});




}
/// @nodoc
class __$LessonCopyWithImpl<$Res>
    implements _$LessonCopyWith<$Res> {
  __$LessonCopyWithImpl(this._self, this._then);

  final _Lesson _self;
  final $Res Function(_Lesson) _then;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? groupId = null,Object? teacherId = freezed,Object? teacherName = null,Object? day = null,Object? timeStart = null,Object? timeEnd = null,Object? subject = null,Object? type = null,Object? room = null,Object? building = null,Object? isOnline = null,}) {
  return _then(_Lesson(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,timeStart: null == timeStart ? _self.timeStart : timeStart // ignore: cast_nullable_to_non_nullable
as String,timeEnd: null == timeEnd ? _self.timeEnd : timeEnd // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LessonType,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String,building: null == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
