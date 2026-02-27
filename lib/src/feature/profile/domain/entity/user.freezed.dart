// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get id; String get firstName; String get lastName; String? get fatherName; DateTime? get birthdate; String? get sex; String get phone; String get role; String get institute; String get group; String get subgroup; String get recordBookNumber;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.institute, institute) || other.institute == institute)&&(identical(other.group, group) || other.group == group)&&(identical(other.subgroup, subgroup) || other.subgroup == subgroup)&&(identical(other.recordBookNumber, recordBookNumber) || other.recordBookNumber == recordBookNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fatherName,birthdate,sex,phone,role,institute,group,subgroup,recordBookNumber);

@override
String toString() {
  return 'User(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, birthdate: $birthdate, sex: $sex, phone: $phone, role: $role, institute: $institute, group: $group, subgroup: $subgroup, recordBookNumber: $recordBookNumber)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String lastName, String? fatherName, DateTime? birthdate, String? sex, String phone, String role, String institute, String group, String subgroup, String recordBookNumber
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? fatherName = freezed,Object? birthdate = freezed,Object? sex = freezed,Object? phone = null,Object? role = null,Object? institute = null,Object? group = null,Object? subgroup = null,Object? recordBookNumber = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,institute: null == institute ? _self.institute : institute // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,subgroup: null == subgroup ? _self.subgroup : subgroup // ignore: cast_nullable_to_non_nullable
as String,recordBookNumber: null == recordBookNumber ? _self.recordBookNumber : recordBookNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? fatherName,  DateTime? birthdate,  String? sex,  String phone,  String role,  String institute,  String group,  String subgroup,  String recordBookNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.birthdate,_that.sex,_that.phone,_that.role,_that.institute,_that.group,_that.subgroup,_that.recordBookNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? fatherName,  DateTime? birthdate,  String? sex,  String phone,  String role,  String institute,  String group,  String subgroup,  String recordBookNumber)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.birthdate,_that.sex,_that.phone,_that.role,_that.institute,_that.group,_that.subgroup,_that.recordBookNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstName,  String lastName,  String? fatherName,  DateTime? birthdate,  String? sex,  String phone,  String role,  String institute,  String group,  String subgroup,  String recordBookNumber)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.birthdate,_that.sex,_that.phone,_that.role,_that.institute,_that.group,_that.subgroup,_that.recordBookNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.firstName, required this.lastName, this.fatherName, this.birthdate, this.sex, required this.phone, required this.role, required this.institute, required this.group, required this.subgroup, required this.recordBookNumber});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String firstName;
@override final  String lastName;
@override final  String? fatherName;
@override final  DateTime? birthdate;
@override final  String? sex;
@override final  String phone;
@override final  String role;
@override final  String institute;
@override final  String group;
@override final  String subgroup;
@override final  String recordBookNumber;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.institute, institute) || other.institute == institute)&&(identical(other.group, group) || other.group == group)&&(identical(other.subgroup, subgroup) || other.subgroup == subgroup)&&(identical(other.recordBookNumber, recordBookNumber) || other.recordBookNumber == recordBookNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fatherName,birthdate,sex,phone,role,institute,group,subgroup,recordBookNumber);

@override
String toString() {
  return 'User(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, birthdate: $birthdate, sex: $sex, phone: $phone, role: $role, institute: $institute, group: $group, subgroup: $subgroup, recordBookNumber: $recordBookNumber)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String lastName, String? fatherName, DateTime? birthdate, String? sex, String phone, String role, String institute, String group, String subgroup, String recordBookNumber
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? fatherName = freezed,Object? birthdate = freezed,Object? sex = freezed,Object? phone = null,Object? role = null,Object? institute = null,Object? group = null,Object? subgroup = null,Object? recordBookNumber = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,institute: null == institute ? _self.institute : institute // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,subgroup: null == subgroup ? _self.subgroup : subgroup // ignore: cast_nullable_to_non_nullable
as String,recordBookNumber: null == recordBookNumber ? _self.recordBookNumber : recordBookNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
