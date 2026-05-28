// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Event {

// — с сервера —
 String get id; String get title; String get annotation; DateTime get startsAt; DateTime get endsAt; String get roomNumber; String get roomAddress; int get roomCapacity; String get creatorId; String? get imageUrl;// — синтетика до появления на сервере —
 String get body; String get organizer; int get takenSeats; bool get isEnrolled; List<String> get tags;
/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCopyWith<Event> get copyWith => _$EventCopyWithImpl<Event>(this as Event, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Event&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.annotation, annotation) || other.annotation == annotation)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.roomAddress, roomAddress) || other.roomAddress == roomAddress)&&(identical(other.roomCapacity, roomCapacity) || other.roomCapacity == roomCapacity)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.body, body) || other.body == body)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.takenSeats, takenSeats) || other.takenSeats == takenSeats)&&(identical(other.isEnrolled, isEnrolled) || other.isEnrolled == isEnrolled)&&const DeepCollectionEquality().equals(other.tags, tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,annotation,startsAt,endsAt,roomNumber,roomAddress,roomCapacity,creatorId,imageUrl,body,organizer,takenSeats,isEnrolled,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'Event(id: $id, title: $title, annotation: $annotation, startsAt: $startsAt, endsAt: $endsAt, roomNumber: $roomNumber, roomAddress: $roomAddress, roomCapacity: $roomCapacity, creatorId: $creatorId, imageUrl: $imageUrl, body: $body, organizer: $organizer, takenSeats: $takenSeats, isEnrolled: $isEnrolled, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $EventCopyWith<$Res>  {
  factory $EventCopyWith(Event value, $Res Function(Event) _then) = _$EventCopyWithImpl;
@useResult
$Res call({
 String id, String title, String annotation, DateTime startsAt, DateTime endsAt, String roomNumber, String roomAddress, int roomCapacity, String creatorId, String? imageUrl, String body, String organizer, int takenSeats, bool isEnrolled, List<String> tags
});




}
/// @nodoc
class _$EventCopyWithImpl<$Res>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._self, this._then);

  final Event _self;
  final $Res Function(Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? annotation = null,Object? startsAt = null,Object? endsAt = null,Object? roomNumber = null,Object? roomAddress = null,Object? roomCapacity = null,Object? creatorId = null,Object? imageUrl = freezed,Object? body = null,Object? organizer = null,Object? takenSeats = null,Object? isEnrolled = null,Object? tags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,annotation: null == annotation ? _self.annotation : annotation // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,roomAddress: null == roomAddress ? _self.roomAddress : roomAddress // ignore: cast_nullable_to_non_nullable
as String,roomCapacity: null == roomCapacity ? _self.roomCapacity : roomCapacity // ignore: cast_nullable_to_non_nullable
as int,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,organizer: null == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as String,takenSeats: null == takenSeats ? _self.takenSeats : takenSeats // ignore: cast_nullable_to_non_nullable
as int,isEnrolled: null == isEnrolled ? _self.isEnrolled : isEnrolled // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Event].
extension EventPatterns on Event {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Event value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Event() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Event value)  $default,){
final _that = this;
switch (_that) {
case _Event():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Event value)?  $default,){
final _that = this;
switch (_that) {
case _Event() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String annotation,  DateTime startsAt,  DateTime endsAt,  String roomNumber,  String roomAddress,  int roomCapacity,  String creatorId,  String? imageUrl,  String body,  String organizer,  int takenSeats,  bool isEnrolled,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.title,_that.annotation,_that.startsAt,_that.endsAt,_that.roomNumber,_that.roomAddress,_that.roomCapacity,_that.creatorId,_that.imageUrl,_that.body,_that.organizer,_that.takenSeats,_that.isEnrolled,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String annotation,  DateTime startsAt,  DateTime endsAt,  String roomNumber,  String roomAddress,  int roomCapacity,  String creatorId,  String? imageUrl,  String body,  String organizer,  int takenSeats,  bool isEnrolled,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _Event():
return $default(_that.id,_that.title,_that.annotation,_that.startsAt,_that.endsAt,_that.roomNumber,_that.roomAddress,_that.roomCapacity,_that.creatorId,_that.imageUrl,_that.body,_that.organizer,_that.takenSeats,_that.isEnrolled,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String annotation,  DateTime startsAt,  DateTime endsAt,  String roomNumber,  String roomAddress,  int roomCapacity,  String creatorId,  String? imageUrl,  String body,  String organizer,  int takenSeats,  bool isEnrolled,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.title,_that.annotation,_that.startsAt,_that.endsAt,_that.roomNumber,_that.roomAddress,_that.roomCapacity,_that.creatorId,_that.imageUrl,_that.body,_that.organizer,_that.takenSeats,_that.isEnrolled,_that.tags);case _:
  return null;

}
}

}

