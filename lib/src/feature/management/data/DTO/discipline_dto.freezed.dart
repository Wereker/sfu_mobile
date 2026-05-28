// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discipline_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DisciplineDTO {

 String get id; String get name;@JsonKey(name: 'teacher_id') String get teacherId;@JsonKey(name: 'teacher_name') String get teacherName; int get credits; String get level;// 'bachelor' | 'master'
@JsonKey(name: 'total_seats') int get totalSeats;@JsonKey(name: 'taken_seats') int get takenSeats;@JsonKey(name: 'is_enrolled') bool get isEnrolled;
/// Create a copy of DisciplineDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisciplineDTOCopyWith<DisciplineDTO> get copyWith => _$DisciplineDTOCopyWithImpl<DisciplineDTO>(this as DisciplineDTO, _$identity);

  /// Serializes this DisciplineDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisciplineDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.level, level) || other.level == level)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.takenSeats, takenSeats) || other.takenSeats == takenSeats)&&(identical(other.isEnrolled, isEnrolled) || other.isEnrolled == isEnrolled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,teacherId,teacherName,credits,level,totalSeats,takenSeats,isEnrolled);

@override
String toString() {
  return 'DisciplineDTO(id: $id, name: $name, teacherId: $teacherId, teacherName: $teacherName, credits: $credits, level: $level, totalSeats: $totalSeats, takenSeats: $takenSeats, isEnrolled: $isEnrolled)';
}


}

