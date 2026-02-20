// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimetableEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimetableEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimetableEvent()';
}


}

/// @nodoc
class $TimetableEventCopyWith<$Res>  {
$TimetableEventCopyWith(TimetableEvent _, $Res Function(TimetableEvent) __);
}


/// Adds pattern-matching-related methods to [TimetableEvent].
extension TimetableEventPatterns on TimetableEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TimetableLoadData value)?  loadData,TResult Function( _TimetableLoadDataForTarget value)?  loadDataForTarget,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimetableLoadData() when loadData != null:
return loadData(_that);case _TimetableLoadDataForTarget() when loadDataForTarget != null:
return loadDataForTarget(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TimetableLoadData value)  loadData,required TResult Function( _TimetableLoadDataForTarget value)  loadDataForTarget,}){
final _that = this;
switch (_that) {
case _TimetableLoadData():
return loadData(_that);case _TimetableLoadDataForTarget():
return loadDataForTarget(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TimetableLoadData value)?  loadData,TResult? Function( _TimetableLoadDataForTarget value)?  loadDataForTarget,}){
final _that = this;
switch (_that) {
case _TimetableLoadData() when loadData != null:
return loadData(_that);case _TimetableLoadDataForTarget() when loadDataForTarget != null:
return loadDataForTarget(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadData,TResult Function( String target)?  loadDataForTarget,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimetableLoadData() when loadData != null:
return loadData();case _TimetableLoadDataForTarget() when loadDataForTarget != null:
return loadDataForTarget(_that.target);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadData,required TResult Function( String target)  loadDataForTarget,}) {final _that = this;
switch (_that) {
case _TimetableLoadData():
return loadData();case _TimetableLoadDataForTarget():
return loadDataForTarget(_that.target);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadData,TResult? Function( String target)?  loadDataForTarget,}) {final _that = this;
switch (_that) {
case _TimetableLoadData() when loadData != null:
return loadData();case _TimetableLoadDataForTarget() when loadDataForTarget != null:
return loadDataForTarget(_that.target);case _:
  return null;

}
}

}

/// @nodoc


class _TimetableLoadData implements TimetableEvent {
  const _TimetableLoadData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimetableLoadData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimetableEvent.loadData()';
}


}




/// @nodoc


class _TimetableLoadDataForTarget implements TimetableEvent {
  const _TimetableLoadDataForTarget(this.target);
  

 final  String target;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimetableLoadDataForTargetCopyWith<_TimetableLoadDataForTarget> get copyWith => __$TimetableLoadDataForTargetCopyWithImpl<_TimetableLoadDataForTarget>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimetableLoadDataForTarget&&(identical(other.target, target) || other.target == target));
}


@override
int get hashCode => Object.hash(runtimeType,target);

@override
String toString() {
  return 'TimetableEvent.loadDataForTarget(target: $target)';
}


}

