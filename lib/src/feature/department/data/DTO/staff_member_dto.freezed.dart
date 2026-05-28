// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_member_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaffMemberDTO {

 String get id; String get name; String get position; String get degree; String get email; String? get phone; String? get telegram; String? get office; String? get bio; List<String> get tags;@JsonKey(name: 'avatar_url') String? get avatarUrl;
/// Create a copy of StaffMemberDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffMemberDTOCopyWith<StaffMemberDTO> get copyWith => _$StaffMemberDTOCopyWithImpl<StaffMemberDTO>(this as StaffMemberDTO, _$identity);

  /// Serializes this StaffMemberDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffMemberDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.position, position) || other.position == position)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.telegram, telegram) || other.telegram == telegram)&&(identical(other.office, office) || other.office == office)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,position,degree,email,phone,telegram,office,bio,const DeepCollectionEquality().hash(tags),avatarUrl);

@override
String toString() {
  return 'StaffMemberDTO(id: $id, name: $name, position: $position, degree: $degree, email: $email, phone: $phone, telegram: $telegram, office: $office, bio: $bio, tags: $tags, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $StaffMemberDTOCopyWith<$Res>  {
  factory $StaffMemberDTOCopyWith(StaffMemberDTO value, $Res Function(StaffMemberDTO) _then) = _$StaffMemberDTOCopyWithImpl;
@useResult
$Res call({
 String id, String name, String position, String degree, String email, String? phone, String? telegram, String? office, String? bio, List<String> tags,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class _$StaffMemberDTOCopyWithImpl<$Res>
    implements $StaffMemberDTOCopyWith<$Res> {
  _$StaffMemberDTOCopyWithImpl(this._self, this._then);

  final StaffMemberDTO _self;
  final $Res Function(StaffMemberDTO) _then;

/// Create a copy of StaffMemberDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? position = null,Object? degree = null,Object? email = null,Object? phone = freezed,Object? telegram = freezed,Object? office = freezed,Object? bio = freezed,Object? tags = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,office: freezed == office ? _self.office : office // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StaffMemberDTO].
extension StaffMemberDTOPatterns on StaffMemberDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffMemberDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffMemberDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffMemberDTO value)  $default,){
final _that = this;
switch (_that) {
case _StaffMemberDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffMemberDTO value)?  $default,){
final _that = this;
switch (_that) {
case _StaffMemberDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String position,  String degree,  String email,  String? phone,  String? telegram,  String? office,  String? bio,  List<String> tags, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffMemberDTO() when $default != null:
return $default(_that.id,_that.name,_that.position,_that.degree,_that.email,_that.phone,_that.telegram,_that.office,_that.bio,_that.tags,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String position,  String degree,  String email,  String? phone,  String? telegram,  String? office,  String? bio,  List<String> tags, @JsonKey(name: 'avatar_url')  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _StaffMemberDTO():
return $default(_that.id,_that.name,_that.position,_that.degree,_that.email,_that.phone,_that.telegram,_that.office,_that.bio,_that.tags,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String position,  String degree,  String email,  String? phone,  String? telegram,  String? office,  String? bio,  List<String> tags, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _StaffMemberDTO() when $default != null:
return $default(_that.id,_that.name,_that.position,_that.degree,_that.email,_that.phone,_that.telegram,_that.office,_that.bio,_that.tags,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StaffMemberDTO implements StaffMemberDTO {
  const _StaffMemberDTO({required this.id, required this.name, required this.position, this.degree = '', required this.email, this.phone, this.telegram, this.office, this.bio, final  List<String> tags = const [], @JsonKey(name: 'avatar_url') this.avatarUrl}): _tags = tags;
  factory _StaffMemberDTO.fromJson(Map<String, dynamic> json) => _$StaffMemberDTOFromJson(json);

@override final  String id;
@override final  String name;
@override final  String position;
@override@JsonKey() final  String degree;
@override final  String email;
@override final  String? phone;
@override final  String? telegram;
@override final  String? office;
@override final  String? bio;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;

/// Create a copy of StaffMemberDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffMemberDTOCopyWith<_StaffMemberDTO> get copyWith => __$StaffMemberDTOCopyWithImpl<_StaffMemberDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffMemberDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffMemberDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.position, position) || other.position == position)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.telegram, telegram) || other.telegram == telegram)&&(identical(other.office, office) || other.office == office)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,position,degree,email,phone,telegram,office,bio,const DeepCollectionEquality().hash(_tags),avatarUrl);

@override
String toString() {
  return 'StaffMemberDTO(id: $id, name: $name, position: $position, degree: $degree, email: $email, phone: $phone, telegram: $telegram, office: $office, bio: $bio, tags: $tags, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$StaffMemberDTOCopyWith<$Res> implements $StaffMemberDTOCopyWith<$Res> {
  factory _$StaffMemberDTOCopyWith(_StaffMemberDTO value, $Res Function(_StaffMemberDTO) _then) = __$StaffMemberDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String position, String degree, String email, String? phone, String? telegram, String? office, String? bio, List<String> tags,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class __$StaffMemberDTOCopyWithImpl<$Res>
    implements _$StaffMemberDTOCopyWith<$Res> {
  __$StaffMemberDTOCopyWithImpl(this._self, this._then);

  final _StaffMemberDTO _self;
  final $Res Function(_StaffMemberDTO) _then;

/// Create a copy of StaffMemberDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? position = null,Object? degree = null,Object? email = null,Object? phone = freezed,Object? telegram = freezed,Object? office = freezed,Object? bio = freezed,Object? tags = null,Object? avatarUrl = freezed,}) {
  return _then(_StaffMemberDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,office: freezed == office ? _self.office : office // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
