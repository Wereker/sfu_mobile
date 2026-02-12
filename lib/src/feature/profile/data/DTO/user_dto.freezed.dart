// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDTO {

 String get id; String get firstName; String get lastName; String? get fatherName; DateTime? get birthdate; String? get sex; String get phone; String get role;
/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDTOCopyWith<UserDTO> get copyWith => _$UserDTOCopyWithImpl<UserDTO>(this as UserDTO, _$identity);

  /// Serializes this UserDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fatherName,birthdate,sex,phone,role);

@override
String toString() {
  return 'UserDTO(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, birthdate: $birthdate, sex: $sex, phone: $phone, role: $role)';
}


}

/// @nodoc
abstract mixin class $UserDTOCopyWith<$Res>  {
  factory $UserDTOCopyWith(UserDTO value, $Res Function(UserDTO) _then) = _$UserDTOCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String lastName, String? fatherName, DateTime? birthdate, String? sex, String phone, String role
});




}
/// @nodoc
class _$UserDTOCopyWithImpl<$Res>
    implements $UserDTOCopyWith<$Res> {
  _$UserDTOCopyWithImpl(this._self, this._then);

  final UserDTO _self;
  final $Res Function(UserDTO) _then;

/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? fatherName = freezed,Object? birthdate = freezed,Object? sex = freezed,Object? phone = null,Object? role = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDTO].
extension UserDTOPatterns on UserDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDTO value)  $default,){
final _that = this;
switch (_that) {
case _UserDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDTO value)?  $default,){
final _that = this;
switch (_that) {
case _UserDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? fatherName,  DateTime? birthdate,  String? sex,  String phone,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDTO() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.birthdate,_that.sex,_that.phone,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? fatherName,  DateTime? birthdate,  String? sex,  String phone,  String role)  $default,) {final _that = this;
switch (_that) {
case _UserDTO():
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.birthdate,_that.sex,_that.phone,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstName,  String lastName,  String? fatherName,  DateTime? birthdate,  String? sex,  String phone,  String role)?  $default,) {final _that = this;
switch (_that) {
case _UserDTO() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.birthdate,_that.sex,_that.phone,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDTO implements UserDTO {
  const _UserDTO({required this.id, required this.firstName, required this.lastName, this.fatherName, this.birthdate, this.sex, required this.phone, required this.role});
  factory _UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

@override final  String id;
@override final  String firstName;
@override final  String lastName;
@override final  String? fatherName;
@override final  DateTime? birthdate;
@override final  String? sex;
@override final  String phone;
@override final  String role;

/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDTOCopyWith<_UserDTO> get copyWith => __$UserDTOCopyWithImpl<_UserDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fatherName,birthdate,sex,phone,role);

@override
String toString() {
  return 'UserDTO(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, birthdate: $birthdate, sex: $sex, phone: $phone, role: $role)';
}


}

/// @nodoc
abstract mixin class _$UserDTOCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory _$UserDTOCopyWith(_UserDTO value, $Res Function(_UserDTO) _then) = __$UserDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String lastName, String? fatherName, DateTime? birthdate, String? sex, String phone, String role
});




}
/// @nodoc
class __$UserDTOCopyWithImpl<$Res>
    implements _$UserDTOCopyWith<$Res> {
  __$UserDTOCopyWithImpl(this._self, this._then);

  final _UserDTO _self;
  final $Res Function(_UserDTO) _then;

/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? fatherName = freezed,Object? birthdate = freezed,Object? sex = freezed,Object? phone = null,Object? role = null,}) {
  return _then(_UserDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
