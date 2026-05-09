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

 String get id;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName;@JsonKey(name: 'father_name') String? get fatherName; DateTime? get birthdate; String? get sex; String? get phone; String get role; String? get avatarUrl;// Только для студента
 String? get institute;@JsonKey(name: 'group_id') String? get groupId;@JsonKey(name: 'group_name') String? get groupName; String? get stream; String? get subgroup;@JsonKey(name: 'record_book_number') String? get recordBookNumber;// Только для преподавателя
 String? get position; String? get degree; String? get office; String? get bio; List<String> get tags;
/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDTOCopyWith<UserDTO> get copyWith => _$UserDTOCopyWithImpl<UserDTO>(this as UserDTO, _$identity);

  /// Serializes this UserDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.institute, institute) || other.institute == institute)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.subgroup, subgroup) || other.subgroup == subgroup)&&(identical(other.recordBookNumber, recordBookNumber) || other.recordBookNumber == recordBookNumber)&&(identical(other.position, position) || other.position == position)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.office, office) || other.office == office)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,firstName,lastName,fatherName,birthdate,sex,phone,role,avatarUrl,institute,groupId,groupName,stream,subgroup,recordBookNumber,position,degree,office,bio,const DeepCollectionEquality().hash(tags)]);

@override
String toString() {
  return 'UserDTO(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, birthdate: $birthdate, sex: $sex, phone: $phone, role: $role, avatarUrl: $avatarUrl, institute: $institute, groupId: $groupId, groupName: $groupName, stream: $stream, subgroup: $subgroup, recordBookNumber: $recordBookNumber, position: $position, degree: $degree, office: $office, bio: $bio, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $UserDTOCopyWith<$Res>  {
  factory $UserDTOCopyWith(UserDTO value, $Res Function(UserDTO) _then) = _$UserDTOCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'father_name') String? fatherName, DateTime? birthdate, String? sex, String? phone, String role, String? avatarUrl, String? institute,@JsonKey(name: 'group_id') String? groupId,@JsonKey(name: 'group_name') String? groupName, String? stream, String? subgroup,@JsonKey(name: 'record_book_number') String? recordBookNumber, String? position, String? degree, String? office, String? bio, List<String> tags
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'father_name')  String? fatherName,  DateTime? birthdate,  String? sex,  String? phone,  String role,  String? avatarUrl,  String? institute, @JsonKey(name: 'group_id')  String? groupId, @JsonKey(name: 'group_name')  String? groupName,  String? stream,  String? subgroup, @JsonKey(name: 'record_book_number')  String? recordBookNumber,  String? position,  String? degree,  String? office,  String? bio,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'father_name')  String? fatherName,  DateTime? birthdate,  String? sex,  String? phone,  String role,  String? avatarUrl,  String? institute, @JsonKey(name: 'group_id')  String? groupId, @JsonKey(name: 'group_name')  String? groupName,  String? stream,  String? subgroup, @JsonKey(name: 'record_book_number')  String? recordBookNumber,  String? position,  String? degree,  String? office,  String? bio,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _UserDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'father_name')  String? fatherName,  DateTime? birthdate,  String? sex,  String? phone,  String role,  String? avatarUrl,  String? institute, @JsonKey(name: 'group_id')  String? groupId, @JsonKey(name: 'group_name')  String? groupName,  String? stream,  String? subgroup, @JsonKey(name: 'record_book_number')  String? recordBookNumber,  String? position,  String? degree,  String? office,  String? bio,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _UserDTO() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.birthdate,_that.sex,_that.phone,_that.role,_that.avatarUrl,_that.institute,_that.groupId,_that.groupName,_that.stream,_that.subgroup,_that.recordBookNumber,_that.position,_that.degree,_that.office,_that.bio,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDTO implements UserDTO {
  const _UserDTO({required this.id, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, @JsonKey(name: 'father_name') this.fatherName, this.birthdate, this.sex, this.phone, required this.role, this.avatarUrl, this.institute, @JsonKey(name: 'group_id') this.groupId, @JsonKey(name: 'group_name') this.groupName, this.stream, this.subgroup, @JsonKey(name: 'record_book_number') this.recordBookNumber, this.position, this.degree, this.office, this.bio, final  List<String> tags = const []}): _tags = tags;
  factory _UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

@override final  String id;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'father_name') final  String? fatherName;
@override final  DateTime? birthdate;
@override final  String? sex;
@override final  String? phone;
@override final  String role;
@override final  String? avatarUrl;
// Только для студента
@override final  String? institute;
@override@JsonKey(name: 'group_id') final  String? groupId;
@override@JsonKey(name: 'group_name') final  String? groupName;
@override final  String? stream;
@override final  String? subgroup;
@override@JsonKey(name: 'record_book_number') final  String? recordBookNumber;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.institute, institute) || other.institute == institute)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.subgroup, subgroup) || other.subgroup == subgroup)&&(identical(other.recordBookNumber, recordBookNumber) || other.recordBookNumber == recordBookNumber)&&(identical(other.position, position) || other.position == position)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.office, office) || other.office == office)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,firstName,lastName,fatherName,birthdate,sex,phone,role,avatarUrl,institute,groupId,groupName,stream,subgroup,recordBookNumber,position,degree,office,bio,const DeepCollectionEquality().hash(_tags)]);

@override
String toString() {
  return 'UserDTO(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, birthdate: $birthdate, sex: $sex, phone: $phone, role: $role, avatarUrl: $avatarUrl, institute: $institute, groupId: $groupId, groupName: $groupName, stream: $stream, subgroup: $subgroup, recordBookNumber: $recordBookNumber, position: $position, degree: $degree, office: $office, bio: $bio, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$UserDTOCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory _$UserDTOCopyWith(_UserDTO value, $Res Function(_UserDTO) _then) = __$UserDTOCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'father_name') String? fatherName, DateTime? birthdate, String? sex, String? phone, String role, String? avatarUrl, String? institute,@JsonKey(name: 'group_id') String? groupId,@JsonKey(name: 'group_name') String? groupName, String? stream, String? subgroup,@JsonKey(name: 'record_book_number') String? recordBookNumber, String? position, String? degree, String? office, String? bio, List<String> tags
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? fatherName = freezed,Object? birthdate = freezed,Object? sex = freezed,Object? phone = freezed,Object? role = null,Object? avatarUrl = freezed,Object? institute = freezed,Object? groupId = freezed,Object? groupName = freezed,Object? stream = freezed,Object? subgroup = freezed,Object? recordBookNumber = freezed,Object? position = freezed,Object? degree = freezed,Object? office = freezed,Object? bio = freezed,Object? tags = null,}) {
  return _then(_UserDTO(
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
