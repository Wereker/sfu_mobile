// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceStudent {

 String get id; String get name; bool get isHeadman; AttendanceStatus get status; DateTime? get markedAt;
/// Create a copy of AttendanceStudent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceStudentCopyWith<AttendanceStudent> get copyWith => _$AttendanceStudentCopyWithImpl<AttendanceStudent>(this as AttendanceStudent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceStudent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isHeadman, isHeadman) || other.isHeadman == isHeadman)&&(identical(other.status, status) || other.status == status)&&(identical(other.markedAt, markedAt) || other.markedAt == markedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,isHeadman,status,markedAt);

@override
String toString() {
  return 'AttendanceStudent(id: $id, name: $name, isHeadman: $isHeadman, status: $status, markedAt: $markedAt)';
}


}

/// @nodoc
abstract mixin class $AttendanceStudentCopyWith<$Res>  {
  factory $AttendanceStudentCopyWith(AttendanceStudent value, $Res Function(AttendanceStudent) _then) = _$AttendanceStudentCopyWithImpl;
@useResult
$Res call({
 String id, String name, bool isHeadman, AttendanceStatus status, DateTime? markedAt
});




}
/// @nodoc
class _$AttendanceStudentCopyWithImpl<$Res>
    implements $AttendanceStudentCopyWith<$Res> {
  _$AttendanceStudentCopyWithImpl(this._self, this._then);

  final AttendanceStudent _self;
  final $Res Function(AttendanceStudent) _then;

/// Create a copy of AttendanceStudent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? isHeadman = null,Object? status = null,Object? markedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isHeadman: null == isHeadman ? _self.isHeadman : isHeadman // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus,markedAt: freezed == markedAt ? _self.markedAt : markedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceStudent].
extension AttendanceStudentPatterns on AttendanceStudent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceStudent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceStudent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceStudent value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceStudent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceStudent value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceStudent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  bool isHeadman,  AttendanceStatus status,  DateTime? markedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceStudent() when $default != null:
return $default(_that.id,_that.name,_that.isHeadman,_that.status,_that.markedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  bool isHeadman,  AttendanceStatus status,  DateTime? markedAt)  $default,) {final _that = this;
switch (_that) {
case _AttendanceStudent():
return $default(_that.id,_that.name,_that.isHeadman,_that.status,_that.markedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  bool isHeadman,  AttendanceStatus status,  DateTime? markedAt)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceStudent() when $default != null:
return $default(_that.id,_that.name,_that.isHeadman,_that.status,_that.markedAt);case _:
  return null;

}
}

}

/// @nodoc


class _AttendanceStudent implements AttendanceStudent {
  const _AttendanceStudent({required this.id, required this.name, this.isHeadman = false, this.status = AttendanceStatus.absent, this.markedAt});
  

@override final  String id;
@override final  String name;
@override@JsonKey() final  bool isHeadman;
@override@JsonKey() final  AttendanceStatus status;
@override final  DateTime? markedAt;

/// Create a copy of AttendanceStudent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceStudentCopyWith<_AttendanceStudent> get copyWith => __$AttendanceStudentCopyWithImpl<_AttendanceStudent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceStudent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isHeadman, isHeadman) || other.isHeadman == isHeadman)&&(identical(other.status, status) || other.status == status)&&(identical(other.markedAt, markedAt) || other.markedAt == markedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,isHeadman,status,markedAt);

@override
String toString() {
  return 'AttendanceStudent(id: $id, name: $name, isHeadman: $isHeadman, status: $status, markedAt: $markedAt)';
}


}

/// @nodoc
abstract mixin class _$AttendanceStudentCopyWith<$Res> implements $AttendanceStudentCopyWith<$Res> {
  factory _$AttendanceStudentCopyWith(_AttendanceStudent value, $Res Function(_AttendanceStudent) _then) = __$AttendanceStudentCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, bool isHeadman, AttendanceStatus status, DateTime? markedAt
});




}
/// @nodoc
class __$AttendanceStudentCopyWithImpl<$Res>
    implements _$AttendanceStudentCopyWith<$Res> {
  __$AttendanceStudentCopyWithImpl(this._self, this._then);

  final _AttendanceStudent _self;
  final $Res Function(_AttendanceStudent) _then;

/// Create a copy of AttendanceStudent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? isHeadman = null,Object? status = null,Object? markedAt = freezed,}) {
  return _then(_AttendanceStudent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isHeadman: null == isHeadman ? _self.isHeadman : isHeadman // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus,markedAt: freezed == markedAt ? _self.markedAt : markedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
