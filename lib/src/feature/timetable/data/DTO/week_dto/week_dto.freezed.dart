// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeekDTO {

 String get week; List<LessonDTO> get lessons;
/// Create a copy of WeekDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekDTOCopyWith<WeekDTO> get copyWith => _$WeekDTOCopyWithImpl<WeekDTO>(this as WeekDTO, _$identity);

  /// Serializes this WeekDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeekDTO&&(identical(other.week, week) || other.week == week)&&const DeepCollectionEquality().equals(other.lessons, lessons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,week,const DeepCollectionEquality().hash(lessons));

@override
String toString() {
  return 'WeekDTO(week: $week, lessons: $lessons)';
}


}

/// @nodoc
abstract mixin class $WeekDTOCopyWith<$Res>  {
  factory $WeekDTOCopyWith(WeekDTO value, $Res Function(WeekDTO) _then) = _$WeekDTOCopyWithImpl;
@useResult
$Res call({
 String week, List<LessonDTO> lessons
});




}
/// @nodoc
class _$WeekDTOCopyWithImpl<$Res>
    implements $WeekDTOCopyWith<$Res> {
  _$WeekDTOCopyWithImpl(this._self, this._then);

  final WeekDTO _self;
  final $Res Function(WeekDTO) _then;

/// Create a copy of WeekDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? week = null,Object? lessons = null,}) {
  return _then(_self.copyWith(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,lessons: null == lessons ? _self.lessons : lessons // ignore: cast_nullable_to_non_nullable
as List<LessonDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [WeekDTO].
extension WeekDTOPatterns on WeekDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeekDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeekDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeekDTO value)  $default,){
final _that = this;
switch (_that) {
case _WeekDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeekDTO value)?  $default,){
final _that = this;
switch (_that) {
case _WeekDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String week,  List<LessonDTO> lessons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeekDTO() when $default != null:
return $default(_that.week,_that.lessons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String week,  List<LessonDTO> lessons)  $default,) {final _that = this;
switch (_that) {
case _WeekDTO():
return $default(_that.week,_that.lessons);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String week,  List<LessonDTO> lessons)?  $default,) {final _that = this;
switch (_that) {
case _WeekDTO() when $default != null:
return $default(_that.week,_that.lessons);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeekDTO implements WeekDTO {
  const _WeekDTO({required this.week, required final  List<LessonDTO> lessons}): _lessons = lessons;
  factory _WeekDTO.fromJson(Map<String, dynamic> json) => _$WeekDTOFromJson(json);

@override final  String week;
 final  List<LessonDTO> _lessons;
@override List<LessonDTO> get lessons {
  if (_lessons is EqualUnmodifiableListView) return _lessons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lessons);
}


/// Create a copy of WeekDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeekDTOCopyWith<_WeekDTO> get copyWith => __$WeekDTOCopyWithImpl<_WeekDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeekDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeekDTO&&(identical(other.week, week) || other.week == week)&&const DeepCollectionEquality().equals(other._lessons, _lessons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,week,const DeepCollectionEquality().hash(_lessons));

@override
String toString() {
  return 'WeekDTO(week: $week, lessons: $lessons)';
}


}

/// @nodoc
abstract mixin class _$WeekDTOCopyWith<$Res> implements $WeekDTOCopyWith<$Res> {
  factory _$WeekDTOCopyWith(_WeekDTO value, $Res Function(_WeekDTO) _then) = __$WeekDTOCopyWithImpl;
@override @useResult
$Res call({
 String week, List<LessonDTO> lessons
});




}
/// @nodoc
class __$WeekDTOCopyWithImpl<$Res>
    implements _$WeekDTOCopyWith<$Res> {
  __$WeekDTOCopyWithImpl(this._self, this._then);

  final _WeekDTO _self;
  final $Res Function(_WeekDTO) _then;

/// Create a copy of WeekDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? week = null,Object? lessons = null,}) {
  return _then(_WeekDTO(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,lessons: null == lessons ? _self._lessons : lessons // ignore: cast_nullable_to_non_nullable
as List<LessonDTO>,
  ));
}


}

// dart format on
