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

 String get id; String get firstName; String get lastName; String? get fatherName; DateTime? get birthdate; String? get sex; String? get phone; String get role;// 'student' | 'teacher'
 String? get avatarUrl;// Только для студента
 String? get institute; String? get groupId; String? get groupName; String? get stream; String? get subgroup; String? get recordBookNumber;// Только для преподавателя
 String? get position; String? get degree; String? get office; String? get bio; List<String> get tags;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.institute, institute) || other.institute == institute)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.subgroup, subgroup) || other.subgroup == subgroup)&&(identical(other.recordBookNumber, recordBookNumber) || other.recordBookNumber == recordBookNumber)&&(identical(other.position, position) || other.position == position)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.office, office) || other.office == office)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,firstName,lastName,fatherName,birthdate,sex,phone,role,avatarUrl,institute,groupId,groupName,stream,subgroup,recordBookNumber,position,degree,office,bio,const DeepCollectionEquality().hash(tags)]);

@override
String toString() {
  return 'User(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, birthdate: $birthdate, sex: $sex, phone: $phone, role: $role, avatarUrl: $avatarUrl, institute: $institute, groupId: $groupId, groupName: $groupName, stream: $stream, subgroup: $subgroup, recordBookNumber: $recordBookNumber, position: $position, degree: $degree, office: $office, bio: $bio, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String lastName, String? fatherName, DateTime? birthdate, String? sex, String? phone, String role, String? avatarUrl, String? institute, String? groupId, String? groupName, String? stream, String? subgroup, String? recordBookNumber, String? position, String? degree, String? office, String? bio, List<String> tags
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? fatherName = freezed,Object? birthdate = freezed,Object? sex = freezed,Object? phone = freezed,Object? role = null,Object? avatarUrl = freezed,Object? institute = freezed,Object? groupId = freezed,Object? groupName = freezed,Object? stream = freezed,Object? subgroup = freezed,Object? recordBookNumber = freezed,Object? position = freezed,Object? degree = freezed,Object? office = freezed,Object? bio = freezed,Object? tags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,institute: freezed == institute ? _self.institute : institute // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,groupName: freezed == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as String?,subgroup: freezed == subgroup ? _self.subgroup : subgroup // ignore: cast_nullable_to_non_nullable
as String?,recordBookNumber: freezed == recordBookNumber ? _self.recordBookNumber : recordBookNumber // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,office: freezed == office ? _self.office : office // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? fatherName,  DateTime? birthdate,  String? sex,  String? phone,  String role,  String? avatarUrl,  String? institute,  String? groupId,  String? groupName,  String? stream,  String? subgroup,  String? recordBookNumber,  String? position,  String? degree,  String? office,  String? bio,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.birthdate,_that.sex,_that.phone,_that.role,_that.avatarUrl,_that.institute,_that.groupId,_that.groupName,_that.stream,_that.subgroup,_that.recordBookNumber,_that.position,_that.degree,_that.office,_that.bio,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? fatherName,  DateTime? birthdate,  String? sex,  String? phone,  String role,  String? avatarUrl,  String? institute,  String? groupId,  String? groupName,  String? stream,  String? subgroup,  String? recordBookNumber,  String? position,  String? degree,  String? office,  String? bio,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.birthdate,_that.sex,_that.phone,_that.role,_that.avatarUrl,_that.institute,_that.groupId,_that.groupName,_that.stream,_that.subgroup,_that.recordBookNumber,_that.position,_that.degree,_that.office,_that.bio,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstName,  String lastName,  String? fatherName,  DateTime? birthdate,  String? sex,  String? phone,  String role,  String? avatarUrl,  String? institute,  String? groupId,  String? groupName,  String? stream,  String? subgroup,  String? recordBookNumber,  String? position,  String? degree,  String? office,  String? bio,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.birthdate,_that.sex,_that.phone,_that.role,_that.avatarUrl,_that.institute,_that.groupId,_that.groupName,_that.stream,_that.subgroup,_that.recordBookNumber,_that.position,_that.degree,_that.office,_that.bio,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.firstName, required this.lastName, this.fatherName, this.birthdate, this.sex, this.phone, required this.role, this.avatarUrl, this.institute, this.groupId, this.groupName, this.stream, this.subgroup, this.recordBookNumber, this.position, this.degree, this.office, this.bio, final  List<String> tags = const []}): _tags = tags;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String firstName;
@override final  String lastName;
@override final  String? fatherName;
@override final  DateTime? birthdate;
@override final  String? sex;
@override final  String? phone;
@override final  String role;
// 'student' | 'teacher'
@override final  String? avatarUrl;
// Только для студента
@override final  String? institute;
@override final  String? groupId;
@override final  String? groupName;
@override final  String? stream;
@override final  String? subgroup;
@override final  String? recordBookNumber;
// Только для преподавателя
@override final  String? position;
@override final  String? degree;
@override final  String? office;
@override final  String? bio;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.institute, institute) || other.institute == institute)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.subgroup, subgroup) || other.subgroup == subgroup)&&(identical(other.recordBookNumber, recordBookNumber) || other.recordBookNumber == recordBookNumber)&&(identical(other.position, position) || other.position == position)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.office, office) || other.office == office)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,firstName,lastName,fatherName,birthdate,sex,phone,role,avatarUrl,institute,groupId,groupName,stream,subgroup,recordBookNumber,position,degree,office,bio,const DeepCollectionEquality().hash(_tags)]);

@override
String toString() {
  return 'User(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, birthdate: $birthdate, sex: $sex, phone: $phone, role: $role, avatarUrl: $avatarUrl, institute: $institute, groupId: $groupId, groupName: $groupName, stream: $stream, subgroup: $subgroup, recordBookNumber: $recordBookNumber, position: $position, degree: $degree, office: $office, bio: $bio, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String lastName, String? fatherName, DateTime? birthdate, String? sex, String? phone, String role, String? avatarUrl, String? institute, String? groupId, String? groupName, String? stream, String? subgroup, String? recordBookNumber, String? position, String? degree, String? office, String? bio, List<String> tags
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? fatherName = freezed,Object? birthdate = freezed,Object? sex = freezed,Object? phone = freezed,Object? role = null,Object? avatarUrl = freezed,Object? institute = freezed,Object? groupId = freezed,Object? groupName = freezed,Object? stream = freezed,Object? subgroup = freezed,Object? recordBookNumber = freezed,Object? position = freezed,Object? degree = freezed,Object? office = freezed,Object? bio = freezed,Object? tags = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,institute: freezed == institute ? _self.institute : institute // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,groupName: freezed == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as String?,subgroup: freezed == subgroup ? _self.subgroup : subgroup // ignore: cast_nullable_to_non_nullable
as String?,recordBookNumber: freezed == recordBookNumber ? _self.recordBookNumber : recordBookNumber // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,office: freezed == office ? _self.office : office // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