/// @nodoc
abstract mixin class $DisciplineDTOCopyWith<$Res>  {
  factory $DisciplineDTOCopyWith(DisciplineDTO value, $Res Function(DisciplineDTO) _then) = _$DisciplineDTOCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'teacher_id') String teacherId,@JsonKey(name: 'teacher_name') String teacherName, int credits, String level,@JsonKey(name: 'total_seats') int totalSeats,@JsonKey(name: 'taken_seats') int takenSeats,@JsonKey(name: 'is_enrolled') bool isEnrolled
});




}
/// @nodoc
class _$DisciplineDTOCopyWithImpl<$Res>
    implements $DisciplineDTOCopyWith<$Res> {
  _$DisciplineDTOCopyWithImpl(this._self, this._then);

  final DisciplineDTO _self;
  final $Res Function(DisciplineDTO) _then;

/// Create a copy of DisciplineDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? teacherId = null,Object? teacherName = null,Object? credits = null,Object? level = null,Object? totalSeats = null,Object? takenSeats = null,Object? isEnrolled = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,takenSeats: null == takenSeats ? _self.takenSeats : takenSeats // ignore: cast_nullable_to_non_nullable
as int,isEnrolled: null == isEnrolled ? _self.isEnrolled : isEnrolled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DisciplineDTO].
extension DisciplineDTOPatterns on DisciplineDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DisciplineDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DisciplineDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DisciplineDTO value)  $default,){
final _that = this;
switch (_that) {
case _DisciplineDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DisciplineDTO value)?  $default,){
final _that = this;
switch (_that) {
case _DisciplineDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'teacher_id')  String teacherId, @JsonKey(name: 'teacher_name')  String teacherName,  int credits,  String level, @JsonKey(name: 'total_seats')  int totalSeats, @JsonKey(name: 'taken_seats')  int takenSeats, @JsonKey(name: 'is_enrolled')  bool isEnrolled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DisciplineDTO() when $default != null:
return $default(_that.id,_that.name,_that.teacherId,_that.teacherName,_that.credits,_that.level,_that.totalSeats,_that.takenSeats,_that.isEnrolled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'teacher_id')  String teacherId, @JsonKey(name: 'teacher_name')  String teacherName,  int credits,  String level, @JsonKey(name: 'total_seats')  int totalSeats, @JsonKey(name: 'taken_seats')  int takenSeats, @JsonKey(name: 'is_enrolled')  bool isEnrolled)  $default,) {final _that = this;
switch (_that) {
case _DisciplineDTO():
return $default(_that.id,_that.name,_that.teacherId,_that.teacherName,_that.credits,_that.level,_that.totalSeats,_that.takenSeats,_that.isEnrolled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'teacher_id')  String teacherId, @JsonKey(name: 'teacher_name')  String teacherName,  int credits,  String level, @JsonKey(name: 'total_seats')  int totalSeats, @JsonKey(name: 'taken_seats')  int takenSeats, @JsonKey(name: 'is_enrolled')  bool isEnrolled)?  $default,) {final _that = this;
switch (_that) {
case _DisciplineDTO() when $default != null:
return $default(_that.id,_that.name,_that.teacherId,_that.teacherName,_that.credits,_that.level,_that.totalSeats,_that.takenSeats,_that.isEnrolled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DisciplineDTO implements DisciplineDTO {
  const _DisciplineDTO({required this.id, required this.name, @JsonKey(name: 'teacher_id') required this.teacherId, @JsonKey(name: 'teacher_name') this.teacherName = '', this.credits = 0, required this.level, @JsonKey(name: 'total_seats') this.totalSeats = 0, @JsonKey(name: 'taken_seats') this.takenSeats = 0, @JsonKey(name: 'is_enrolled') this.isEnrolled = false});
  factory _DisciplineDTO.fromJson(Map<String, dynamic> json) => _$DisciplineDTOFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'teacher_id') final  String teacherId;
@override@JsonKey(name: 'teacher_name') final  String teacherName;
@override@JsonKey() final  int credits;
@override final  String level;
// 'bachelor' | 'master'
@override@JsonKey(name: 'total_seats') final  int totalSeats;
@override@JsonKey(name: 'taken_seats') final  int takenSeats;
@override@JsonKey(name: 'is_enrolled') final  bool isEnrolled;

/// Create a copy of DisciplineDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisciplineDTOCopyWith<_DisciplineDTO> get copyWith => __$DisciplineDTOCopyWithImpl<_DisciplineDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DisciplineDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisciplineDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.level, level) || other.level == level)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.takenSeats, takenSeats) || other.takenSeats == takenSeats)&&(identical(other.isEnrolled, isEnrolled) || other.isEnrolled == isEnrolled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,teacherId,teacherName,credits,level,totalSeats,takenSeats,isEnrolled);

@override
String toString() {
  return 'DisciplineDTO(id: $id, name: $name, teacherId: $teacherId, teacherName: $teacherName, credits: $credits, level: $level, totalSeats: $totalSeats, takenSeats: $takenSeats, isEnrolled: $isEnrolled)';
}


}

/// @nodoc
abstract mixin class _$DisciplineDTOCopyWith<$Res> implements $DisciplineDTOCopyWith<$Res> {
  factory _$DisciplineDTOCopyWith(_DisciplineDTO value, $Res Function(_DisciplineDTO) _then) = __$DisciplineDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'teacher_id') String teacherId,@JsonKey(name: 'teacher_name') String teacherName, int credits, String level,@JsonKey(name: 'total_seats') int totalSeats,@JsonKey(name: 'taken_seats') int takenSeats,@JsonKey(name: 'is_enrolled') bool isEnrolled
});




}
/// @nodoc
class __$DisciplineDTOCopyWithImpl<$Res>
    implements _$DisciplineDTOCopyWith<$Res> {
  __$DisciplineDTOCopyWithImpl(this._self, this._then);

  final _DisciplineDTO _self;
  final $Res Function(_DisciplineDTO) _then;

/// Create a copy of DisciplineDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? teacherId = null,Object? teacherName = null,Object? credits = null,Object? level = null,Object? totalSeats = null,Object? takenSeats = null,Object? isEnrolled = null,}) {
  return _then(_DisciplineDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,takenSeats: null == takenSeats ? _self.takenSeats : takenSeats // ignore: cast_nullable_to_non_nullable
as int,isEnrolled: null == isEnrolled ? _self.isEnrolled : isEnrolled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
