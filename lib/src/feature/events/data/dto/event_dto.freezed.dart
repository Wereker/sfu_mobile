// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventDTO {

@JsonKey(fromJson: _intToString) String get id; String get title; String get annotation;@JsonKey(name: 'starts_at') String get startsAt;@JsonKey(name: 'ends_at') String get endsAt; RoomDTO get room;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'creator_id', fromJson: _intToString) String get creatorId;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of EventDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventDTOCopyWith<EventDTO> get copyWith => _$EventDTOCopyWithImpl<EventDTO>(this as EventDTO, _$identity);

  /// Serializes this EventDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.annotation, annotation) || other.annotation == annotation)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.room, room) || other.room == room)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,annotation,startsAt,endsAt,room,imageUrl,creatorId,createdAt,updatedAt);

@override
String toString() {
  return 'EventDTO(id: $id, title: $title, annotation: $annotation, startsAt: $startsAt, endsAt: $endsAt, room: $room, imageUrl: $imageUrl, creatorId: $creatorId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $EventDTOCopyWith<$Res>  {
  factory $EventDTOCopyWith(EventDTO value, $Res Function(EventDTO) _then) = _$EventDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intToString) String id, String title, String annotation,@JsonKey(name: 'starts_at') String startsAt,@JsonKey(name: 'ends_at') String endsAt, RoomDTO room,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'creator_id', fromJson: _intToString) String creatorId,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});


$RoomDTOCopyWith<$Res> get room;

}
/// @nodoc
class _$EventDTOCopyWithImpl<$Res>
    implements $EventDTOCopyWith<$Res> {
  _$EventDTOCopyWithImpl(this._self, this._then);

  final EventDTO _self;
  final $Res Function(EventDTO) _then;

/// Create a copy of EventDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? annotation = null,Object? startsAt = null,Object? endsAt = null,Object? room = null,Object? imageUrl = freezed,Object? creatorId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,annotation: null == annotation ? _self.annotation : annotation // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as RoomDTO,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of EventDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomDTOCopyWith<$Res> get room {
  
  return $RoomDTOCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}


/// Adds pattern-matching-related methods to [EventDTO].
extension EventDTOPatterns on EventDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventDTO value)  $default,){
final _that = this;
switch (_that) {
case _EventDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventDTO value)?  $default,){
final _that = this;
switch (_that) {
case _EventDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id,  String title,  String annotation, @JsonKey(name: 'starts_at')  String startsAt, @JsonKey(name: 'ends_at')  String endsAt,  RoomDTO room, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'creator_id', fromJson: _intToString)  String creatorId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventDTO() when $default != null:
return $default(_that.id,_that.title,_that.annotation,_that.startsAt,_that.endsAt,_that.room,_that.imageUrl,_that.creatorId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id,  String title,  String annotation, @JsonKey(name: 'starts_at')  String startsAt, @JsonKey(name: 'ends_at')  String endsAt,  RoomDTO room, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'creator_id', fromJson: _intToString)  String creatorId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _EventDTO():
return $default(_that.id,_that.title,_that.annotation,_that.startsAt,_that.endsAt,_that.room,_that.imageUrl,_that.creatorId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intToString)  String id,  String title,  String annotation, @JsonKey(name: 'starts_at')  String startsAt, @JsonKey(name: 'ends_at')  String endsAt,  RoomDTO room, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'creator_id', fromJson: _intToString)  String creatorId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _EventDTO() when $default != null:
return $default(_that.id,_that.title,_that.annotation,_that.startsAt,_that.endsAt,_that.room,_that.imageUrl,_that.creatorId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventDTO implements EventDTO {
  const _EventDTO({@JsonKey(fromJson: _intToString) required this.id, required this.title, required this.annotation, @JsonKey(name: 'starts_at') required this.startsAt, @JsonKey(name: 'ends_at') required this.endsAt, required this.room, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'creator_id', fromJson: _intToString) required this.creatorId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _EventDTO.fromJson(Map<String, dynamic> json) => _$EventDTOFromJson(json);

@override@JsonKey(fromJson: _intToString) final  String id;
@override final  String title;
@override final  String annotation;
@override@JsonKey(name: 'starts_at') final  String startsAt;
@override@JsonKey(name: 'ends_at') final  String endsAt;
@override final  RoomDTO room;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'creator_id', fromJson: _intToString) final  String creatorId;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of EventDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDTOCopyWith<_EventDTO> get copyWith => __$EventDTOCopyWithImpl<_EventDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.annotation, annotation) || other.annotation == annotation)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.room, room) || other.room == room)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,annotation,startsAt,endsAt,room,imageUrl,creatorId,createdAt,updatedAt);

@override
String toString() {
  return 'EventDTO(id: $id, title: $title, annotation: $annotation, startsAt: $startsAt, endsAt: $endsAt, room: $room, imageUrl: $imageUrl, creatorId: $creatorId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EventDTOCopyWith<$Res> implements $EventDTOCopyWith<$Res> {
  factory _$EventDTOCopyWith(_EventDTO value, $Res Function(_EventDTO) _then) = __$EventDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intToString) String id, String title, String annotation,@JsonKey(name: 'starts_at') String startsAt,@JsonKey(name: 'ends_at') String endsAt, RoomDTO room,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'creator_id', fromJson: _intToString) String creatorId,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});


@override $RoomDTOCopyWith<$Res> get room;

}
/// @nodoc
class __$EventDTOCopyWithImpl<$Res>
    implements _$EventDTOCopyWith<$Res> {
  __$EventDTOCopyWithImpl(this._self, this._then);

  final _EventDTO _self;
  final $Res Function(_EventDTO) _then;

/// Create a copy of EventDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? annotation = null,Object? startsAt = null,Object? endsAt = null,Object? room = null,Object? imageUrl = freezed,Object? creatorId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_EventDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,annotation: null == annotation ? _self.annotation : annotation // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as RoomDTO,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of EventDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomDTOCopyWith<$Res> get room {
  
  return $RoomDTOCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

// dart format on
