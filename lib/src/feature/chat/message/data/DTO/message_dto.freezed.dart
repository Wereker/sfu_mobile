// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageDTO {

@JsonKey(fromJson: _intToString) String get id;@JsonKey(name: 'chat_id', fromJson: _intToString) String get chatId;@JsonKey(name: 'sender_id', fromJson: _intToString) String get senderId; String get body;@JsonKey(name: 'created_at') String get createdAt;// Поля которые могут прийти из HTTP-истории (не из WS)
@JsonKey(name: 'sender_name') String get senderName; bool get isOutgoing;
/// Create a copy of MessageDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageDTOCopyWith<MessageDTO> get copyWith => _$MessageDTOCopyWithImpl<MessageDTO>(this as MessageDTO, _$identity);

  /// Serializes this MessageDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.isOutgoing, isOutgoing) || other.isOutgoing == isOutgoing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,senderId,body,createdAt,senderName,isOutgoing);

@override
String toString() {
  return 'MessageDTO(id: $id, chatId: $chatId, senderId: $senderId, body: $body, createdAt: $createdAt, senderName: $senderName, isOutgoing: $isOutgoing)';
}


}

/// @nodoc
abstract mixin class $MessageDTOCopyWith<$Res>  {
  factory $MessageDTOCopyWith(MessageDTO value, $Res Function(MessageDTO) _then) = _$MessageDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intToString) String id,@JsonKey(name: 'chat_id', fromJson: _intToString) String chatId,@JsonKey(name: 'sender_id', fromJson: _intToString) String senderId, String body,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'sender_name') String senderName, bool isOutgoing
});




}
/// @nodoc
class _$MessageDTOCopyWithImpl<$Res>
    implements $MessageDTOCopyWith<$Res> {
  _$MessageDTOCopyWithImpl(this._self, this._then);

  final MessageDTO _self;
  final $Res Function(MessageDTO) _then;

/// Create a copy of MessageDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chatId = null,Object? senderId = null,Object? body = null,Object? createdAt = null,Object? senderName = null,Object? isOutgoing = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,isOutgoing: null == isOutgoing ? _self.isOutgoing : isOutgoing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageDTO].
extension MessageDTOPatterns on MessageDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageDTO value)  $default,){
final _that = this;
switch (_that) {
case _MessageDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageDTO value)?  $default,){
final _that = this;
switch (_that) {
case _MessageDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'chat_id', fromJson: _intToString)  String chatId, @JsonKey(name: 'sender_id', fromJson: _intToString)  String senderId,  String body, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'sender_name')  String senderName,  bool isOutgoing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageDTO() when $default != null:
return $default(_that.id,_that.chatId,_that.senderId,_that.body,_that.createdAt,_that.senderName,_that.isOutgoing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'chat_id', fromJson: _intToString)  String chatId, @JsonKey(name: 'sender_id', fromJson: _intToString)  String senderId,  String body, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'sender_name')  String senderName,  bool isOutgoing)  $default,) {final _that = this;
switch (_that) {
case _MessageDTO():
return $default(_that.id,_that.chatId,_that.senderId,_that.body,_that.createdAt,_that.senderName,_that.isOutgoing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intToString)  String id, @JsonKey(name: 'chat_id', fromJson: _intToString)  String chatId, @JsonKey(name: 'sender_id', fromJson: _intToString)  String senderId,  String body, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'sender_name')  String senderName,  bool isOutgoing)?  $default,) {final _that = this;
switch (_that) {
case _MessageDTO() when $default != null:
return $default(_that.id,_that.chatId,_that.senderId,_that.body,_that.createdAt,_that.senderName,_that.isOutgoing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageDTO implements MessageDTO {
  const _MessageDTO({@JsonKey(fromJson: _intToString) required this.id, @JsonKey(name: 'chat_id', fromJson: _intToString) required this.chatId, @JsonKey(name: 'sender_id', fromJson: _intToString) required this.senderId, required this.body, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'sender_name') this.senderName = '', this.isOutgoing = false});
  factory _MessageDTO.fromJson(Map<String, dynamic> json) => _$MessageDTOFromJson(json);

@override@JsonKey(fromJson: _intToString) final  String id;
@override@JsonKey(name: 'chat_id', fromJson: _intToString) final  String chatId;
@override@JsonKey(name: 'sender_id', fromJson: _intToString) final  String senderId;
@override final  String body;
@override@JsonKey(name: 'created_at') final  String createdAt;
// Поля которые могут прийти из HTTP-истории (не из WS)
@override@JsonKey(name: 'sender_name') final  String senderName;
@override@JsonKey() final  bool isOutgoing;

/// Create a copy of MessageDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageDTOCopyWith<_MessageDTO> get copyWith => __$MessageDTOCopyWithImpl<_MessageDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.isOutgoing, isOutgoing) || other.isOutgoing == isOutgoing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,senderId,body,createdAt,senderName,isOutgoing);

@override
String toString() {
  return 'MessageDTO(id: $id, chatId: $chatId, senderId: $senderId, body: $body, createdAt: $createdAt, senderName: $senderName, isOutgoing: $isOutgoing)';
}


}

/// @nodoc
abstract mixin class _$MessageDTOCopyWith<$Res> implements $MessageDTOCopyWith<$Res> {
  factory _$MessageDTOCopyWith(_MessageDTO value, $Res Function(_MessageDTO) _then) = __$MessageDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intToString) String id,@JsonKey(name: 'chat_id', fromJson: _intToString) String chatId,@JsonKey(name: 'sender_id', fromJson: _intToString) String senderId, String body,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'sender_name') String senderName, bool isOutgoing
});




}
/// @nodoc
class __$MessageDTOCopyWithImpl<$Res>
    implements _$MessageDTOCopyWith<$Res> {
  __$MessageDTOCopyWithImpl(this._self, this._then);

  final _MessageDTO _self;
  final $Res Function(_MessageDTO) _then;

/// Create a copy of MessageDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chatId = null,Object? senderId = null,Object? body = null,Object? createdAt = null,Object? senderName = null,Object? isOutgoing = null,}) {
  return _then(_MessageDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,isOutgoing: null == isOutgoing ? _self.isOutgoing : isOutgoing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
