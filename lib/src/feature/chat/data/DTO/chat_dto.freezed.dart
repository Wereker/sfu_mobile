// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatDTO {

@JsonKey(fromJson: _intToString) String get id; String get type;@JsonKey(name: 'group_id') String? get groupId; List<ChatMemberDTO> get members;
/// Create a copy of ChatDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatDTOCopyWith<ChatDTO> get copyWith => _$ChatDTOCopyWithImpl<ChatDTO>(this as ChatDTO, _$identity);

  /// Serializes this ChatDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other.members, members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,groupId,const DeepCollectionEquality().hash(members));

@override
String toString() {
  return 'ChatDTO(id: $id, type: $type, groupId: $groupId, members: $members)';
}


}

/// @nodoc
abstract mixin class $ChatDTOCopyWith<$Res>  {
  factory $ChatDTOCopyWith(ChatDTO value, $Res Function(ChatDTO) _then) = _$ChatDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intToString) String id, String type,@JsonKey(name: 'group_id') String? groupId, List<ChatMemberDTO> members
});




}
/// @nodoc
class _$ChatDTOCopyWithImpl<$Res>
    implements $ChatDTOCopyWith<$Res> {
  _$ChatDTOCopyWithImpl(this._self, this._then);

  final ChatDTO _self;
  final $Res Function(ChatDTO) _then;

/// Create a copy of ChatDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? groupId = freezed,Object? members = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<ChatMemberDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatDTO].
extension ChatDTOPatterns on ChatDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatDTO value)  $default,){
final _that = this;
switch (_that) {
case _ChatDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ChatDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id,  String type, @JsonKey(name: 'group_id')  String? groupId,  List<ChatMemberDTO> members)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatDTO() when $default != null:
return $default(_that.id,_that.type,_that.groupId,_that.members);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id,  String type, @JsonKey(name: 'group_id')  String? groupId,  List<ChatMemberDTO> members)  $default,) {final _that = this;
switch (_that) {
case _ChatDTO():
return $default(_that.id,_that.type,_that.groupId,_that.members);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intToString)  String id,  String type, @JsonKey(name: 'group_id')  String? groupId,  List<ChatMemberDTO> members)?  $default,) {final _that = this;
switch (_that) {
case _ChatDTO() when $default != null:
return $default(_that.id,_that.type,_that.groupId,_that.members);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatDTO implements ChatDTO {
  const _ChatDTO({@JsonKey(fromJson: _intToString) required this.id, required this.type, @JsonKey(name: 'group_id') this.groupId, final  List<ChatMemberDTO> members = const []}): _members = members;
  factory _ChatDTO.fromJson(Map<String, dynamic> json) => _$ChatDTOFromJson(json);

@override@JsonKey(fromJson: _intToString) final  String id;
@override final  String type;
@override@JsonKey(name: 'group_id') final  String? groupId;
 final  List<ChatMemberDTO> _members;
@override@JsonKey() List<ChatMemberDTO> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of ChatDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatDTOCopyWith<_ChatDTO> get copyWith => __$ChatDTOCopyWithImpl<_ChatDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other._members, _members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,groupId,const DeepCollectionEquality().hash(_members));

@override
String toString() {
  return 'ChatDTO(id: $id, type: $type, groupId: $groupId, members: $members)';
}


}

/// @nodoc
abstract mixin class _$ChatDTOCopyWith<$Res> implements $ChatDTOCopyWith<$Res> {
  factory _$ChatDTOCopyWith(_ChatDTO value, $Res Function(_ChatDTO) _then) = __$ChatDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intToString) String id, String type,@JsonKey(name: 'group_id') String? groupId, List<ChatMemberDTO> members
});




}
/// @nodoc
class __$ChatDTOCopyWithImpl<$Res>
    implements _$ChatDTOCopyWith<$Res> {
  __$ChatDTOCopyWithImpl(this._self, this._then);

  final _ChatDTO _self;
  final $Res Function(_ChatDTO) _then;

/// Create a copy of ChatDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? groupId = freezed,Object? members = null,}) {
  return _then(_ChatDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<ChatMemberDTO>,
  ));
}


}


/// @nodoc
mixin _$ChatMemberDTO {

@JsonKey(name: 'user_id', fromJson: _intToString) String get userId;
/// Create a copy of ChatMemberDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMemberDTOCopyWith<ChatMemberDTO> get copyWith => _$ChatMemberDTOCopyWithImpl<ChatMemberDTO>(this as ChatMemberDTO, _$identity);

  /// Serializes this ChatMemberDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMemberDTO&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ChatMemberDTO(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ChatMemberDTOCopyWith<$Res>  {
  factory $ChatMemberDTOCopyWith(ChatMemberDTO value, $Res Function(ChatMemberDTO) _then) = _$ChatMemberDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id', fromJson: _intToString) String userId
});




}
/// @nodoc
class _$ChatMemberDTOCopyWithImpl<$Res>
    implements $ChatMemberDTOCopyWith<$Res> {
  _$ChatMemberDTOCopyWithImpl(this._self, this._then);

  final ChatMemberDTO _self;
  final $Res Function(ChatMemberDTO) _then;

/// Create a copy of ChatMemberDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMemberDTO].
extension ChatMemberDTOPatterns on ChatMemberDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMemberDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMemberDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMemberDTO value)  $default,){
final _that = this;
switch (_that) {
case _ChatMemberDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMemberDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMemberDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id', fromJson: _intToString)  String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMemberDTO() when $default != null:
return $default(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id', fromJson: _intToString)  String userId)  $default,) {final _that = this;
switch (_that) {
case _ChatMemberDTO():
return $default(_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id', fromJson: _intToString)  String userId)?  $default,) {final _that = this;
switch (_that) {
case _ChatMemberDTO() when $default != null:
return $default(_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMemberDTO implements ChatMemberDTO {
  const _ChatMemberDTO({@JsonKey(name: 'user_id', fromJson: _intToString) required this.userId});
  factory _ChatMemberDTO.fromJson(Map<String, dynamic> json) => _$ChatMemberDTOFromJson(json);

@override@JsonKey(name: 'user_id', fromJson: _intToString) final  String userId;

/// Create a copy of ChatMemberDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMemberDTOCopyWith<_ChatMemberDTO> get copyWith => __$ChatMemberDTOCopyWithImpl<_ChatMemberDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMemberDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMemberDTO&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ChatMemberDTO(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$ChatMemberDTOCopyWith<$Res> implements $ChatMemberDTOCopyWith<$Res> {
  factory _$ChatMemberDTOCopyWith(_ChatMemberDTO value, $Res Function(_ChatMemberDTO) _then) = __$ChatMemberDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id', fromJson: _intToString) String userId
});




}
/// @nodoc
class __$ChatMemberDTOCopyWithImpl<$Res>
    implements _$ChatMemberDTOCopyWith<$Res> {
  __$ChatMemberDTOCopyWithImpl(this._self, this._then);

  final _ChatMemberDTO _self;
  final $Res Function(_ChatMemberDTO) _then;

/// Create a copy of ChatMemberDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_ChatMemberDTO(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
