// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EventsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EventsEvent()';
}


}

/// @nodoc
class $EventsEventCopyWith<$Res>  {
$EventsEventCopyWith(EventsEvent _, $Res Function(EventsEvent) __);
}


/// Adds pattern-matching-related methods to [EventsEvent].
extension EventsEventPatterns on EventsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _Enroll value)?  enroll,TResult Function( _Unenroll value)?  unenroll,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Enroll() when enroll != null:
return enroll(_that);case _Unenroll() when unenroll != null:
return unenroll(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _Enroll value)  enroll,required TResult Function( _Unenroll value)  unenroll,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _Enroll():
return enroll(_that);case _Unenroll():
return unenroll(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _Enroll value)?  enroll,TResult? Function( _Unenroll value)?  unenroll,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Enroll() when enroll != null:
return enroll(_that);case _Unenroll() when unenroll != null:
return unenroll(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String eventId)?  enroll,TResult Function( String eventId)?  unenroll,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Enroll() when enroll != null:
return enroll(_that.eventId);case _Unenroll() when unenroll != null:
return unenroll(_that.eventId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String eventId)  enroll,required TResult Function( String eventId)  unenroll,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _Enroll():
return enroll(_that.eventId);case _Unenroll():
return unenroll(_that.eventId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String eventId)?  enroll,TResult? Function( String eventId)?  unenroll,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Enroll() when enroll != null:
return enroll(_that.eventId);case _Unenroll() when unenroll != null:
return unenroll(_that.eventId);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements EventsEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EventsEvent.load()';
}


}




/// @nodoc


class _Enroll implements EventsEvent {
  const _Enroll(this.eventId);
  

 final  String eventId;

/// Create a copy of EventsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnrollCopyWith<_Enroll> get copyWith => __$EnrollCopyWithImpl<_Enroll>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Enroll&&(identical(other.eventId, eventId) || other.eventId == eventId));
}


@override
int get hashCode => Object.hash(runtimeType,eventId);

@override
String toString() {
  return 'EventsEvent.enroll(eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class _$EnrollCopyWith<$Res> implements $EventsEventCopyWith<$Res> {
  factory _$EnrollCopyWith(_Enroll value, $Res Function(_Enroll) _then) = __$EnrollCopyWithImpl;
@useResult
$Res call({
 String eventId
});




}
/// @nodoc
class __$EnrollCopyWithImpl<$Res>
    implements _$EnrollCopyWith<$Res> {
  __$EnrollCopyWithImpl(this._self, this._then);

  final _Enroll _self;
  final $Res Function(_Enroll) _then;

/// Create a copy of EventsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,}) {
  return _then(_Enroll(
null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unenroll implements EventsEvent {
  const _Unenroll(this.eventId);
  

 final  String eventId;

/// Create a copy of EventsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnenrollCopyWith<_Unenroll> get copyWith => __$UnenrollCopyWithImpl<_Unenroll>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unenroll&&(identical(other.eventId, eventId) || other.eventId == eventId));
}


@override
int get hashCode => Object.hash(runtimeType,eventId);

@override
String toString() {
  return 'EventsEvent.unenroll(eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class _$UnenrollCopyWith<$Res> implements $EventsEventCopyWith<$Res> {
  factory _$UnenrollCopyWith(_Unenroll value, $Res Function(_Unenroll) _then) = __$UnenrollCopyWithImpl;
@useResult
$Res call({
 String eventId
});




}
/// @nodoc
class __$UnenrollCopyWithImpl<$Res>
    implements _$UnenrollCopyWith<$Res> {
  __$UnenrollCopyWithImpl(this._self, this._then);

  final _Unenroll _self;
  final $Res Function(_Unenroll) _then;

/// Create a copy of EventsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,}) {
  return _then(_Unenroll(
null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$EventsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EventsState()';
}


}

/// @nodoc
class $EventsStateCopyWith<$Res>  {
$EventsStateCopyWith(EventsState _, $Res Function(EventsState) __);
}


/// Adds pattern-matching-related methods to [EventsState].
extension EventsStatePatterns on EventsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventsInitial value)?  initial,TResult Function( _EventsLoading value)?  loading,TResult Function( _EventsSuccess value)?  success,TResult Function( _EventsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventsInitial() when initial != null:
return initial(_that);case _EventsLoading() when loading != null:
return loading(_that);case _EventsSuccess() when success != null:
return success(_that);case _EventsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventsInitial value)  initial,required TResult Function( _EventsLoading value)  loading,required TResult Function( _EventsSuccess value)  success,required TResult Function( _EventsError value)  error,}){
final _that = this;
switch (_that) {
case _EventsInitial():
return initial(_that);case _EventsLoading():
return loading(_that);case _EventsSuccess():
return success(_that);case _EventsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventsInitial value)?  initial,TResult? Function( _EventsLoading value)?  loading,TResult? Function( _EventsSuccess value)?  success,TResult? Function( _EventsError value)?  error,}){
final _that = this;
switch (_that) {
case _EventsInitial() when initial != null:
return initial(_that);case _EventsLoading() when loading != null:
return loading(_that);case _EventsSuccess() when success != null:
return success(_that);case _EventsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Event> events)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventsInitial() when initial != null:
return initial();case _EventsLoading() when loading != null:
return loading();case _EventsSuccess() when success != null:
return success(_that.events);case _EventsError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Event> events)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _EventsInitial():
return initial();case _EventsLoading():
return loading();case _EventsSuccess():
return success(_that.events);case _EventsError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Event> events)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _EventsInitial() when initial != null:
return initial();case _EventsLoading() when loading != null:
return loading();case _EventsSuccess() when success != null:
return success(_that.events);case _EventsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _EventsInitial implements EventsState {
  const _EventsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EventsState.initial()';
}


}




