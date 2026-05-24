// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Timetable {

 int get groupId; Week get week1; Week get week2;
/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimetableCopyWith<Timetable> get copyWith => _$TimetableCopyWithImpl<Timetable>(this as Timetable, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Timetable&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.week1, week1) || other.week1 == week1)&&(identical(other.week2, week2) || other.week2 == week2));
}


@override
int get hashCode => Object.hash(runtimeType,groupId,week1,week2);

@override
String toString() {
  return 'Timetable(groupId: $groupId, week1: $week1, week2: $week2)';
}


}

/// @nodoc
abstract mixin class $TimetableCopyWith<$Res>  {
  factory $TimetableCopyWith(Timetable value, $Res Function(Timetable) _then) = _$TimetableCopyWithImpl;
@useResult
$Res call({
 int groupId, Week week1, Week week2
});


$WeekCopyWith<$Res> get week1;$WeekCopyWith<$Res> get week2;

}
/// @nodoc
class _$TimetableCopyWithImpl<$Res>
    implements $TimetableCopyWith<$Res> {
  _$TimetableCopyWithImpl(this._self, this._then);

  final Timetable _self;
  final $Res Function(Timetable) _then;

/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? week1 = null,Object? week2 = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,week1: null == week1 ? _self.week1 : week1 // ignore: cast_nullable_to_non_nullable
as Week,week2: null == week2 ? _self.week2 : week2 // ignore: cast_nullable_to_non_nullable
as Week,
  ));
}
/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeekCopyWith<$Res> get week1 {
  
  return $WeekCopyWith<$Res>(_self.week1, (value) {
    return _then(_self.copyWith(week1: value));
  });
}/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeekCopyWith<$Res> get week2 {
  
  return $WeekCopyWith<$Res>(_self.week2, (value) {
    return _then(_self.copyWith(week2: value));
  });
}
}


/// Adds pattern-matching-related methods to [Timetable].
extension TimetablePatterns on Timetable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Timetable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Timetable() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Timetable value)  $default,){
final _that = this;
switch (_that) {
case _Timetable():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Timetable value)?  $default,){
final _that = this;
switch (_that) {
case _Timetable() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int groupId,  Week week1,  Week week2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Timetable() when $default != null:
return $default(_that.groupId,_that.week1,_that.week2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int groupId,  Week week1,  Week week2)  $default,) {final _that = this;
switch (_that) {
case _Timetable():
return $default(_that.groupId,_that.week1,_that.week2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int groupId,  Week week1,  Week week2)?  $default,) {final _that = this;
switch (_that) {
case _Timetable() when $default != null:
return $default(_that.groupId,_that.week1,_that.week2);case _:
  return null;

}
}

}

/// @nodoc


class _Timetable implements Timetable {
  const _Timetable({required this.groupId, required this.week1, required this.week2});
  

@override final  int groupId;
@override final  Week week1;
@override final  Week week2;

/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimetableCopyWith<_Timetable> get copyWith => __$TimetableCopyWithImpl<_Timetable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Timetable&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.week1, week1) || other.week1 == week1)&&(identical(other.week2, week2) || other.week2 == week2));
}


@override
int get hashCode => Object.hash(runtimeType,groupId,week1,week2);

@override
String toString() {
  return 'Timetable(groupId: $groupId, week1: $week1, week2: $week2)';
}


}

/// @nodoc
abstract mixin class _$TimetableCopyWith<$Res> implements $TimetableCopyWith<$Res> {
  factory _$TimetableCopyWith(_Timetable value, $Res Function(_Timetable) _then) = __$TimetableCopyWithImpl;
@override @useResult
$Res call({
 int groupId, Week week1, Week week2
});


@override $WeekCopyWith<$Res> get week1;@override $WeekCopyWith<$Res> get week2;

}
/// @nodoc
class __$TimetableCopyWithImpl<$Res>
    implements _$TimetableCopyWith<$Res> {
  __$TimetableCopyWithImpl(this._self, this._then);

  final _Timetable _self;
  final $Res Function(_Timetable) _then;

/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? week1 = null,Object? week2 = null,}) {
  return _then(_Timetable(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,week1: null == week1 ? _self.week1 : week1 // ignore: cast_nullable_to_non_nullable
as Week,week2: null == week2 ? _self.week2 : week2 // ignore: cast_nullable_to_non_nullable
as Week,
  ));
}

/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeekCopyWith<$Res> get week1 {
  
  return $WeekCopyWith<$Res>(_self.week1, (value) {
    return _then(_self.copyWith(week1: value));
  });
}/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeekCopyWith<$Res> get week2 {
  
  return $WeekCopyWith<$Res>(_self.week2, (value) {
    return _then(_self.copyWith(week2: value));
  });
}
}

// dart format on
