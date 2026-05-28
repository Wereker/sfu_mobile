// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceSession {

 String get id; String get lessonId; String get token; DateTime get expiresAt; bool get isActive;
/// Create a copy of AttendanceSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceSessionCopyWith<AttendanceSession> get copyWith => _$AttendanceSessionCopyWithImpl<AttendanceSession>(this as AttendanceSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceSession&&(identical(other.id, id) || other.id == id)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,lessonId,token,expiresAt,isActive);

@override
String toString() {
  return 'AttendanceSession(id: $id, lessonId: $lessonId, token: $token, expiresAt: $expiresAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $AttendanceSessionCopyWith<$Res>  {
  factory $AttendanceSessionCopyWith(AttendanceSession value, $Res Function(AttendanceSession) _then) = _$AttendanceSessionCopyWithImpl;
@useResult
$Res call({
 String id, String lessonId, String token, DateTime expiresAt, bool isActive
});




}
/// @nodoc
class _$AttendanceSessionCopyWithImpl<$Res>
    implements $AttendanceSessionCopyWith<$Res> {
  _$AttendanceSessionCopyWithImpl(this._self, this._then);

  final AttendanceSession _self;
  final $Res Function(AttendanceSession) _then;

/// Create a copy of AttendanceSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lessonId = null,Object? token = null,Object? expiresAt = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceSession].
extension AttendanceSessionPatterns on AttendanceSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceSession value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceSession value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String lessonId,  String token,  DateTime expiresAt,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceSession() when $default != null:
return $default(_that.id,_that.lessonId,_that.token,_that.expiresAt,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String lessonId,  String token,  DateTime expiresAt,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _AttendanceSession():
return $default(_that.id,_that.lessonId,_that.token,_that.expiresAt,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String lessonId,  String token,  DateTime expiresAt,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceSession() when $default != null:
return $default(_that.id,_that.lessonId,_that.token,_that.expiresAt,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class _AttendanceSession extends AttendanceSession {
  const _AttendanceSession({required this.id, required this.lessonId, required this.token, required this.expiresAt, required this.isActive}): super._();
  

@override final  String id;
@override final  String lessonId;
@override final  String token;
@override final  DateTime expiresAt;
@override final  bool isActive;

/// Create a copy of AttendanceSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceSessionCopyWith<_AttendanceSession> get copyWith => __$AttendanceSessionCopyWithImpl<_AttendanceSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceSession&&(identical(other.id, id) || other.id == id)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,lessonId,token,expiresAt,isActive);

@override
String toString() {
  return 'AttendanceSession(id: $id, lessonId: $lessonId, token: $token, expiresAt: $expiresAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$AttendanceSessionCopyWith<$Res> implements $AttendanceSessionCopyWith<$Res> {
  factory _$AttendanceSessionCopyWith(_AttendanceSession value, $Res Function(_AttendanceSession) _then) = __$AttendanceSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String lessonId, String token, DateTime expiresAt, bool isActive
});




}
/// @nodoc
class __$AttendanceSessionCopyWithImpl<$Res>
    implements _$AttendanceSessionCopyWith<$Res> {
  __$AttendanceSessionCopyWithImpl(this._self, this._then);

  final _AttendanceSession _self;
  final $Res Function(_AttendanceSession) _then;

/// Create a copy of AttendanceSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lessonId = null,Object? token = null,Object? expiresAt = null,Object? isActive = null,}) {
  return _then(_AttendanceSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
