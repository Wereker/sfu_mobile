// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'managed_student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManagedStudent {

 String get id; String get name; String get groupId; String get groupName; String get stream; bool get isHeadman; String? get phone; String? get telegram; String? get email; String? get avatarUrl;
/// Create a copy of ManagedStudent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagedStudentCopyWith<ManagedStudent> get copyWith => _$ManagedStudentCopyWithImpl<ManagedStudent>(this as ManagedStudent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagedStudent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.isHeadman, isHeadman) || other.isHeadman == isHeadman)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.telegram, telegram) || other.telegram == telegram)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,groupId,groupName,stream,isHeadman,phone,telegram,email,avatarUrl);

@override
String toString() {
  return 'ManagedStudent(id: $id, name: $name, groupId: $groupId, groupName: $groupName, stream: $stream, isHeadman: $isHeadman, phone: $phone, telegram: $telegram, email: $email, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ManagedStudentCopyWith<$Res>  {
  factory $ManagedStudentCopyWith(ManagedStudent value, $Res Function(ManagedStudent) _then) = _$ManagedStudentCopyWithImpl;
@useResult
$Res call({
 String id, String name, String groupId, String groupName, String stream, bool isHeadman, String? phone, String? telegram, String? email, String? avatarUrl
});




}
/// @nodoc
class _$ManagedStudentCopyWithImpl<$Res>
    implements $ManagedStudentCopyWith<$Res> {
  _$ManagedStudentCopyWithImpl(this._self, this._then);

  final ManagedStudent _self;
  final $Res Function(ManagedStudent) _then;

/// Create a copy of ManagedStudent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? groupId = null,Object? groupName = null,Object? stream = null,Object? isHeadman = null,Object? phone = freezed,Object? telegram = freezed,Object? email = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as String,isHeadman: null == isHeadman ? _self.isHeadman : isHeadman // ignore: cast_nullable_to_non_nullable
as bool,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagedStudent].
extension ManagedStudentPatterns on ManagedStudent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagedStudent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagedStudent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagedStudent value)  $default,){
final _that = this;
switch (_that) {
case _ManagedStudent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagedStudent value)?  $default,){
final _that = this;
switch (_that) {
case _ManagedStudent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String groupId,  String groupName,  String stream,  bool isHeadman,  String? phone,  String? telegram,  String? email,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagedStudent() when $default != null:
return $default(_that.id,_that.name,_that.groupId,_that.groupName,_that.stream,_that.isHeadman,_that.phone,_that.telegram,_that.email,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String groupId,  String groupName,  String stream,  bool isHeadman,  String? phone,  String? telegram,  String? email,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _ManagedStudent():
return $default(_that.id,_that.name,_that.groupId,_that.groupName,_that.stream,_that.isHeadman,_that.phone,_that.telegram,_that.email,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String groupId,  String groupName,  String stream,  bool isHeadman,  String? phone,  String? telegram,  String? email,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _ManagedStudent() when $default != null:
return $default(_that.id,_that.name,_that.groupId,_that.groupName,_that.stream,_that.isHeadman,_that.phone,_that.telegram,_that.email,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc


class _ManagedStudent implements ManagedStudent {
  const _ManagedStudent({required this.id, required this.name, required this.groupId, required this.groupName, required this.stream, required this.isHeadman, this.phone, this.telegram, this.email, this.avatarUrl});
  

@override final  String id;
@override final  String name;
@override final  String groupId;
@override final  String groupName;
@override final  String stream;
@override final  bool isHeadman;
@override final  String? phone;
@override final  String? telegram;
@override final  String? email;
@override final  String? avatarUrl;

/// Create a copy of ManagedStudent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagedStudentCopyWith<_ManagedStudent> get copyWith => __$ManagedStudentCopyWithImpl<_ManagedStudent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagedStudent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.isHeadman, isHeadman) || other.isHeadman == isHeadman)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.telegram, telegram) || other.telegram == telegram)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,groupId,groupName,stream,isHeadman,phone,telegram,email,avatarUrl);

@override
String toString() {
  return 'ManagedStudent(id: $id, name: $name, groupId: $groupId, groupName: $groupName, stream: $stream, isHeadman: $isHeadman, phone: $phone, telegram: $telegram, email: $email, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ManagedStudentCopyWith<$Res> implements $ManagedStudentCopyWith<$Res> {
  factory _$ManagedStudentCopyWith(_ManagedStudent value, $Res Function(_ManagedStudent) _then) = __$ManagedStudentCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String groupId, String groupName, String stream, bool isHeadman, String? phone, String? telegram, String? email, String? avatarUrl
});




}
/// @nodoc
class __$ManagedStudentCopyWithImpl<$Res>
    implements _$ManagedStudentCopyWith<$Res> {
  __$ManagedStudentCopyWithImpl(this._self, this._then);

  final _ManagedStudent _self;
  final $Res Function(_ManagedStudent) _then;

/// Create a copy of ManagedStudent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? groupId = null,Object? groupName = null,Object? stream = null,Object? isHeadman = null,Object? phone = freezed,Object? telegram = freezed,Object? email = freezed,Object? avatarUrl = freezed,}) {
  return _then(_ManagedStudent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as String,isHeadman: null == isHeadman ? _self.isHeadman : isHeadman // ignore: cast_nullable_to_non_nullable
as bool,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
