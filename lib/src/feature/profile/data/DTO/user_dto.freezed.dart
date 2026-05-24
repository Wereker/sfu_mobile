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

 int get id;@JsonKey(name: 'name') String get firstName;@JsonKey(name: 'surname') String get lastName;@JsonKey(name: 'patronymic') String? get fatherName; String get email; String get role;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'avatar') String? get avatarUrl;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDTOCopyWith<UserDTO> get copyWith => _$UserDTOCopyWithImpl<UserDTO>(this as UserDTO, _$identity);

  /// Serializes this UserDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fatherName,email,role,isActive,avatarUrl,createdAt,updatedAt);

@override
String toString() {
  return 'UserDTO(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, email: $email, role: $role, isActive: $isActive, avatarUrl: $avatarUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserDTOCopyWith<$Res>  {
  factory $UserDTOCopyWith(UserDTO value, $Res Function(UserDTO) _then) = _$UserDTOCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'name') String firstName,@JsonKey(name: 'surname') String lastName,@JsonKey(name: 'patronymic') String? fatherName, String email, String role,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'avatar') String? avatarUrl,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? fatherName = freezed,Object? email = null,Object? role = null,Object? isActive = null,Object? avatarUrl = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'name')  String firstName, @JsonKey(name: 'surname')  String lastName, @JsonKey(name: 'patronymic')  String? fatherName,  String email,  String role, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'avatar')  String? avatarUrl, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDTO() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.email,_that.role,_that.isActive,_that.avatarUrl,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'name')  String firstName, @JsonKey(name: 'surname')  String lastName, @JsonKey(name: 'patronymic')  String? fatherName,  String email,  String role, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'avatar')  String? avatarUrl, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserDTO():
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.email,_that.role,_that.isActive,_that.avatarUrl,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'name')  String firstName, @JsonKey(name: 'surname')  String lastName, @JsonKey(name: 'patronymic')  String? fatherName,  String email,  String role, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'avatar')  String? avatarUrl, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserDTO() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.email,_that.role,_that.isActive,_that.avatarUrl,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDTO implements UserDTO {
  const _UserDTO({required this.id, @JsonKey(name: 'name') required this.firstName, @JsonKey(name: 'surname') required this.lastName, @JsonKey(name: 'patronymic') this.fatherName, required this.email, required this.role, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'avatar') this.avatarUrl, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

@override final  int id;
@override@JsonKey(name: 'name') final  String firstName;
@override@JsonKey(name: 'surname') final  String lastName;
@override@JsonKey(name: 'patronymic') final  String? fatherName;
@override final  String email;
@override final  String role;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'avatar') final  String? avatarUrl;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fatherName,email,role,isActive,avatarUrl,createdAt,updatedAt);

@override
String toString() {
  return 'UserDTO(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, email: $email, role: $role, isActive: $isActive, avatarUrl: $avatarUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserDTOCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory _$UserDTOCopyWith(_UserDTO value, $Res Function(_UserDTO) _then) = __$UserDTOCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'name') String firstName,@JsonKey(name: 'surname') String lastName,@JsonKey(name: 'patronymic') String? fatherName, String email, String role,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'avatar') String? avatarUrl,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? fatherName = freezed,Object? email = null,Object? role = null,Object? isActive = null,Object? avatarUrl = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
