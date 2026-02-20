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

 String get day; String get time; String get subject; String get type; String get place; String get building; String get sync; String get teacher; List<String> get groups;
/// Create a copy of LessonDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonDTOCopyWith<LessonDTO> get copyWith => _$LessonDTOCopyWithImpl<LessonDTO>(this as LessonDTO, _$identity);

  /// Serializes this LessonDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonDTO&&(identical(other.day, day) || other.day == day)&&(identical(other.time, time) || other.time == time)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.type, type) || other.type == type)&&(identical(other.place, place) || other.place == place)&&(identical(other.building, building) || other.building == building)&&(identical(other.sync, sync) || other.sync == sync)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&const DeepCollectionEquality().equals(other.groups, groups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,time,subject,type,place,building,sync,teacher,const DeepCollectionEquality().hash(groups));

@override
String toString() {
  return 'LessonDTO(day: $day, time: $time, subject: $subject, type: $type, place: $place, building: $building, sync: $sync, teacher: $teacher, groups: $groups)';
}


}

/// @nodoc
abstract mixin class $LessonDTOCopyWith<$Res>  {
  factory $LessonDTOCopyWith(LessonDTO value, $Res Function(LessonDTO) _then) = _$LessonDTOCopyWithImpl;
@useResult
$Res call({
 String day, String time, String subject, String type, String place, String building, String sync, String teacher, List<String> groups
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
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? time = null,Object? subject = null,Object? type = null,Object? place = null,Object? building = null,Object? sync = null,Object? teacher = null,Object? groups = null,}) {
  return _then(_self.copyWith(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,building: null == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<String>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String day,  String time,  String subject,  String type,  String place,  String building,  String sync,  String teacher,  List<String> groups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonDTO() when $default != null:
return $default(_that.day,_that.time,_that.subject,_that.type,_that.place,_that.building,_that.sync,_that.teacher,_that.groups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String day,  String time,  String subject,  String type,  String place,  String building,  String sync,  String teacher,  List<String> groups)  $default,) {final _that = this;
switch (_that) {
case _LessonDTO():
return $default(_that.day,_that.time,_that.subject,_that.type,_that.place,_that.building,_that.sync,_that.teacher,_that.groups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String day,  String time,  String subject,  String type,  String place,  String building,  String sync,  String teacher,  List<String> groups)?  $default,) {final _that = this;
switch (_that) {
case _LessonDTO() when $default != null:
return $default(_that.day,_that.time,_that.subject,_that.type,_that.place,_that.building,_that.sync,_that.teacher,_that.groups);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LessonDTO implements LessonDTO {
  const _LessonDTO({required this.day, required this.time, required this.subject, required this.type, required this.place, required this.building, required this.sync, this.teacher = '', final  List<String> groups = const []}): _groups = groups;
  factory _LessonDTO.fromJson(Map<String, dynamic> json) => _$LessonDTOFromJson(json);

@override final  String day;
@override final  String time;
@override final  String subject;
@override final  String type;
@override final  String place;
@override final  String building;
@override final  String sync;
@override@JsonKey() final  String teacher;
 final  List<String> _groups;
@override@JsonKey() List<String> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonDTO&&(identical(other.day, day) || other.day == day)&&(identical(other.time, time) || other.time == time)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.type, type) || other.type == type)&&(identical(other.place, place) || other.place == place)&&(identical(other.building, building) || other.building == building)&&(identical(other.sync, sync) || other.sync == sync)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&const DeepCollectionEquality().equals(other._groups, _groups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,time,subject,type,place,building,sync,teacher,const DeepCollectionEquality().hash(_groups));

@override
String toString() {
  return 'LessonDTO(day: $day, time: $time, subject: $subject, type: $type, place: $place, building: $building, sync: $sync, teacher: $teacher, groups: $groups)';
}


}

/// @nodoc
abstract mixin class _$LessonDTOCopyWith<$Res> implements $LessonDTOCopyWith<$Res> {
  factory _$LessonDTOCopyWith(_LessonDTO value, $Res Function(_LessonDTO) _then) = __$LessonDTOCopyWithImpl;
@override @useResult
$Res call({
 String day, String time, String subject, String type, String place, String building, String sync, String teacher, List<String> groups
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
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? time = null,Object? subject = null,Object? type = null,Object? place = null,Object? building = null,Object? sync = null,Object? teacher = null,Object? groups = null,}) {
  return _then(_LessonDTO(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,building: null == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