/// @nodoc


class _EventsLoading implements EventsState {
  const _EventsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EventsState.loading()';
}


}




/// @nodoc


class _EventsSuccess implements EventsState {
  const _EventsSuccess(final  List<Event> events): _events = events;
  

 final  List<Event> _events;
 List<Event> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}


/// Create a copy of EventsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventsSuccessCopyWith<_EventsSuccess> get copyWith => __$EventsSuccessCopyWithImpl<_EventsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventsSuccess&&const DeepCollectionEquality().equals(other._events, _events));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events));

@override
String toString() {
  return 'EventsState.success(events: $events)';
}


}

/// @nodoc
abstract mixin class _$EventsSuccessCopyWith<$Res> implements $EventsStateCopyWith<$Res> {
  factory _$EventsSuccessCopyWith(_EventsSuccess value, $Res Function(_EventsSuccess) _then) = __$EventsSuccessCopyWithImpl;
@useResult
$Res call({
 List<Event> events
});




}
/// @nodoc
class __$EventsSuccessCopyWithImpl<$Res>
    implements _$EventsSuccessCopyWith<$Res> {
  __$EventsSuccessCopyWithImpl(this._self, this._then);

  final _EventsSuccess _self;
  final $Res Function(_EventsSuccess) _then;

/// Create a copy of EventsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? events = null,}) {
  return _then(_EventsSuccess(
null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<Event>,
  ));
}


}

/// @nodoc


class _EventsError implements EventsState {
  const _EventsError(this.message);
  

 final  String message;

/// Create a copy of EventsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventsErrorCopyWith<_EventsError> get copyWith => __$EventsErrorCopyWithImpl<_EventsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'EventsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$EventsErrorCopyWith<$Res> implements $EventsStateCopyWith<$Res> {
  factory _$EventsErrorCopyWith(_EventsError value, $Res Function(_EventsError) _then) = __$EventsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$EventsErrorCopyWithImpl<$Res>
    implements _$EventsErrorCopyWith<$Res> {
  __$EventsErrorCopyWithImpl(this._self, this._then);

  final _EventsError _self;
  final $Res Function(_EventsError) _then;

/// Create a copy of EventsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_EventsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
