// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceRecord {

// — с сервера —
 String get id; String get lessonId; String get studentId; String get markedVia;// 'qr' | 'manual'
 DateTime get createdAt;// — синтетика —
 String get lessonSubject;// название предмета из расписания
 String get lessonTime;// время пары
 String get studentName;
/// Create a copy of AttendanceRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceRecordCopyWith<AttendanceRecord> get copyWith => _$AttendanceRecordCopyWithImpl<AttendanceRecord>(this as AttendanceRecord, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.markedVia, markedVia) || other.markedVia == markedVia)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lessonSubject, lessonSubject) || other.lessonSubject == lessonSubject)&&(identical(other.lessonTime, lessonTime) || other.lessonTime == lessonTime)&&(identical(other.studentName, studentName) || other.studentName == studentName));
}


@override
int get hashCode => Object.hash(runtimeType,id,lessonId,studentId,markedVia,createdAt,lessonSubject,lessonTime,studentName);

@override
String toString() {
  return 'AttendanceRecord(id: $id, lessonId: $lessonId, studentId: $studentId, markedVia: $markedVia, createdAt: $createdAt, lessonSubject: $lessonSubject, lessonTime: $lessonTime, studentName: $studentName)';
}


}

/// @nodoc
abstract mixin class $AttendanceRecordCopyWith<$Res>  {
  factory $AttendanceRecordCopyWith(AttendanceRecord value, $Res Function(AttendanceRecord) _then) = _$AttendanceRecordCopyWithImpl;
@useResult
$Res call({
 String id, String lessonId, String studentId, String markedVia, DateTime createdAt, String lessonSubject, String lessonTime, String studentName
});




}
/// @nodoc
class _$AttendanceRecordCopyWithImpl<$Res>
    implements $AttendanceRecordCopyWith<$Res> {
  _$AttendanceRecordCopyWithImpl(this._self, this._then);

  final AttendanceRecord _self;
  final $Res Function(AttendanceRecord) _then;

/// Create a copy of AttendanceRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lessonId = null,Object? studentId = null,Object? markedVia = null,Object? createdAt = null,Object? lessonSubject = null,Object? lessonTime = null,Object? studentName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,markedVia: null == markedVia ? _self.markedVia : markedVia // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lessonSubject: null == lessonSubject ? _self.lessonSubject : lessonSubject // ignore: cast_nullable_to_non_nullable
as String,lessonTime: null == lessonTime ? _self.lessonTime : lessonTime // ignore: cast_nullable_to_non_nullable
as String,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceRecord].
extension AttendanceRecordPatterns on AttendanceRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceRecord value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceRecord value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String lessonId,  String studentId,  String markedVia,  DateTime createdAt,  String lessonSubject,  String lessonTime,  String studentName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceRecord() when $default != null:
return $default(_that.id,_that.lessonId,_that.studentId,_that.markedVia,_that.createdAt,_that.lessonSubject,_that.lessonTime,_that.studentName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String lessonId,  String studentId,  String markedVia,  DateTime createdAt,  String lessonSubject,  String lessonTime,  String studentName)  $default,) {final _that = this;
switch (_that) {
case _AttendanceRecord():
return $default(_that.id,_that.lessonId,_that.studentId,_that.markedVia,_that.createdAt,_that.lessonSubject,_that.lessonTime,_that.studentName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String lessonId,  String studentId,  String markedVia,  DateTime createdAt,  String lessonSubject,  String lessonTime,  String studentName)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceRecord() when $default != null:
return $default(_that.id,_that.lessonId,_that.studentId,_that.markedVia,_that.createdAt,_that.lessonSubject,_that.lessonTime,_that.studentName);case _:
  return null;

}
}

}

/// @nodoc


class _AttendanceRecord implements AttendanceRecord {
  const _AttendanceRecord({required this.id, required this.lessonId, required this.studentId, required this.markedVia, required this.createdAt, this.lessonSubject = '', this.lessonTime = '', this.studentName = ''});
  

// — с сервера —
@override final  String id;
@override final  String lessonId;
@override final  String studentId;
@override final  String markedVia;
// 'qr' | 'manual'
@override final  DateTime createdAt;
// — синтетика —
@override@JsonKey() final  String lessonSubject;
// название предмета из расписания
@override@JsonKey() final  String lessonTime;
// время пары
@override@JsonKey() final  String studentName;

/// Create a copy of AttendanceRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceRecordCopyWith<_AttendanceRecord> get copyWith => __$AttendanceRecordCopyWithImpl<_AttendanceRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.markedVia, markedVia) || other.markedVia == markedVia)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lessonSubject, lessonSubject) || other.lessonSubject == lessonSubject)&&(identical(other.lessonTime, lessonTime) || other.lessonTime == lessonTime)&&(identical(other.studentName, studentName) || other.studentName == studentName));
}


@override
int get hashCode => Object.hash(runtimeType,id,lessonId,studentId,markedVia,createdAt,lessonSubject,lessonTime,studentName);

@override
String toString() {
  return 'AttendanceRecord(id: $id, lessonId: $lessonId, studentId: $studentId, markedVia: $markedVia, createdAt: $createdAt, lessonSubject: $lessonSubject, lessonTime: $lessonTime, studentName: $studentName)';
}


}

/// @nodoc
abstract mixin class _$AttendanceRecordCopyWith<$Res> implements $AttendanceRecordCopyWith<$Res> {
  factory _$AttendanceRecordCopyWith(_AttendanceRecord value, $Res Function(_AttendanceRecord) _then) = __$AttendanceRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String lessonId, String studentId, String markedVia, DateTime createdAt, String lessonSubject, String lessonTime, String studentName
});




}
/// @nodoc
class __$AttendanceRecordCopyWithImpl<$Res>
    implements _$AttendanceRecordCopyWith<$Res> {
  __$AttendanceRecordCopyWithImpl(this._self, this._then);

  final _AttendanceRecord _self;
  final $Res Function(_AttendanceRecord) _then;

/// Create a copy of AttendanceRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lessonId = null,Object? studentId = null,Object? markedVia = null,Object? createdAt = null,Object? lessonSubject = null,Object? lessonTime = null,Object? studentName = null,}) {
  return _then(_AttendanceRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,markedVia: null == markedVia ? _self.markedVia : markedVia // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lessonSubject: null == lessonSubject ? _self.lessonSubject : lessonSubject // ignore: cast_nullable_to_non_nullable
as String,lessonTime: null == lessonTime ? _self.lessonTime : lessonTime // ignore: cast_nullable_to_non_nullable
as String,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
