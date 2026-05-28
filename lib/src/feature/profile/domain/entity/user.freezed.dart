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

// — с сервера —
 int get id; String get firstName; String get lastName; String? get fatherName; String get email; UserRole get role; bool get isActive; String? get avatarUrl; DateTime get createdAt; DateTime get updatedAt;// — контакты (UI + будущий API) —
 String? get phone; String? get telegram;// — общие UI-поля —
 DateTime? get birthdate; String? get sex;// — студент —
 String? get institute; String? get groupId; String? get groupName; String? get stream; String? get subgroup; String? get recordBookNumber;// — преподаватель —
 String? get position; String? get degree; String? get department; String? get bio; List<String> get tags;// — настройки уведомлений —
 bool get notifyChats; bool get notifyNews; bool get notifyEvents;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.telegram, telegram) || other.telegram == telegram)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.institute, institute) || other.institute == institute)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.subgroup, subgroup) || other.subgroup == subgroup)&&(identical(other.recordBookNumber, recordBookNumber) || other.recordBookNumber == recordBookNumber)&&(identical(other.position, position) || other.position == position)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.department, department) || other.department == department)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.notifyChats, notifyChats) || other.notifyChats == notifyChats)&&(identical(other.notifyNews, notifyNews) || other.notifyNews == notifyNews)&&(identical(other.notifyEvents, notifyEvents) || other.notifyEvents == notifyEvents));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,firstName,lastName,fatherName,email,role,isActive,avatarUrl,createdAt,updatedAt,phone,telegram,birthdate,sex,institute,groupId,groupName,stream,subgroup,recordBookNumber,position,degree,department,bio,const DeepCollectionEquality().hash(tags),notifyChats,notifyNews,notifyEvents]);