/// @nodoc
abstract mixin class _$TimetableLoadDataForTargetCopyWith<$Res> implements $TimetableEventCopyWith<$Res> {
  factory _$TimetableLoadDataForTargetCopyWith(_TimetableLoadDataForTarget value, $Res Function(_TimetableLoadDataForTarget) _then) = __$TimetableLoadDataForTargetCopyWithImpl;
@useResult
$Res call({
 String target
});




}
/// @nodoc
class __$TimetableLoadDataForTargetCopyWithImpl<$Res>
    implements _$TimetableLoadDataForTargetCopyWith<$Res> {
  __$TimetableLoadDataForTargetCopyWithImpl(this._self, this._then);

  final _TimetableLoadDataForTarget _self;
  final $Res Function(_TimetableLoadDataForTarget) _then;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? target = null,}) {
  return _then(_TimetableLoadDataForTarget(
null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$TimetableState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimetableState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimetableState()';
}


}

/// @nodoc
class $TimetableStateCopyWith<$Res>  {
$TimetableStateCopyWith(TimetableState _, $Res Function(TimetableState) __);
}


/// Adds pattern-matching-related methods to [TimetableState].
extension TimetableStatePatterns on TimetableState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TimetableInitial value)?  initial,TResult Function( _TimetableLoading value)?  loading,TResult Function( _TimetableSuccess value)?  success,TResult Function( _TimetableError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimetableInitial() when initial != null:
return initial(_that);case _TimetableLoading() when loading != null:
return loading(_that);case _TimetableSuccess() when success != null:
return success(_that);case _TimetableError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TimetableInitial value)  initial,required TResult Function( _TimetableLoading value)  loading,required TResult Function( _TimetableSuccess value)  success,required TResult Function( _TimetableError value)  error,}){
final _that = this;
switch (_that) {
case _TimetableInitial():
return initial(_that);case _TimetableLoading():
return loading(_that);case _TimetableSuccess():
return success(_that);case _TimetableError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TimetableInitial value)?  initial,TResult? Function( _TimetableLoading value)?  loading,TResult? Function( _TimetableSuccess value)?  success,TResult? Function( _TimetableError value)?  error,}){
final _that = this;
switch (_that) {
case _TimetableInitial() when initial != null:
return initial(_that);case _TimetableLoading() when loading != null:
return loading(_that);case _TimetableSuccess() when success != null:
return success(_that);case _TimetableError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Timetable timetable)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimetableInitial() when initial != null:
return initial();case _TimetableLoading() when loading != null:
return loading();case _TimetableSuccess() when success != null:
return success(_that.timetable);case _TimetableError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Timetable timetable)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _TimetableInitial():
return initial();case _TimetableLoading():
return loading();case _TimetableSuccess():
return success(_that.timetable);case _TimetableError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Timetable timetable)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _TimetableInitial() when initial != null:
return initial();case _TimetableLoading() when loading != null:
return loading();case _TimetableSuccess() when success != null:
return success(_that.timetable);case _TimetableError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TimetableInitial implements TimetableState {
  const _TimetableInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimetableInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimetableState.initial()';
}


}




/// @nodoc


class _TimetableLoading implements TimetableState {
  const _TimetableLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimetableLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimetableState.loading()';
}


}




/// @nodoc


class _TimetableSuccess implements TimetableState {
  const _TimetableSuccess({required this.timetable});
  

 final  Timetable timetable;

/// Create a copy of TimetableState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimetableSuccessCopyWith<_TimetableSuccess> get copyWith => __$TimetableSuccessCopyWithImpl<_TimetableSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimetableSuccess&&(identical(other.timetable, timetable) || other.timetable == timetable));
}


@override
int get hashCode => Object.hash(runtimeType,timetable);

@override
String toString() {
  return 'TimetableState.success(timetable: $timetable)';
}


}

/// @nodoc
abstract mixin class _$TimetableSuccessCopyWith<$Res> implements $TimetableStateCopyWith<$Res> {
  factory _$TimetableSuccessCopyWith(_TimetableSuccess value, $Res Function(_TimetableSuccess) _then) = __$TimetableSuccessCopyWithImpl;
@useResult
$Res call({
 Timetable timetable
});


$TimetableCopyWith<$Res> get timetable;

}
/// @nodoc
class __$TimetableSuccessCopyWithImpl<$Res>
    implements _$TimetableSuccessCopyWith<$Res> {
  __$TimetableSuccessCopyWithImpl(this._self, this._then);

  final _TimetableSuccess _self;
  final $Res Function(_TimetableSuccess) _then;

/// Create a copy of TimetableState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timetable = null,}) {
  return _then(_TimetableSuccess(
timetable: null == timetable ? _self.timetable : timetable // ignore: cast_nullable_to_non_nullable
as Timetable,
  ));
}

/// Create a copy of TimetableState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimetableCopyWith<$Res> get timetable {
  
  return $TimetableCopyWith<$Res>(_self.timetable, (value) {
    return _then(_self.copyWith(timetable: value));
  });
}
}

/// @nodoc


class _TimetableError implements TimetableState {
  const _TimetableError({required this.error});
  

 final  String error;

/// Create a copy of TimetableState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimetableErrorCopyWith<_TimetableError> get copyWith => __$TimetableErrorCopyWithImpl<_TimetableError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimetableError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'TimetableState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$TimetableErrorCopyWith<$Res> implements $TimetableStateCopyWith<$Res> {
  factory _$TimetableErrorCopyWith(_TimetableError value, $Res Function(_TimetableError) _then) = __$TimetableErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$TimetableErrorCopyWithImpl<$Res>
    implements _$TimetableErrorCopyWith<$Res> {
  __$TimetableErrorCopyWithImpl(this._self, this._then);

  final _TimetableError _self;
  final $Res Function(_TimetableError) _then;

/// Create a copy of TimetableState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_TimetableError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
