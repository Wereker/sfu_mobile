// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LessonStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LessonStatus()';
}


}

/// @nodoc
class $LessonStatusCopyWith<$Res>  {
$LessonStatusCopyWith(LessonStatus _, $Res Function(LessonStatus) __);
}


/// Adds pattern-matching-related methods to [LessonStatus].
extension LessonStatusPatterns on LessonStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NotToday value)?  notToday,TResult Function( _Finished value)?  finished,TResult Function( _WillStartIn value)?  willStartIn,TResult Function( _InProgress value)?  inProgress,TResult Function( _WillEndIn value)?  willEndIn,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotToday() when notToday != null:
return notToday(_that);case _Finished() when finished != null:
return finished(_that);case _WillStartIn() when willStartIn != null:
return willStartIn(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _WillEndIn() when willEndIn != null:
return willEndIn(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NotToday value)  notToday,required TResult Function( _Finished value)  finished,required TResult Function( _WillStartIn value)  willStartIn,required TResult Function( _InProgress value)  inProgress,required TResult Function( _WillEndIn value)  willEndIn,}){
final _that = this;
switch (_that) {
case _NotToday():
return notToday(_that);case _Finished():
return finished(_that);case _WillStartIn():
return willStartIn(_that);case _InProgress():
return inProgress(_that);case _WillEndIn():
return willEndIn(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NotToday value)?  notToday,TResult? Function( _Finished value)?  finished,TResult? Function( _WillStartIn value)?  willStartIn,TResult? Function( _InProgress value)?  inProgress,TResult? Function( _WillEndIn value)?  willEndIn,}){
final _that = this;
switch (_that) {
case _NotToday() when notToday != null:
return notToday(_that);case _Finished() when finished != null:
return finished(_that);case _WillStartIn() when willStartIn != null:
return willStartIn(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _WillEndIn() when willEndIn != null:
return willEndIn(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  notToday,TResult Function()?  finished,TResult Function( int minutes)?  willStartIn,TResult Function( int minutes)?  inProgress,TResult Function( int minutes)?  willEndIn,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotToday() when notToday != null:
return notToday();case _Finished() when finished != null:
return finished();case _WillStartIn() when willStartIn != null:
return willStartIn(_that.minutes);case _InProgress() when inProgress != null:
return inProgress(_that.minutes);case _WillEndIn() when willEndIn != null:
return willEndIn(_that.minutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  notToday,required TResult Function()  finished,required TResult Function( int minutes)  willStartIn,required TResult Function( int minutes)  inProgress,required TResult Function( int minutes)  willEndIn,}) {final _that = this;
switch (_that) {
case _NotToday():
return notToday();case _Finished():
return finished();case _WillStartIn():
return willStartIn(_that.minutes);case _InProgress():
return inProgress(_that.minutes);case _WillEndIn():
return willEndIn(_that.minutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  notToday,TResult? Function()?  finished,TResult? Function( int minutes)?  willStartIn,TResult? Function( int minutes)?  inProgress,TResult? Function( int minutes)?  willEndIn,}) {final _that = this;
switch (_that) {
case _NotToday() when notToday != null:
return notToday();case _Finished() when finished != null:
return finished();case _WillStartIn() when willStartIn != null:
return willStartIn(_that.minutes);case _InProgress() when inProgress != null:
return inProgress(_that.minutes);case _WillEndIn() when willEndIn != null:
return willEndIn(_that.minutes);case _:
  return null;

}
}

}

/// @nodoc


class _NotToday implements LessonStatus {
  const _NotToday();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotToday);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LessonStatus.notToday()';
}


}




/// @nodoc


class _Finished implements LessonStatus {
  const _Finished();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Finished);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LessonStatus.finished()';
}


}




/// @nodoc


class _WillStartIn implements LessonStatus {
  const _WillStartIn({required this.minutes});
  

 final  int minutes;

/// Create a copy of LessonStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WillStartInCopyWith<_WillStartIn> get copyWith => __$WillStartInCopyWithImpl<_WillStartIn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WillStartIn&&(identical(other.minutes, minutes) || other.minutes == minutes));
}


@override
int get hashCode => Object.hash(runtimeType,minutes);

@override
String toString() {
  return 'LessonStatus.willStartIn(minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class _$WillStartInCopyWith<$Res> implements $LessonStatusCopyWith<$Res> {
  factory _$WillStartInCopyWith(_WillStartIn value, $Res Function(_WillStartIn) _then) = __$WillStartInCopyWithImpl;
@useResult
$Res call({
 int minutes
});




}
/// @nodoc
class __$WillStartInCopyWithImpl<$Res>
    implements _$WillStartInCopyWith<$Res> {
  __$WillStartInCopyWithImpl(this._self, this._then);

  final _WillStartIn _self;
  final $Res Function(_WillStartIn) _then;

/// Create a copy of LessonStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? minutes = null,}) {
  return _then(_WillStartIn(
minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _InProgress implements LessonStatus {
  const _InProgress({required this.minutes});
  

 final  int minutes;

/// Create a copy of LessonStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InProgressCopyWith<_InProgress> get copyWith => __$InProgressCopyWithImpl<_InProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgress&&(identical(other.minutes, minutes) || other.minutes == minutes));
}


@override
int get hashCode => Object.hash(runtimeType,minutes);

@override
String toString() {
  return 'LessonStatus.inProgress(minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class _$InProgressCopyWith<$Res> implements $LessonStatusCopyWith<$Res> {
  factory _$InProgressCopyWith(_InProgress value, $Res Function(_InProgress) _then) = __$InProgressCopyWithImpl;
@useResult
$Res call({
 int minutes
});




}
/// @nodoc
class __$InProgressCopyWithImpl<$Res>
    implements _$InProgressCopyWith<$Res> {
  __$InProgressCopyWithImpl(this._self, this._then);

  final _InProgress _self;
  final $Res Function(_InProgress) _then;

/// Create a copy of LessonStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? minutes = null,}) {
  return _then(_InProgress(
minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _WillEndIn implements LessonStatus {
  const _WillEndIn({required this.minutes});
  

 final  int minutes;

/// Create a copy of LessonStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WillEndInCopyWith<_WillEndIn> get copyWith => __$WillEndInCopyWithImpl<_WillEndIn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WillEndIn&&(identical(other.minutes, minutes) || other.minutes == minutes));
}


@override
int get hashCode => Object.hash(runtimeType,minutes);

@override
String toString() {
  return 'LessonStatus.willEndIn(minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class _$WillEndInCopyWith<$Res> implements $LessonStatusCopyWith<$Res> {
  factory _$WillEndInCopyWith(_WillEndIn value, $Res Function(_WillEndIn) _then) = __$WillEndInCopyWithImpl;
@useResult
$Res call({
 int minutes
});




}
/// @nodoc
class __$WillEndInCopyWithImpl<$Res>
    implements _$WillEndInCopyWith<$Res> {
  __$WillEndInCopyWithImpl(this._self, this._then);

  final _WillEndIn _self;
  final $Res Function(_WillEndIn) _then;

/// Create a copy of LessonStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? minutes = null,}) {
  return _then(_WillEndIn(
minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
