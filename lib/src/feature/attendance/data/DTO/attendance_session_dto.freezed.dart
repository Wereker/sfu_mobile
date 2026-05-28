// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_session_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceSessionDTO {

@JsonKey(fromJson: _intToString) String get id;@JsonKey(name: 'lesson_id', fromJson: _intToString) String get lessonId; String get token;@JsonKey(name: 'expires_at') String get expiresAt;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of AttendanceSessionDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceSessionDTOCopyWith<AttendanceSessionDTO> get copyWith => _$AttendanceSessionDTOCopyWithImpl<AttendanceSessionDTO>(this as AttendanceSessionDTO, _$identity);

  /// Serializes this AttendanceSessionDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceSessionDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lessonId,token,expiresAt,isActive);

@override
String toString() {
  return 'AttendanceSessionDTO(id: $id, lessonId: $lessonId, token: $token, expiresAt: $expiresAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $AttendanceSessionDTOCopyWith<$Res>  {
  factory $AttendanceSessionDTOCopyWith(AttendanceSessionDTO value, $Res Function(AttendanceSessionDTO) _then) = _$AttendanceSessionDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intToString) String id,@JsonKey(name: 'lesson_id', fromJson: _intToString) String lessonId, String token,@JsonKey(name: 'expires_at') String expiresAt,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$AttendanceSessionDTOCopyWithImpl<$Res>
    implements $AttendanceSessionDTOCopyWith<$Res> {
  _$AttendanceSessionDTOCopyWithImpl(this._self, this._then);

  final AttendanceSessionDTO _self;
  final $Res Function(AttendanceSessionDTO) _then;

/// Create a copy of AttendanceSessionDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lessonId = null,Object? token = null,Object? expiresAt = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceSessionDTO].
extension AttendanceSessionDTOPatterns on AttendanceSessionDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceSessionDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceSessionDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceSessionDTO value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceSessionDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceSessionDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceSessionDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'lesson_id', fromJson: _intToString)  String lessonId,  String token, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceSessionDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'lesson_id', fromJson: _intToString)  String lessonId,  String token, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _AttendanceSessionDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'lesson_id', fromJson: _intToString)  String lessonId,  String token, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceSessionDTO() when $default != null:
return $default(_that.id,_that.lessonId,_that.token,_that.expiresAt,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceSessionDTO implements AttendanceSessionDTO {
  const _AttendanceSessionDTO({@JsonKey(fromJson: _intToString) required this.id, @JsonKey(name: 'lesson_id', fromJson: _intToString) required this.lessonId, required this.token, @JsonKey(name: 'expires_at') required this.expiresAt, @JsonKey(name: 'is_active') this.isActive = true});
  factory _AttendanceSessionDTO.fromJson(Map<String, dynamic> json) => _$AttendanceSessionDTOFromJson(json);

@override@JsonKey(fromJson: _intToString) final  String id;
@override@JsonKey(name: 'lesson_id', fromJson: _intToString) final  String lessonId;
@override final  String token;
@override@JsonKey(name: 'expires_at') final  String expiresAt;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of AttendanceSessionDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceSessionDTOCopyWith<_AttendanceSessionDTO> get copyWith => __$AttendanceSessionDTOCopyWithImpl<_AttendanceSessionDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceSessionDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceSessionDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lessonId,token,expiresAt,isActive);

@override
String toString() {
  return 'AttendanceSessionDTO(id: $id, lessonId: $lessonId, token: $token, expiresAt: $expiresAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$AttendanceSessionDTOCopyWith<$Res> implements $AttendanceSessionDTOCopyWith<$Res> {
  factory _$AttendanceSessionDTOCopyWith(_AttendanceSessionDTO value, $Res Function(_AttendanceSessionDTO) _then) = __$AttendanceSessionDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intToString) String id,@JsonKey(name: 'lesson_id', fromJson: _intToString) String lessonId, String token,@JsonKey(name: 'expires_at') String expiresAt,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$AttendanceSessionDTOCopyWithImpl<$Res>
    implements _$AttendanceSessionDTOCopyWith<$Res> {
  __$AttendanceSessionDTOCopyWithImpl(this._self, this._then);

  final _AttendanceSessionDTO _self;
  final $Res Function(_AttendanceSessionDTO) _then;

/// Create a copy of AttendanceSessionDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lessonId = null,Object? token = null,Object? expiresAt = null,Object? isActive = null,}) {
  return _then(_AttendanceSessionDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
