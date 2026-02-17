// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Week {

 String get week; List<Lesson> get lessons;
/// Create a copy of Week
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekCopyWith<Week> get copyWith => _$WeekCopyWithImpl<Week>(this as Week, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Week&&(identical(other.week, week) || other.week == week)&&const DeepCollectionEquality().equals(other.lessons, lessons));
}


@override
int get hashCode => Object.hash(runtimeType,week,const DeepCollectionEquality().hash(lessons));

@override
String toString() {
  return 'Week(week: $week, lessons: $lessons)';
}


}

/// @nodoc
abstract mixin class $WeekCopyWith<$Res>  {
  factory $WeekCopyWith(Week value, $Res Function(Week) _then) = _$WeekCopyWithImpl;
@useResult
$Res call({
 String week, List<Lesson> lessons
});




}
/// @nodoc
class _$WeekCopyWithImpl<$Res>
    implements $WeekCopyWith<$Res> {
  _$WeekCopyWithImpl(this._self, this._then);

  final Week _self;
  final $Res Function(Week) _then;

/// Create a copy of Week
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? week = null,Object? lessons = null,}) {
  return _then(_self.copyWith(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,lessons: null == lessons ? _self.lessons : lessons // ignore: cast_nullable_to_non_nullable
as List<Lesson>,
  ));
}

}


/// Adds pattern-matching-related methods to [Week].
extension WeekPatterns on Week {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Week value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Week() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Week value)  $default,){
final _that = this;
switch (_that) {
case _Week():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Week value)?  $default,){
final _that = this;
switch (_that) {
case _Week() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String week,  List<Lesson> lessons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Week() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String week,  List<Lesson> lessons)  $default,) {final _that = this;
switch (_that) {
case _Week():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String week,  List<Lesson> lessons)?  $default,) {final _that = this;
switch (_that) {
case _Week() when $default != null:
return $default(_that.week,_that.lessons);case _:
  return null;

}
}

}

/// @nodoc


class _Week implements Week {
  const _Week({required this.week, required final  List<Lesson> lessons}): _lessons = lessons;
  

@override final  String week;
 final  List<Lesson> _lessons;
@override List<Lesson> get lessons {
  if (_lessons is EqualUnmodifiableListView) return _lessons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lessons);
}


/// Create a copy of Week
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeekCopyWith<_Week> get copyWith => __$WeekCopyWithImpl<_Week>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Week&&(identical(other.week, week) || other.week == week)&&const DeepCollectionEquality().equals(other._lessons, _lessons));
}


@override
int get hashCode => Object.hash(runtimeType,week,const DeepCollectionEquality().hash(_lessons));

@override
String toString() {
  return 'Week(week: $week, lessons: $lessons)';
}


}

/// @nodoc
abstract mixin class _$WeekCopyWith<$Res> implements $WeekCopyWith<$Res> {
  factory _$WeekCopyWith(_Week value, $Res Function(_Week) _then) = __$WeekCopyWithImpl;
@override @useResult
$Res call({
 String week, List<Lesson> lessons
});




}
/// @nodoc
class __$WeekCopyWithImpl<$Res>
    implements _$WeekCopyWith<$Res> {
  __$WeekCopyWithImpl(this._self, this._then);

  final _Week _self;
  final $Res Function(_Week) _then;

/// Create a copy of Week
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? week = null,Object? lessons = null,}) {
  return _then(_Week(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,lessons: null == lessons ? _self._lessons : lessons // ignore: cast_nullable_to_non_nullable
as List<Lesson>,
  ));
}


}

// dart format on
