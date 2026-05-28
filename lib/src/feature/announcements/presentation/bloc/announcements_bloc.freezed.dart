// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcements_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnouncementsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnouncementsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnouncementsEvent()';
}


}

/// @nodoc
class $AnnouncementsEventCopyWith<$Res>  {
$AnnouncementsEventCopyWith(AnnouncementsEvent _, $Res Function(AnnouncementsEvent) __);
}


/// Adds pattern-matching-related methods to [AnnouncementsEvent].
extension AnnouncementsEventPatterns on AnnouncementsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class _Load implements AnnouncementsEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnouncementsEvent.load()';
}


}




/// @nodoc
mixin _$AnnouncementsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnouncementsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnouncementsState()';
}


}

/// @nodoc
class $AnnouncementsStateCopyWith<$Res>  {
$AnnouncementsStateCopyWith(AnnouncementsState _, $Res Function(AnnouncementsState) __);
}


/// Adds pattern-matching-related methods to [AnnouncementsState].
extension AnnouncementsStatePatterns on AnnouncementsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AnnouncementsInitial value)?  initial,TResult Function( _AnnouncementsLoading value)?  loading,TResult Function( _AnnouncementsSuccess value)?  success,TResult Function( _AnnouncementsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnouncementsInitial() when initial != null:
return initial(_that);case _AnnouncementsLoading() when loading != null:
return loading(_that);case _AnnouncementsSuccess() when success != null:
return success(_that);case _AnnouncementsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AnnouncementsInitial value)  initial,required TResult Function( _AnnouncementsLoading value)  loading,required TResult Function( _AnnouncementsSuccess value)  success,required TResult Function( _AnnouncementsError value)  error,}){
final _that = this;
switch (_that) {
case _AnnouncementsInitial():
return initial(_that);case _AnnouncementsLoading():
return loading(_that);case _AnnouncementsSuccess():
return success(_that);case _AnnouncementsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AnnouncementsInitial value)?  initial,TResult? Function( _AnnouncementsLoading value)?  loading,TResult? Function( _AnnouncementsSuccess value)?  success,TResult? Function( _AnnouncementsError value)?  error,}){
final _that = this;
switch (_that) {
case _AnnouncementsInitial() when initial != null:
return initial(_that);case _AnnouncementsLoading() when loading != null:
return loading(_that);case _AnnouncementsSuccess() when success != null:
return success(_that);case _AnnouncementsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Announcement> announcements)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnouncementsInitial() when initial != null:
return initial();case _AnnouncementsLoading() when loading != null:
return loading();case _AnnouncementsSuccess() when success != null:
return success(_that.announcements);case _AnnouncementsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Announcement> announcements)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _AnnouncementsInitial():
return initial();case _AnnouncementsLoading():
return loading();case _AnnouncementsSuccess():
return success(_that.announcements);case _AnnouncementsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Announcement> announcements)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _AnnouncementsInitial() when initial != null:
return initial();case _AnnouncementsLoading() when loading != null:
return loading();case _AnnouncementsSuccess() when success != null:
return success(_that.announcements);case _AnnouncementsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _AnnouncementsInitial implements AnnouncementsState {
  const _AnnouncementsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnouncementsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnouncementsState.initial()';
}


}




/// @nodoc


class _AnnouncementsLoading implements AnnouncementsState {
  const _AnnouncementsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnouncementsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnouncementsState.loading()';
}


}




/// @nodoc


class _AnnouncementsSuccess implements AnnouncementsState {
  const _AnnouncementsSuccess(final  List<Announcement> announcements): _announcements = announcements;
  

 final  List<Announcement> _announcements;
 List<Announcement> get announcements {
  if (_announcements is EqualUnmodifiableListView) return _announcements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_announcements);
}


/// Create a copy of AnnouncementsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnouncementsSuccessCopyWith<_AnnouncementsSuccess> get copyWith => __$AnnouncementsSuccessCopyWithImpl<_AnnouncementsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnouncementsSuccess&&const DeepCollectionEquality().equals(other._announcements, _announcements));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_announcements));

@override
String toString() {
  return 'AnnouncementsState.success(announcements: $announcements)';
}


}

/// @nodoc
abstract mixin class _$AnnouncementsSuccessCopyWith<$Res> implements $AnnouncementsStateCopyWith<$Res> {
  factory _$AnnouncementsSuccessCopyWith(_AnnouncementsSuccess value, $Res Function(_AnnouncementsSuccess) _then) = __$AnnouncementsSuccessCopyWithImpl;
@useResult
$Res call({
 List<Announcement> announcements
});




}
/// @nodoc
class __$AnnouncementsSuccessCopyWithImpl<$Res>
    implements _$AnnouncementsSuccessCopyWith<$Res> {
  __$AnnouncementsSuccessCopyWithImpl(this._self, this._then);

  final _AnnouncementsSuccess _self;
  final $Res Function(_AnnouncementsSuccess) _then;

/// Create a copy of AnnouncementsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? announcements = null,}) {
  return _then(_AnnouncementsSuccess(
null == announcements ? _self._announcements : announcements // ignore: cast_nullable_to_non_nullable
as List<Announcement>,
  ));
}


}

/// @nodoc


class _AnnouncementsError implements AnnouncementsState {
  const _AnnouncementsError(this.message);
  

 final  String message;

/// Create a copy of AnnouncementsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnouncementsErrorCopyWith<_AnnouncementsError> get copyWith => __$AnnouncementsErrorCopyWithImpl<_AnnouncementsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnouncementsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AnnouncementsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$AnnouncementsErrorCopyWith<$Res> implements $AnnouncementsStateCopyWith<$Res> {
  factory _$AnnouncementsErrorCopyWith(_AnnouncementsError value, $Res Function(_AnnouncementsError) _then) = __$AnnouncementsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$AnnouncementsErrorCopyWithImpl<$Res>
    implements _$AnnouncementsErrorCopyWith<$Res> {
  __$AnnouncementsErrorCopyWithImpl(this._self, this._then);

  final _AnnouncementsError _self;
  final $Res Function(_AnnouncementsError) _then;

/// Create a copy of AnnouncementsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_AnnouncementsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
