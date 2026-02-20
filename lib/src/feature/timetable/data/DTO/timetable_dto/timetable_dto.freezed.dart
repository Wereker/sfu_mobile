// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimetableDTO {

 String get target; String get type; String? get institute; List<WeekDTO> get weeks;
/// Create a copy of TimetableDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimetableDTOCopyWith<TimetableDTO> get copyWith => _$TimetableDTOCopyWithImpl<TimetableDTO>(this as TimetableDTO, _$identity);

  /// Serializes this TimetableDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimetableDTO&&(identical(other.target, target) || other.target == target)&&(identical(other.type, type) || other.type == type)&&(identical(other.institute, institute) || other.institute == institute)&&const DeepCollectionEquality().equals(other.weeks, weeks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,target,type,institute,const DeepCollectionEquality().hash(weeks));

@override
String toString() {
  return 'TimetableDTO(target: $target, type: $type, institute: $institute, weeks: $weeks)';
}


}

/// @nodoc
abstract mixin class $TimetableDTOCopyWith<$Res>  {
  factory $TimetableDTOCopyWith(TimetableDTO value, $Res Function(TimetableDTO) _then) = _$TimetableDTOCopyWithImpl;
@useResult
$Res call({
 String target, String type, String? institute, List<WeekDTO> weeks
});




}
/// @nodoc
class _$TimetableDTOCopyWithImpl<$Res>
    implements $TimetableDTOCopyWith<$Res> {
  _$TimetableDTOCopyWithImpl(this._self, this._then);

  final TimetableDTO _self;
  final $Res Function(TimetableDTO) _then;

/// Create a copy of TimetableDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? target = null,Object? type = null,Object? institute = freezed,Object? weeks = null,}) {
  return _then(_self.copyWith(
target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,institute: freezed == institute ? _self.institute : institute // ignore: cast_nullable_to_non_nullable
as String?,weeks: null == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as List<WeekDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [TimetableDTO].
extension TimetableDTOPatterns on TimetableDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimetableDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimetableDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimetableDTO value)  $default,){
final _that = this;
switch (_that) {
case _TimetableDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimetableDTO value)?  $default,){
final _that = this;
switch (_that) {
case _TimetableDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String target,  String type,  String? institute,  List<WeekDTO> weeks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimetableDTO() when $default != null:
return $default(_that.target,_that.type,_that.institute,_that.weeks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String target,  String type,  String? institute,  List<WeekDTO> weeks)  $default,) {final _that = this;
switch (_that) {
case _TimetableDTO():
return $default(_that.target,_that.type,_that.institute,_that.weeks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String target,  String type,  String? institute,  List<WeekDTO> weeks)?  $default,) {final _that = this;
switch (_that) {
case _TimetableDTO() when $default != null:
return $default(_that.target,_that.type,_that.institute,_that.weeks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimetableDTO implements TimetableDTO {
  const _TimetableDTO({required this.target, required this.type, this.institute, required final  List<WeekDTO> weeks}): _weeks = weeks;
  factory _TimetableDTO.fromJson(Map<String, dynamic> json) => _$TimetableDTOFromJson(json);

@override final  String target;
@override final  String type;
@override final  String? institute;
 final  List<WeekDTO> _weeks;
@override List<WeekDTO> get weeks {
  if (_weeks is EqualUnmodifiableListView) return _weeks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weeks);
}


/// Create a copy of TimetableDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimetableDTOCopyWith<_TimetableDTO> get copyWith => __$TimetableDTOCopyWithImpl<_TimetableDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimetableDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimetableDTO&&(identical(other.target, target) || other.target == target)&&(identical(other.type, type) || other.type == type)&&(identical(other.institute, institute) || other.institute == institute)&&const DeepCollectionEquality().equals(other._weeks, _weeks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,target,type,institute,const DeepCollectionEquality().hash(_weeks));

@override
String toString() {
  return 'TimetableDTO(target: $target, type: $type, institute: $institute, weeks: $weeks)';
}


}

/// @nodoc
abstract mixin class _$TimetableDTOCopyWith<$Res> implements $TimetableDTOCopyWith<$Res> {
  factory _$TimetableDTOCopyWith(_TimetableDTO value, $Res Function(_TimetableDTO) _then) = __$TimetableDTOCopyWithImpl;
@override @useResult
$Res call({
 String target, String type, String? institute, List<WeekDTO> weeks
});




}
/// @nodoc
class __$TimetableDTOCopyWithImpl<$Res>
    implements _$TimetableDTOCopyWith<$Res> {
  __$TimetableDTOCopyWithImpl(this._self, this._then);

  final _TimetableDTO _self;
  final $Res Function(_TimetableDTO) _then;

/// Create a copy of TimetableDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? target = null,Object? type = null,Object? institute = freezed,Object? weeks = null,}) {
  return _then(_TimetableDTO(
target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,institute: freezed == institute ? _self.institute : institute // ignore: cast_nullable_to_non_nullable
as String?,weeks: null == weeks ? _self._weeks : weeks // ignore: cast_nullable_to_non_nullable
as List<WeekDTO>,
  ));
}


}

// dart format on
