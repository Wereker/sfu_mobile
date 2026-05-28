// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publish_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PublishEvent {

 String get title;
/// Create a copy of PublishEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublishEventCopyWith<PublishEvent> get copyWith => _$PublishEventCopyWithImpl<PublishEvent>(this as PublishEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishEvent&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'PublishEvent(title: $title)';
}


}

/// @nodoc
abstract mixin class $PublishEventCopyWith<$Res>  {
  factory $PublishEventCopyWith(PublishEvent value, $Res Function(PublishEvent) _then) = _$PublishEventCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class _$PublishEventCopyWithImpl<$Res>
    implements $PublishEventCopyWith<$Res> {
  _$PublishEventCopyWithImpl(this._self, this._then);

  final PublishEvent _self;
  final $Res Function(PublishEvent) _then;

/// Create a copy of PublishEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PublishEvent].
extension PublishEventPatterns on PublishEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PublishAnnouncement value)?  publishAnnouncement,TResult Function( _PublishEvent value)?  publishEvent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublishAnnouncement() when publishAnnouncement != null:
return publishAnnouncement(_that);case _PublishEvent() when publishEvent != null:
return publishEvent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PublishAnnouncement value)  publishAnnouncement,required TResult Function( _PublishEvent value)  publishEvent,}){
final _that = this;
switch (_that) {
case _PublishAnnouncement():
return publishAnnouncement(_that);case _PublishEvent():
return publishEvent(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PublishAnnouncement value)?  publishAnnouncement,TResult? Function( _PublishEvent value)?  publishEvent,}){
final _that = this;
switch (_that) {
case _PublishAnnouncement() when publishAnnouncement != null:
return publishAnnouncement(_that);case _PublishEvent() when publishEvent != null:
return publishEvent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String title,  String content,  String publishAt,  String expiresAt,  List<int> targetGroupIds,  List<int> targetStreamIds)?  publishAnnouncement,TResult Function( String title,  String annotation,  String startsAt,  String endsAt,  int roomId)?  publishEvent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublishAnnouncement() when publishAnnouncement != null:
return publishAnnouncement(_that.title,_that.content,_that.publishAt,_that.expiresAt,_that.targetGroupIds,_that.targetStreamIds);case _PublishEvent() when publishEvent != null:
return publishEvent(_that.title,_that.annotation,_that.startsAt,_that.endsAt,_that.roomId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String title,  String content,  String publishAt,  String expiresAt,  List<int> targetGroupIds,  List<int> targetStreamIds)  publishAnnouncement,required TResult Function( String title,  String annotation,  String startsAt,  String endsAt,  int roomId)  publishEvent,}) {final _that = this;
switch (_that) {
case _PublishAnnouncement():
return publishAnnouncement(_that.title,_that.content,_that.publishAt,_that.expiresAt,_that.targetGroupIds,_that.targetStreamIds);case _PublishEvent():
return publishEvent(_that.title,_that.annotation,_that.startsAt,_that.endsAt,_that.roomId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String title,  String content,  String publishAt,  String expiresAt,  List<int> targetGroupIds,  List<int> targetStreamIds)?  publishAnnouncement,TResult? Function( String title,  String annotation,  String startsAt,  String endsAt,  int roomId)?  publishEvent,}) {final _that = this;
switch (_that) {
case _PublishAnnouncement() when publishAnnouncement != null:
return publishAnnouncement(_that.title,_that.content,_that.publishAt,_that.expiresAt,_that.targetGroupIds,_that.targetStreamIds);case _PublishEvent() when publishEvent != null:
return publishEvent(_that.title,_that.annotation,_that.startsAt,_that.endsAt,_that.roomId);case _:
  return null;

}
}

}

/// @nodoc


class _PublishAnnouncement implements PublishEvent {
  const _PublishAnnouncement({required this.title, required this.content, required this.publishAt, required this.expiresAt, required final  List<int> targetGroupIds, required final  List<int> targetStreamIds}): _targetGroupIds = targetGroupIds,_targetStreamIds = targetStreamIds;
  

@override final  String title;
 final  String content;
 final  String publishAt;
 final  String expiresAt;
 final  List<int> _targetGroupIds;
 List<int> get targetGroupIds {
  if (_targetGroupIds is EqualUnmodifiableListView) return _targetGroupIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetGroupIds);
}

 final  List<int> _targetStreamIds;
 List<int> get targetStreamIds {
  if (_targetStreamIds is EqualUnmodifiableListView) return _targetStreamIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetStreamIds);
}


/// Create a copy of PublishEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublishAnnouncementCopyWith<_PublishAnnouncement> get copyWith => __$PublishAnnouncementCopyWithImpl<_PublishAnnouncement>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublishAnnouncement&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.publishAt, publishAt) || other.publishAt == publishAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&const DeepCollectionEquality().equals(other._targetGroupIds, _targetGroupIds)&&const DeepCollectionEquality().equals(other._targetStreamIds, _targetStreamIds));
}


@override
int get hashCode => Object.hash(runtimeType,title,content,publishAt,expiresAt,const DeepCollectionEquality().hash(_targetGroupIds),const DeepCollectionEquality().hash(_targetStreamIds));

@override
String toString() {
  return 'PublishEvent.publishAnnouncement(title: $title, content: $content, publishAt: $publishAt, expiresAt: $expiresAt, targetGroupIds: $targetGroupIds, targetStreamIds: $targetStreamIds)';
}


}

