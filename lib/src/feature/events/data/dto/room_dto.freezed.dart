// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomDTO {

@JsonKey(fromJson: _intToString) String get id; String get number; String get address; int get capacity;
/// Create a copy of RoomDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomDTOCopyWith<RoomDTO> get copyWith => _$RoomDTOCopyWithImpl<RoomDTO>(this as RoomDTO, _$identity);

  /// Serializes this RoomDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.address, address) || other.address == address)&&(identical(other.capacity, capacity) || other.capacity == capacity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,number,address,capacity);

@override
String toString() {
  return 'RoomDTO(id: $id, number: $number, address: $address, capacity: $capacity)';
}


}

/// @nodoc
abstract mixin class $RoomDTOCopyWith<$Res>  {
  factory $RoomDTOCopyWith(RoomDTO value, $Res Function(RoomDTO) _then) = _$RoomDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intToString) String id, String number, String address, int capacity
});




}
/// @nodoc
class _$RoomDTOCopyWithImpl<$Res>
    implements $RoomDTOCopyWith<$Res> {
  _$RoomDTOCopyWithImpl(this._self, this._then);

  final RoomDTO _self;
  final $Res Function(RoomDTO) _then;

/// Create a copy of RoomDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? number = null,Object? address = null,Object? capacity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomDTO].
extension RoomDTOPatterns on RoomDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomDTO value)  $default,){
final _that = this;
switch (_that) {
case _RoomDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomDTO value)?  $default,){
final _that = this;
switch (_that) {
case _RoomDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id,  String number,  String address,  int capacity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomDTO() when $default != null:
return $default(_that.id,_that.number,_that.address,_that.capacity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id,  String number,  String address,  int capacity)  $default,) {final _that = this;
switch (_that) {
case _RoomDTO():
return $default(_that.id,_that.number,_that.address,_that.capacity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intToString)  String id,  String number,  String address,  int capacity)?  $default,) {final _that = this;
switch (_that) {
case _RoomDTO() when $default != null:
return $default(_that.id,_that.number,_that.address,_that.capacity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomDTO implements RoomDTO {
  const _RoomDTO({@JsonKey(fromJson: _intToString) required this.id, required this.number, required this.address, required this.capacity});
  factory _RoomDTO.fromJson(Map<String, dynamic> json) => _$RoomDTOFromJson(json);

@override@JsonKey(fromJson: _intToString) final  String id;
@override final  String number;
@override final  String address;
@override final  int capacity;

/// Create a copy of RoomDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomDTOCopyWith<_RoomDTO> get copyWith => __$RoomDTOCopyWithImpl<_RoomDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.address, address) || other.address == address)&&(identical(other.capacity, capacity) || other.capacity == capacity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,number,address,capacity);

@override
String toString() {
  return 'RoomDTO(id: $id, number: $number, address: $address, capacity: $capacity)';
}


}

/// @nodoc
abstract mixin class _$RoomDTOCopyWith<$Res> implements $RoomDTOCopyWith<$Res> {
  factory _$RoomDTOCopyWith(_RoomDTO value, $Res Function(_RoomDTO) _then) = __$RoomDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intToString) String id, String number, String address, int capacity
});




}
/// @nodoc
class __$RoomDTOCopyWithImpl<$Res>
    implements _$RoomDTOCopyWith<$Res> {
  __$RoomDTOCopyWithImpl(this._self, this._then);

  final _RoomDTO _self;
  final $Res Function(_RoomDTO) _then;

/// Create a copy of RoomDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? number = null,Object? address = null,Object? capacity = null,}) {
  return _then(_RoomDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
