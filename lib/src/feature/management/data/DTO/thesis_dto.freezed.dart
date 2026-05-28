// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thesis_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThesisDTO {

 String get id; String get title;@JsonKey(name: 'teacher_id') String get teacherId;@JsonKey(name: 'teacher_name') String get teacherName;@JsonKey(name: 'is_free') bool get isFree;@JsonKey(name: 'taken_by') String? get takenBy;@JsonKey(name: 'taken_by_id') String? get takenById;
/// Create a copy of ThesisDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThesisDTOCopyWith<ThesisDTO> get copyWith => _$ThesisDTOCopyWithImpl<ThesisDTO>(this as ThesisDTO, _$identity);

  /// Serializes this ThesisDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThesisDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.takenBy, takenBy) || other.takenBy == takenBy)&&(identical(other.takenById, takenById) || other.takenById == takenById));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,teacherId,teacherName,isFree,takenBy,takenById);

@override
String toString() {
  return 'ThesisDTO(id: $id, title: $title, teacherId: $teacherId, teacherName: $teacherName, isFree: $isFree, takenBy: $takenBy, takenById: $takenById)';
}


}

/// @nodoc
abstract mixin class $ThesisDTOCopyWith<$Res>  {
  factory $ThesisDTOCopyWith(ThesisDTO value, $Res Function(ThesisDTO) _then) = _$ThesisDTOCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'teacher_id') String teacherId,@JsonKey(name: 'teacher_name') String teacherName,@JsonKey(name: 'is_free') bool isFree,@JsonKey(name: 'taken_by') String? takenBy,@JsonKey(name: 'taken_by_id') String? takenById
});




}
/// @nodoc
class _$ThesisDTOCopyWithImpl<$Res>
    implements $ThesisDTOCopyWith<$Res> {
  _$ThesisDTOCopyWithImpl(this._self, this._then);

  final ThesisDTO _self;
  final $Res Function(ThesisDTO) _then;

/// Create a copy of ThesisDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? teacherId = null,Object? teacherName = null,Object? isFree = null,Object? takenBy = freezed,Object? takenById = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,takenBy: freezed == takenBy ? _self.takenBy : takenBy // ignore: cast_nullable_to_non_nullable
as String?,takenById: freezed == takenById ? _self.takenById : takenById // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ThesisDTO].
extension ThesisDTOPatterns on ThesisDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThesisDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThesisDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThesisDTO value)  $default,){
final _that = this;
switch (_that) {
case _ThesisDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThesisDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ThesisDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'teacher_id')  String teacherId, @JsonKey(name: 'teacher_name')  String teacherName, @JsonKey(name: 'is_free')  bool isFree, @JsonKey(name: 'taken_by')  String? takenBy, @JsonKey(name: 'taken_by_id')  String? takenById)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThesisDTO() when $default != null:
return $default(_that.id,_that.title,_that.teacherId,_that.teacherName,_that.isFree,_that.takenBy,_that.takenById);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'teacher_id')  String teacherId, @JsonKey(name: 'teacher_name')  String teacherName, @JsonKey(name: 'is_free')  bool isFree, @JsonKey(name: 'taken_by')  String? takenBy, @JsonKey(name: 'taken_by_id')  String? takenById)  $default,) {final _that = this;
switch (_that) {
case _ThesisDTO():
return $default(_that.id,_that.title,_that.teacherId,_that.teacherName,_that.isFree,_that.takenBy,_that.takenById);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'teacher_id')  String teacherId, @JsonKey(name: 'teacher_name')  String teacherName, @JsonKey(name: 'is_free')  bool isFree, @JsonKey(name: 'taken_by')  String? takenBy, @JsonKey(name: 'taken_by_id')  String? takenById)?  $default,) {final _that = this;
switch (_that) {
case _ThesisDTO() when $default != null:
return $default(_that.id,_that.title,_that.teacherId,_that.teacherName,_that.isFree,_that.takenBy,_that.takenById);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThesisDTO implements ThesisDTO {
  const _ThesisDTO({required this.id, required this.title, @JsonKey(name: 'teacher_id') required this.teacherId, @JsonKey(name: 'teacher_name') this.teacherName = '', @JsonKey(name: 'is_free') required this.isFree, @JsonKey(name: 'taken_by') this.takenBy, @JsonKey(name: 'taken_by_id') this.takenById});
  factory _ThesisDTO.fromJson(Map<String, dynamic> json) => _$ThesisDTOFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'teacher_id') final  String teacherId;
@override@JsonKey(name: 'teacher_name') final  String teacherName;
@override@JsonKey(name: 'is_free') final  bool isFree;
@override@JsonKey(name: 'taken_by') final  String? takenBy;
@override@JsonKey(name: 'taken_by_id') final  String? takenById;

/// Create a copy of ThesisDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThesisDTOCopyWith<_ThesisDTO> get copyWith => __$ThesisDTOCopyWithImpl<_ThesisDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThesisDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThesisDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.takenBy, takenBy) || other.takenBy == takenBy)&&(identical(other.takenById, takenById) || other.takenById == takenById));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,teacherId,teacherName,isFree,takenBy,takenById);

@override
String toString() {
  return 'ThesisDTO(id: $id, title: $title, teacherId: $teacherId, teacherName: $teacherName, isFree: $isFree, takenBy: $takenBy, takenById: $takenById)';
}


}

/// @nodoc
abstract mixin class _$ThesisDTOCopyWith<$Res> implements $ThesisDTOCopyWith<$Res> {
  factory _$ThesisDTOCopyWith(_ThesisDTO value, $Res Function(_ThesisDTO) _then) = __$ThesisDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'teacher_id') String teacherId,@JsonKey(name: 'teacher_name') String teacherName,@JsonKey(name: 'is_free') bool isFree,@JsonKey(name: 'taken_by') String? takenBy,@JsonKey(name: 'taken_by_id') String? takenById
});




}
/// @nodoc
class __$ThesisDTOCopyWithImpl<$Res>
    implements _$ThesisDTOCopyWith<$Res> {
  __$ThesisDTOCopyWithImpl(this._self, this._then);

  final _ThesisDTO _self;
  final $Res Function(_ThesisDTO) _then;

/// Create a copy of ThesisDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? teacherId = null,Object? teacherName = null,Object? isFree = null,Object? takenBy = freezed,Object? takenById = freezed,}) {
  return _then(_ThesisDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,takenBy: freezed == takenBy ? _self.takenBy : takenBy // ignore: cast_nullable_to_non_nullable
as String?,takenById: freezed == takenById ? _self.takenById : takenById // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