/// @nodoc
abstract mixin class _$PublishAnnouncementCopyWith<$Res> implements $PublishEventCopyWith<$Res> {
  factory _$PublishAnnouncementCopyWith(_PublishAnnouncement value, $Res Function(_PublishAnnouncement) _then) = __$PublishAnnouncementCopyWithImpl;
@override @useResult
$Res call({
 String title, String content, String publishAt, String expiresAt, List<int> targetGroupIds, List<int> targetStreamIds
});




}
/// @nodoc
class __$PublishAnnouncementCopyWithImpl<$Res>
    implements _$PublishAnnouncementCopyWith<$Res> {
  __$PublishAnnouncementCopyWithImpl(this._self, this._then);

  final _PublishAnnouncement _self;
  final $Res Function(_PublishAnnouncement) _then;

/// Create a copy of PublishEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? content = null,Object? publishAt = null,Object? expiresAt = null,Object? targetGroupIds = null,Object? targetStreamIds = null,}) {
  return _then(_PublishAnnouncement(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,publishAt: null == publishAt ? _self.publishAt : publishAt // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,targetGroupIds: null == targetGroupIds ? _self._targetGroupIds : targetGroupIds // ignore: cast_nullable_to_non_nullable
as List<int>,targetStreamIds: null == targetStreamIds ? _self._targetStreamIds : targetStreamIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc


class _PublishEvent implements PublishEvent {
  const _PublishEvent({required this.title, required this.annotation, required this.startsAt, required this.endsAt, required this.roomId});
  

@override final  String title;
 final  String annotation;
 final  String startsAt;
 final  String endsAt;
 final  int roomId;

/// Create a copy of PublishEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublishEventCopyWith<_PublishEvent> get copyWith => __$PublishEventCopyWithImpl<_PublishEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublishEvent&&(identical(other.title, title) || other.title == title)&&(identical(other.annotation, annotation) || other.annotation == annotation)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.roomId, roomId) || other.roomId == roomId));
}


@override
int get hashCode => Object.hash(runtimeType,title,annotation,startsAt,endsAt,roomId);

@override
String toString() {
  return 'PublishEvent.publishEvent(title: $title, annotation: $annotation, startsAt: $startsAt, endsAt: $endsAt, roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class _$PublishEventCopyWith<$Res> implements $PublishEventCopyWith<$Res> {
  factory _$PublishEventCopyWith(_PublishEvent value, $Res Function(_PublishEvent) _then) = __$PublishEventCopyWithImpl;
@override @useResult
$Res call({
 String title, String annotation, String startsAt, String endsAt, int roomId
});




}
/// @nodoc
class __$PublishEventCopyWithImpl<$Res>
    implements _$PublishEventCopyWith<$Res> {
  __$PublishEventCopyWithImpl(this._self, this._then);

  final _PublishEvent _self;
  final $Res Function(_PublishEvent) _then;

/// Create a copy of PublishEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? annotation = null,Object? startsAt = null,Object? endsAt = null,Object? roomId = null,}) {
  return _then(_PublishEvent(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,annotation: null == annotation ? _self.annotation : annotation // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$PublishState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PublishState()';
}


}

/// @nodoc
class $PublishStateCopyWith<$Res>  {
$PublishStateCopyWith(PublishState _, $Res Function(PublishState) __);
}


/// Adds pattern-matching-related methods to [PublishState].
extension PublishStatePatterns on PublishState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PublishInitial value)?  initial,TResult Function( _PublishLoading value)?  loading,TResult Function( _PublishSuccess value)?  success,TResult Function( _PublishError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublishInitial() when initial != null:
return initial(_that);case _PublishLoading() when loading != null:
return loading(_that);case _PublishSuccess() when success != null:
return success(_that);case _PublishError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PublishInitial value)  initial,required TResult Function( _PublishLoading value)  loading,required TResult Function( _PublishSuccess value)  success,required TResult Function( _PublishError value)  error,}){
final _that = this;
switch (_that) {
case _PublishInitial():
return initial(_that);case _PublishLoading():
return loading(_that);case _PublishSuccess():
return success(_that);case _PublishError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PublishInitial value)?  initial,TResult? Function( _PublishLoading value)?  loading,TResult? Function( _PublishSuccess value)?  success,TResult? Function( _PublishError value)?  error,}){
final _that = this;
switch (_that) {
case _PublishInitial() when initial != null:
return initial(_that);case _PublishLoading() when loading != null:
return loading(_that);case _PublishSuccess() when success != null:
return success(_that);case _PublishError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublishInitial() when initial != null:
return initial();case _PublishLoading() when loading != null:
return loading();case _PublishSuccess() when success != null:
return success();case _PublishError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _PublishInitial():
return initial();case _PublishLoading():
return loading();case _PublishSuccess():
return success();case _PublishError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _PublishInitial() when initial != null:
return initial();case _PublishLoading() when loading != null:
return loading();case _PublishSuccess() when success != null:
return success();case _PublishError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _PublishInitial implements PublishState {
  const _PublishInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublishInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PublishState.initial()';
}


}




/// @nodoc


class _PublishLoading implements PublishState {
  const _PublishLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublishLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PublishState.loading()';
}


}




/// @nodoc


class _PublishSuccess implements PublishState {
  const _PublishSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublishSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PublishState.success()';
}


}




/// @nodoc


class _PublishError implements PublishState {
  const _PublishError(this.message);
  

 final  String message;

/// Create a copy of PublishState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublishErrorCopyWith<_PublishError> get copyWith => __$PublishErrorCopyWithImpl<_PublishError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublishError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PublishState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$PublishErrorCopyWith<$Res> implements $PublishStateCopyWith<$Res> {
  factory _$PublishErrorCopyWith(_PublishError value, $Res Function(_PublishError) _then) = __$PublishErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$PublishErrorCopyWithImpl<$Res>
    implements _$PublishErrorCopyWith<$Res> {
  __$PublishErrorCopyWithImpl(this._self, this._then);

  final _PublishError _self;
  final $Res Function(_PublishError) _then;

/// Create a copy of PublishState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_PublishError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
