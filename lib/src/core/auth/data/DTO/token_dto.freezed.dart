// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenDTO {

@JsonKey(name: 'access_token') String get access;@JsonKey(name: 'refresh_token') String get refresh;@JsonKey(name: 'token_type') String get type;
/// Create a copy of TokenDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenDTOCopyWith<TokenDTO> get copyWith => _$TokenDTOCopyWithImpl<TokenDTO>(this as TokenDTO, _$identity);

  /// Serializes this TokenDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenDTO&&(identical(other.access, access) || other.access == access)&&(identical(other.refresh, refresh) || other.refresh == refresh)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,access,refresh,type);

@override
String toString() {
  return 'TokenDTO(access: $access, refresh: $refresh, type: $type)';
}


}

/// @nodoc
abstract mixin class $TokenDTOCopyWith<$Res>  {
  factory $TokenDTOCopyWith(TokenDTO value, $Res Function(TokenDTO) _then) = _$TokenDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String access,@JsonKey(name: 'refresh_token') String refresh,@JsonKey(name: 'token_type') String type
});




}
/// @nodoc
class _$TokenDTOCopyWithImpl<$Res>
    implements $TokenDTOCopyWith<$Res> {
  _$TokenDTOCopyWithImpl(this._self, this._then);

  final TokenDTO _self;
  final $Res Function(TokenDTO) _then;

/// Create a copy of TokenDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? access = null,Object? refresh = null,Object? type = null,}) {
  return _then(_self.copyWith(
access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenDTO].
extension TokenDTOPatterns on TokenDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenDTO value)  $default,){
final _that = this;
switch (_that) {
case _TokenDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenDTO value)?  $default,){
final _that = this;
switch (_that) {
case _TokenDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String access, @JsonKey(name: 'refresh_token')  String refresh, @JsonKey(name: 'token_type')  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenDTO() when $default != null:
return $default(_that.access,_that.refresh,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String access, @JsonKey(name: 'refresh_token')  String refresh, @JsonKey(name: 'token_type')  String type)  $default,) {final _that = this;
switch (_that) {
case _TokenDTO():
return $default(_that.access,_that.refresh,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String access, @JsonKey(name: 'refresh_token')  String refresh, @JsonKey(name: 'token_type')  String type)?  $default,) {final _that = this;
switch (_that) {
case _TokenDTO() when $default != null:
return $default(_that.access,_that.refresh,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenDTO implements TokenDTO {
  const _TokenDTO({@JsonKey(name: 'access_token') required this.access, @JsonKey(name: 'refresh_token') required this.refresh, @JsonKey(name: 'token_type') required this.type});
  factory _TokenDTO.fromJson(Map<String, dynamic> json) => _$TokenDTOFromJson(json);

@override@JsonKey(name: 'access_token') final  String access;
@override@JsonKey(name: 'refresh_token') final  String refresh;
@override@JsonKey(name: 'token_type') final  String type;

/// Create a copy of TokenDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenDTOCopyWith<_TokenDTO> get copyWith => __$TokenDTOCopyWithImpl<_TokenDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenDTO&&(identical(other.access, access) || other.access == access)&&(identical(other.refresh, refresh) || other.refresh == refresh)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,access,refresh,type);

@override
String toString() {
  return 'TokenDTO(access: $access, refresh: $refresh, type: $type)';
}


}

/// @nodoc
abstract mixin class _$TokenDTOCopyWith<$Res> implements $TokenDTOCopyWith<$Res> {
  factory _$TokenDTOCopyWith(_TokenDTO value, $Res Function(_TokenDTO) _then) = __$TokenDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String access,@JsonKey(name: 'refresh_token') String refresh,@JsonKey(name: 'token_type') String type
});




}
/// @nodoc
class __$TokenDTOCopyWithImpl<$Res>
    implements _$TokenDTOCopyWith<$Res> {
  __$TokenDTOCopyWithImpl(this._self, this._then);

  final _TokenDTO _self;
  final $Res Function(_TokenDTO) _then;

/// Create a copy of TokenDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? access = null,Object? refresh = null,Object? type = null,}) {
  return _then(_TokenDTO(
access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
