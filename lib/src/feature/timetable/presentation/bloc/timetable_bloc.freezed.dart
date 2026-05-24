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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadData value)?  loadData,TResult Function( _LoadDataForTarget value)?  loadDataForTarget,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadData() when loadData != null:
return loadData(_that);case _LoadDataForTarget() when loadDataForTarget != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadData value)  loadData,required TResult Function( _LoadDataForTarget value)  loadDataForTarget,}){
final _that = this;
switch (_that) {
case _LoadData():
return loadData(_that);case _LoadDataForTarget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadData value)?  loadData,TResult? Function( _LoadDataForTarget value)?  loadDataForTarget,}){
final _that = this;
switch (_that) {
case _LoadData() when loadData != null:
return loadData(_that);case _LoadDataForTarget() when loadDataForTarget != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int userId,  TimetableTargetType userType)?  loadData,TResult Function( int searchId,  TimetableTargetType searchType)?  loadDataForTarget,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadData() when loadData != null:
return loadData(_that.userId,_that.userType);case _LoadDataForTarget() when loadDataForTarget != null:
return loadDataForTarget(_that.searchId,_that.searchType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int userId,  TimetableTargetType userType)  loadData,required TResult Function( int searchId,  TimetableTargetType searchType)  loadDataForTarget,}) {final _that = this;
switch (_that) {
case _LoadData():
return loadData(_that.userId,_that.userType);case _LoadDataForTarget():
return loadDataForTarget(_that.searchId,_that.searchType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int userId,  TimetableTargetType userType)?  loadData,TResult? Function( int searchId,  TimetableTargetType searchType)?  loadDataForTarget,}) {final _that = this;
switch (_that) {
case _LoadData() when loadData != null:
return loadData(_that.userId,_that.userType);case _LoadDataForTarget() when loadDataForTarget != null:
return loadDataForTarget(_that.searchId,_that.searchType);case _:
  return null;

}
}

}

/// @nodoc


class _LoadData implements TimetableEvent {
  const _LoadData({required this.userId, required this.userType});
  

 final  int userId;
 final  TimetableTargetType userType;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadDataCopyWith<_LoadData> get copyWith => __$LoadDataCopyWithImpl<_LoadData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadData&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userType, userType) || other.userType == userType));
}


@override
int get hashCode => Object.hash(runtimeType,userId,userType);

@override
String toString() {
  return 'TimetableEvent.loadData(userId: $userId, userType: $userType)';
}


}

/// @nodoc
abstract mixin class _$LoadDataCopyWith<$Res> implements $TimetableEventCopyWith<$Res> {
  factory _$LoadDataCopyWith(_LoadData value, $Res Function(_LoadData) _then) = __$LoadDataCopyWithImpl;
@useResult
$Res call({
 int userId, TimetableTargetType userType
});




}
/// @nodoc
class __$LoadDataCopyWithImpl<$Res>
    implements _$LoadDataCopyWith<$Res> {
  __$LoadDataCopyWithImpl(this._self, this._then);

  final _LoadData _self;
  final $Res Function(_LoadData) _then;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? userType = null,}) {
  return _then(_LoadData(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as TimetableTargetType,
  ));
}


}

/// @nodoc


class _LoadDataForTarget implements TimetableEvent {
  const _LoadDataForTarget({required this.searchId, required this.searchType});
  

 final  int searchId;
 final  TimetableTargetType searchType;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadDataForTargetCopyWith<_LoadDataForTarget> get copyWith => __$LoadDataForTargetCopyWithImpl<_LoadDataForTarget>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadDataForTarget&&(identical(other.searchId, searchId) || other.searchId == searchId)&&(identical(other.searchType, searchType) || other.searchType == searchType));
}


@override
int get hashCode => Object.hash(runtimeType,searchId,searchType);

@override
String toString() {
  return 'TimetableEvent.loadDataForTarget(searchId: $searchId, searchType: $searchType)';
}


}

/// @nodoc
abstract mixin class _$LoadDataForTargetCopyWith<$Res> implements $TimetableEventCopyWith<$Res> {
  factory _$LoadDataForTargetCopyWith(_LoadDataForTarget value, $Res Function(_LoadDataForTarget) _then) = __$LoadDataForTargetCopyWithImpl;
@useResult
$Res call({
 int searchId, TimetableTargetType searchType
});




}
/// @nodoc
class __$LoadDataForTargetCopyWithImpl<$Res>
    implements _$LoadDataForTargetCopyWith<$Res> {
  __$LoadDataForTargetCopyWithImpl(this._self, this._then);

  final _LoadDataForTarget _self;
  final $Res Function(_LoadDataForTarget) _then;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchId = null,Object? searchType = null,}) {
  return _then(_LoadDataForTarget(
searchId: null == searchId ? _self.searchId : searchId // ignore: cast_nullable_to_non_nullable
as int,searchType: null == searchType ? _self.searchType : searchType // ignore: cast_nullable_to_non_nullable
as TimetableTargetType,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Timetable timetable,  NextLessonResult nextLesson)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimetableInitial() when initial != null:
return initial();case _TimetableLoading() when loading != null:
return loading();case _TimetableSuccess() when success != null:
return success(_that.timetable,_that.nextLesson);case _TimetableError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Timetable timetable,  NextLessonResult nextLesson)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _TimetableInitial():
return initial();case _TimetableLoading():
return loading();case _TimetableSuccess():
return success(_that.timetable,_that.nextLesson);case _TimetableError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Timetable timetable,  NextLessonResult nextLesson)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _TimetableInitial() when initial != null:
return initial();case _TimetableLoading() when loading != null:
return loading();case _TimetableSuccess() when success != null:
return success(_that.timetable,_that.nextLesson);case _TimetableError() when error != null:
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
  const _TimetableSuccess({required this.timetable, required this.nextLesson});
  

 final  Timetable timetable;
 final  NextLessonResult nextLesson;

/// Create a copy of TimetableState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimetableSuccessCopyWith<_TimetableSuccess> get copyWith => __$TimetableSuccessCopyWithImpl<_TimetableSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimetableSuccess&&(identical(other.timetable, timetable) || other.timetable == timetable)&&(identical(other.nextLesson, nextLesson) || other.nextLesson == nextLesson));
}


@override
int get hashCode => Object.hash(runtimeType,timetable,nextLesson);

@override
String toString() {
  return 'TimetableState.success(timetable: $timetable, nextLesson: $nextLesson)';
}


}

/// @nodoc
abstract mixin class _$TimetableSuccessCopyWith<$Res> implements $TimetableStateCopyWith<$Res> {
  factory _$TimetableSuccessCopyWith(_TimetableSuccess value, $Res Function(_TimetableSuccess) _then) = __$TimetableSuccessCopyWithImpl;
@useResult
$Res call({
 Timetable timetable, NextLessonResult nextLesson
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
@pragma('vm:prefer-inline') $Res call({Object? timetable = null,Object? nextLesson = null,}) {
  return _then(_TimetableSuccess(
timetable: null == timetable ? _self.timetable : timetable // ignore: cast_nullable_to_non_nullable
as Timetable,nextLesson: null == nextLesson ? _self.nextLesson : nextLesson // ignore: cast_nullable_to_non_nullable
as NextLessonResult,
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