@override
String toString() {
  return 'User(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, email: $email, role: $role, isActive: $isActive, avatarUrl: $avatarUrl, createdAt: $createdAt, updatedAt: $updatedAt, phone: $phone, telegram: $telegram, birthdate: $birthdate, sex: $sex, institute: $institute, groupId: $groupId, groupName: $groupName, stream: $stream, subgroup: $subgroup, recordBookNumber: $recordBookNumber, position: $position, degree: $degree, department: $department, bio: $bio, tags: $tags, notifyChats: $notifyChats, notifyNews: $notifyNews, notifyEvents: $notifyEvents)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int id, String firstName, String lastName, String? fatherName, String email, UserRole role, bool isActive, String? avatarUrl, DateTime createdAt, DateTime updatedAt, String? phone, String? telegram, DateTime? birthdate, String? sex, String? institute, String? groupId, String? groupName, String? stream, String? subgroup, String? recordBookNumber, String? position, String? degree, String? department, String? bio, List<String> tags, bool notifyChats, bool notifyNews, bool notifyEvents
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? fatherName = freezed,Object? email = null,Object? role = null,Object? isActive = null,Object? avatarUrl = freezed,Object? createdAt = null,Object? updatedAt = null,Object? phone = freezed,Object? telegram = freezed,Object? birthdate = freezed,Object? sex = freezed,Object? institute = freezed,Object? groupId = freezed,Object? groupName = freezed,Object? stream = freezed,Object? subgroup = freezed,Object? recordBookNumber = freezed,Object? position = freezed,Object? degree = freezed,Object? department = freezed,Object? bio = freezed,Object? tags = null,Object? notifyChats = null,Object? notifyNews = null,Object? notifyEvents = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String?,institute: freezed == institute ? _self.institute : institute // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,groupName: freezed == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as String?,subgroup: freezed == subgroup ? _self.subgroup : subgroup // ignore: cast_nullable_to_non_nullable
as String?,recordBookNumber: freezed == recordBookNumber ? _self.recordBookNumber : recordBookNumber // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,notifyChats: null == notifyChats ? _self.notifyChats : notifyChats // ignore: cast_nullable_to_non_nullable
as bool,notifyNews: null == notifyNews ? _self.notifyNews : notifyNews // ignore: cast_nullable_to_non_nullable
as bool,notifyEvents: null == notifyEvents ? _self.notifyEvents : notifyEvents // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName,  String? fatherName,  String email,  UserRole role,  bool isActive,  String? avatarUrl,  DateTime createdAt,  DateTime updatedAt,  String? phone,  String? telegram,  DateTime? birthdate,  String? sex,  String? institute,  String? groupId,  String? groupName,  String? stream,  String? subgroup,  String? recordBookNumber,  String? position,  String? degree,  String? department,  String? bio,  List<String> tags,  bool notifyChats,  bool notifyNews,  bool notifyEvents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.email,_that.role,_that.isActive,_that.avatarUrl,_that.createdAt,_that.updatedAt,_that.phone,_that.telegram,_that.birthdate,_that.sex,_that.institute,_that.groupId,_that.groupName,_that.stream,_that.subgroup,_that.recordBookNumber,_that.position,_that.degree,_that.department,_that.bio,_that.tags,_that.notifyChats,_that.notifyNews,_that.notifyEvents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName,  String? fatherName,  String email,  UserRole role,  bool isActive,  String? avatarUrl,  DateTime createdAt,  DateTime updatedAt,  String? phone,  String? telegram,  DateTime? birthdate,  String? sex,  String? institute,  String? groupId,  String? groupName,  String? stream,  String? subgroup,  String? recordBookNumber,  String? position,  String? degree,  String? department,  String? bio,  List<String> tags,  bool notifyChats,  bool notifyNews,  bool notifyEvents)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.email,_that.role,_that.isActive,_that.avatarUrl,_that.createdAt,_that.updatedAt,_that.phone,_that.telegram,_that.birthdate,_that.sex,_that.institute,_that.groupId,_that.groupName,_that.stream,_that.subgroup,_that.recordBookNumber,_that.position,_that.degree,_that.department,_that.bio,_that.tags,_that.notifyChats,_that.notifyNews,_that.notifyEvents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String firstName,  String lastName,  String? fatherName,  String email,  UserRole role,  bool isActive,  String? avatarUrl,  DateTime createdAt,  DateTime updatedAt,  String? phone,  String? telegram,  DateTime? birthdate,  String? sex,  String? institute,  String? groupId,  String? groupName,  String? stream,  String? subgroup,  String? recordBookNumber,  String? position,  String? degree,  String? department,  String? bio,  List<String> tags,  bool notifyChats,  bool notifyNews,  bool notifyEvents)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fatherName,_that.email,_that.role,_that.isActive,_that.avatarUrl,_that.createdAt,_that.updatedAt,_that.phone,_that.telegram,_that.birthdate,_that.sex,_that.institute,_that.groupId,_that.groupName,_that.stream,_that.subgroup,_that.recordBookNumber,_that.position,_that.degree,_that.department,_that.bio,_that.tags,_that.notifyChats,_that.notifyNews,_that.notifyEvents);case _:
  return null;

}
}

}

/// @nodoc