/// @nodoc


class _Event implements Event {
  const _Event({required this.id, required this.title, required this.annotation, required this.startsAt, required this.endsAt, required this.roomNumber, required this.roomAddress, required this.roomCapacity, required this.creatorId, this.imageUrl, this.body = '', this.organizer = '', this.takenSeats = 0, this.isEnrolled = false, final  List<String> tags = const []}): _tags = tags;
  

// — с сервера —
@override final  String id;
@override final  String title;
@override final  String annotation;
@override final  DateTime startsAt;
@override final  DateTime endsAt;
@override final  String roomNumber;
@override final  String roomAddress;
@override final  int roomCapacity;
@override final  String creatorId;
@override final  String? imageUrl;
// — синтетика до появления на сервере —
@override@JsonKey() final  String body;
@override@JsonKey() final  String organizer;
@override@JsonKey() final  int takenSeats;
@override@JsonKey() final  bool isEnrolled;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventCopyWith<_Event> get copyWith => __$EventCopyWithImpl<_Event>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Event&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.annotation, annotation) || other.annotation == annotation)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.roomAddress, roomAddress) || other.roomAddress == roomAddress)&&(identical(other.roomCapacity, roomCapacity) || other.roomCapacity == roomCapacity)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.body, body) || other.body == body)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.takenSeats, takenSeats) || other.takenSeats == takenSeats)&&(identical(other.isEnrolled, isEnrolled) || other.isEnrolled == isEnrolled)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,annotation,startsAt,endsAt,roomNumber,roomAddress,roomCapacity,creatorId,imageUrl,body,organizer,takenSeats,isEnrolled,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'Event(id: $id, title: $title, annotation: $annotation, startsAt: $startsAt, endsAt: $endsAt, roomNumber: $roomNumber, roomAddress: $roomAddress, roomCapacity: $roomCapacity, creatorId: $creatorId, imageUrl: $imageUrl, body: $body, organizer: $organizer, takenSeats: $takenSeats, isEnrolled: $isEnrolled, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) _then) = __$EventCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String annotation, DateTime startsAt, DateTime endsAt, String roomNumber, String roomAddress, int roomCapacity, String creatorId, String? imageUrl, String body, String organizer, int takenSeats, bool isEnrolled, List<String> tags
});




}
/// @nodoc
class __$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(this._self, this._then);

  final _Event _self;
  final $Res Function(_Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? annotation = null,Object? startsAt = null,Object? endsAt = null,Object? roomNumber = null,Object? roomAddress = null,Object? roomCapacity = null,Object? creatorId = null,Object? imageUrl = freezed,Object? body = null,Object? organizer = null,Object? takenSeats = null,Object? isEnrolled = null,Object? tags = null,}) {
  return _then(_Event(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,annotation: null == annotation ? _self.annotation : annotation // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,roomAddress: null == roomAddress ? _self.roomAddress : roomAddress // ignore: cast_nullable_to_non_nullable
as String,roomCapacity: null == roomCapacity ? _self.roomCapacity : roomCapacity // ignore: cast_nullable_to_non_nullable
as int,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,organizer: null == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as String,takenSeats: null == takenSeats ? _self.takenSeats : takenSeats // ignore: cast_nullable_to_non_nullable
as int,isEnrolled: null == isEnrolled ? _self.isEnrolled : isEnrolled // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
