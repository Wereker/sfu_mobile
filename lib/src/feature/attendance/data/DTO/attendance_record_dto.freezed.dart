// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_record_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceRecordDTO {

@JsonKey(fromJson: _intToString) String get id;@JsonKey(name: 'lesson_id', fromJson: _intToString) String get lessonId;@JsonKey(name: 'student_id', fromJson: _intToString) String get studentId;@JsonKey(name: 'marked_via') String get markedVia;// 'qr' | 'manual'
@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of AttendanceRecordDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceRecordDTOCopyWith<AttendanceRecordDTO> get copyWith => _$AttendanceRecordDTOCopyWithImpl<AttendanceRecordDTO>(this as AttendanceRecordDTO, _$identity);

  /// Serializes this AttendanceRecordDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceRecordDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.markedVia, markedVia) || other.markedVia == markedVia)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lessonId,studentId,markedVia,createdAt);

@override
String toString() {
  return 'AttendanceRecordDTO(id: $id, lessonId: $lessonId, studentId: $studentId, markedVia: $markedVia, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AttendanceRecordDTOCopyWith<$Res>  {
  factory $AttendanceRecordDTOCopyWith(AttendanceRecordDTO value, $Res Function(AttendanceRecordDTO) _then) = _$AttendanceRecordDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intToString) String id,@JsonKey(name: 'lesson_id', fromJson: _intToString) String lessonId,@JsonKey(name: 'student_id', fromJson: _intToString) String studentId,@JsonKey(name: 'marked_via') String markedVia,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$AttendanceRecordDTOCopyWithImpl<$Res>
    implements $AttendanceRecordDTOCopyWith<$Res> {
  _$AttendanceRecordDTOCopyWithImpl(this._self, this._then);

  final AttendanceRecordDTO _self;
  final $Res Function(AttendanceRecordDTO) _then;

/// Create a copy of AttendanceRecordDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lessonId = null,Object? studentId = null,Object? markedVia = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,markedVia: null == markedVia ? _self.markedVia : markedVia // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceRecordDTO].
extension AttendanceRecordDTOPatterns on AttendanceRecordDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceRecordDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceRecordDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceRecordDTO value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceRecordDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceRecordDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceRecordDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'lesson_id', fromJson: _intToString)  String lessonId, @JsonKey(name: 'student_id', fromJson: _intToString)  String studentId, @JsonKey(name: 'marked_via')  String markedVia, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceRecordDTO() when $default != null:
return $default(_that.id,_that.lessonId,_that.studentId,_that.markedVia,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'lesson_id', fromJson: _intToString)  String lessonId, @JsonKey(name: 'student_id', fromJson: _intToString)  String studentId, @JsonKey(name: 'marked_via')  String markedVia, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _AttendanceRecordDTO():
return $default(_that.id,_that.lessonId,_that.studentId,_that.markedVia,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'lesson_id', fromJson: _intToString)  String lessonId, @JsonKey(name: 'student_id', fromJson: _intToString)  String studentId, @JsonKey(name: 'marked_via')  String markedVia, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceRecordDTO() when $default != null:
return $default(_that.id,_that.lessonId,_that.studentId,_that.markedVia,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceRecordDTO implements AttendanceRecordDTO {
  const _AttendanceRecordDTO({@JsonKey(fromJson: _intToString) required this.id, @JsonKey(name: 'lesson_id', fromJson: _intToString) required this.lessonId, @JsonKey(name: 'student_id', fromJson: _intToString) required this.studentId, @JsonKey(name: 'marked_via') required this.markedVia, @JsonKey(name: 'created_at') required this.createdAt});
  factory _AttendanceRecordDTO.fromJson(Map<String, dynamic> json) => _$AttendanceRecordDTOFromJson(json);

@override@JsonKey(fromJson: _intToString) final  String id;
@override@JsonKey(name: 'lesson_id', fromJson: _intToString) final  String lessonId;
@override@JsonKey(name: 'student_id', fromJson: _intToString) final  String studentId;
@override@JsonKey(name: 'marked_via') final  String markedVia;
// 'qr' | 'manual'
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of AttendanceRecordDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceRecordDTOCopyWith<_AttendanceRecordDTO> get copyWith => __$AttendanceRecordDTOCopyWithImpl<_AttendanceRecordDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceRecordDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceRecordDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.markedVia, markedVia) || other.markedVia == markedVia)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lessonId,studentId,markedVia,createdAt);

@override
String toString() {
  return 'AttendanceRecordDTO(id: $id, lessonId: $lessonId, studentId: $studentId, markedVia: $markedVia, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AttendanceRecordDTOCopyWith<$Res> implements $AttendanceRecordDTOCopyWith<$Res> {
  factory _$AttendanceRecordDTOCopyWith(_AttendanceRecordDTO value, $Res Function(_AttendanceRecordDTO) _then) = __$AttendanceRecordDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intToString) String id,@JsonKey(name: 'lesson_id', fromJson: _intToString) String lessonId,@JsonKey(name: 'student_id', fromJson: _intToString) String studentId,@JsonKey(name: 'marked_via') String markedVia,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$AttendanceRecordDTOCopyWithImpl<$Res>
    implements _$AttendanceRecordDTOCopyWith<$Res> {
  __$AttendanceRecordDTOCopyWithImpl(this._self, this._then);

  final _AttendanceRecordDTO _self;
  final $Res Function(_AttendanceRecordDTO) _then;

/// Create a copy of AttendanceRecordDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lessonId = null,Object? studentId = null,Object? markedVia = null,Object? createdAt = null,}) {
  return _then(_AttendanceRecordDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,markedVia: null == markedVia ? _self.markedVia : markedVia // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