class _User extends User {
  const _User({required this.id, required this.firstName, required this.lastName, this.fatherName, required this.email, required this.role, required this.isActive, this.avatarUrl, required this.createdAt, required this.updatedAt, this.phone, this.telegram, this.birthdate, this.sex, this.institute, this.groupId, this.groupName, this.stream, this.subgroup, this.recordBookNumber, this.position, this.degree, this.department, this.bio, final  List<String> tags = const [], this.notifyChats = true, this.notifyNews = true, this.notifyEvents = false}): _tags = tags,super._();
  

// — с сервера —
@override final  int id;
@override final  String firstName;
@override final  String lastName;
@override final  String? fatherName;
@override final  String email;
@override final  UserRole role;
@override final  bool isActive;
@override final  String? avatarUrl;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
// — контакты (UI + будущий API) —
@override final  String? phone;
@override final  String? telegram;
// — общие UI-поля —
@override final  DateTime? birthdate;
@override final  String? sex;
// — студент —
@override final  String? institute;
@override final  String? groupId;
@override final  String? groupName;
@override final  String? stream;
@override final  String? subgroup;
@override final  String? recordBookNumber;
// — преподаватель —
@override final  String? position;
@override final  String? degree;
@override final  String? department;
@override final  String? bio;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

// — настройки уведомлений —
@override@JsonKey() final  bool notifyChats;
@override@JsonKey() final  bool notifyNews;
@override@JsonKey() final  bool notifyEvents;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.telegram, telegram) || other.telegram == telegram)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.institute, institute) || other.institute == institute)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.subgroup, subgroup) || other.subgroup == subgroup)&&(identical(other.recordBookNumber, recordBookNumber) || other.recordBookNumber == recordBookNumber)&&(identical(other.position, position) || other.position == position)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.department, department) || other.department == department)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.notifyChats, notifyChats) || other.notifyChats == notifyChats)&&(identical(other.notifyNews, notifyNews) || other.notifyNews == notifyNews)&&(identical(other.notifyEvents, notifyEvents) || other.notifyEvents == notifyEvents));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,firstName,lastName,fatherName,email,role,isActive,avatarUrl,createdAt,updatedAt,phone,telegram,birthdate,sex,institute,groupId,groupName,stream,subgroup,recordBookNumber,position,degree,department,bio,const DeepCollectionEquality().hash(_tags),notifyChats,notifyNews,notifyEvents]);

@override
String toString() {
  return 'User(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, email: $email, role: $role, isActive: $isActive, avatarUrl: $avatarUrl, createdAt: $createdAt, updatedAt: $updatedAt, phone: $phone, telegram: $telegram, birthdate: $birthdate, sex: $sex, institute: $institute, groupId: $groupId, groupName: $groupName, stream: $stream, subgroup: $subgroup, recordBookNumber: $recordBookNumber, position: $position, degree: $degree, department: $department, bio: $bio, tags: $tags, notifyChats: $notifyChats, notifyNews: $notifyNews, notifyEvents: $notifyEvents)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int id, String firstName, String lastName, String? fatherName, String email, UserRole role, bool isActive, String? avatarUrl, DateTime createdAt, DateTime updatedAt, String? phone, String? telegram, DateTime? birthdate, String? sex, String? institute, String? groupId, String? groupName, String? stream, String? subgroup, String? recordBookNumber, String? position, String? degree, String? department, String? bio, List<String> tags, bool notifyChats, bool notifyNews, bool notifyEvents
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? fatherName = freezed,Object? email = null,Object? role = null,Object? isActive = null,Object? avatarUrl = freezed,Object? createdAt = null,Object? updatedAt = null,Object? phone = freezed,Object? telegram = freezed,Object? birthdate = freezed,Object? sex = freezed,Object? institute = freezed,Object? groupId = freezed,Object? groupName = freezed,Object? stream = freezed,Object? subgroup = freezed,Object? recordBookNumber = freezed,Object? position = freezed,Object? degree = freezed,Object? department = freezed,Object? bio = freezed,Object? tags = null,Object? notifyChats = null,Object? notifyNews = null,Object? notifyEvents = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String?,institute: freezed == institute ? _self.institute : institute // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,groupName: freezed == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as String?,subgroup: freezed == subgroup ? _self.subgroup : subgroup // ignore: cast_nullable_to_non_nullable
as String?,recordBookNumber: freezed == recordBookNumber ? _self.recordBookNumber : recordBookNumber // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,notifyChats: null == notifyChats ? _self.notifyChats : notifyChats // ignore: cast_nullable_to_non_nullable
as bool,notifyNews: null == notifyNews ? _self.notifyNews : notifyNews // ignore: cast_nullable_to_non_nullable
as bool,notifyEvents: null == notifyEvents ? _self.notifyEvents : notifyEvents // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
