// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnouncementDTO {

@JsonKey(fromJson: _intToString) String get id; String get title; String get content; String get status;// 'draft' | 'published' | 'expired'
@JsonKey(name: 'publish_at') String get publishAt;@JsonKey(name: 'expires_at') String get expiresAt;@JsonKey(name: 'author_id', fromJson: _intToString) String get authorId;@JsonKey(name: 'created_at') String get createdAt; List<dynamic> get attachments;
/// Create a copy of AnnouncementDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnouncementDTOCopyWith<AnnouncementDTO> get copyWith => _$AnnouncementDTOCopyWithImpl<AnnouncementDTO>(this as AnnouncementDTO, _$identity);

  /// Serializes this AnnouncementDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnouncementDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.status, status) || other.status == status)&&(identical(other.publishAt, publishAt) || other.publishAt == publishAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,status,publishAt,expiresAt,authorId,createdAt,const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'AnnouncementDTO(id: $id, title: $title, content: $content, status: $status, publishAt: $publishAt, expiresAt: $expiresAt, authorId: $authorId, createdAt: $createdAt, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $AnnouncementDTOCopyWith<$Res>  {
  factory $AnnouncementDTOCopyWith(AnnouncementDTO value, $Res Function(AnnouncementDTO) _then) = _$AnnouncementDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intToString) String id, String title, String content, String status,@JsonKey(name: 'publish_at') String publishAt,@JsonKey(name: 'expires_at') String expiresAt,@JsonKey(name: 'author_id', fromJson: _intToString) String authorId,@JsonKey(name: 'created_at') String createdAt, List<dynamic> attachments
});




}
/// @nodoc
class _$AnnouncementDTOCopyWithImpl<$Res>
    implements $AnnouncementDTOCopyWith<$Res> {
  _$AnnouncementDTOCopyWithImpl(this._self, this._then);

  final AnnouncementDTO _self;
  final $Res Function(AnnouncementDTO) _then;

/// Create a copy of AnnouncementDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = null,Object? status = null,Object? publishAt = null,Object? expiresAt = null,Object? authorId = null,Object? createdAt = null,Object? attachments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,publishAt: null == publishAt ? _self.publishAt : publishAt // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnouncementDTO].
extension AnnouncementDTOPatterns on AnnouncementDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnouncementDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnouncementDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnouncementDTO value)  $default,){
final _that = this;
switch (_that) {
case _AnnouncementDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnouncementDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AnnouncementDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id,  String title,  String content,  String status, @JsonKey(name: 'publish_at')  String publishAt, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'author_id', fromJson: _intToString)  String authorId, @JsonKey(name: 'created_at')  String createdAt,  List<dynamic> attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnouncementDTO() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.status,_that.publishAt,_that.expiresAt,_that.authorId,_that.createdAt,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intToString)  String id,  String title,  String content,  String status, @JsonKey(name: 'publish_at')  String publishAt, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'author_id', fromJson: _intToString)  String authorId, @JsonKey(name: 'created_at')  String createdAt,  List<dynamic> attachments)  $default,) {final _that = this;
switch (_that) {
case _AnnouncementDTO():
return $default(_that.id,_that.title,_that.content,_that.status,_that.publishAt,_that.expiresAt,_that.authorId,_that.createdAt,_that.attachments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intToString)  String id,  String title,  String content,  String status, @JsonKey(name: 'publish_at')  String publishAt, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'author_id', fromJson: _intToString)  String authorId, @JsonKey(name: 'created_at')  String createdAt,  List<dynamic> attachments)?  $default,) {final _that = this;
switch (_that) {
case _AnnouncementDTO() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.status,_that.publishAt,_that.expiresAt,_that.authorId,_that.createdAt,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnouncementDTO implements AnnouncementDTO {
  const _AnnouncementDTO({@JsonKey(fromJson: _intToString) required this.id, required this.title, required this.content, required this.status, @JsonKey(name: 'publish_at') required this.publishAt, @JsonKey(name: 'expires_at') required this.expiresAt, @JsonKey(name: 'author_id', fromJson: _intToString) required this.authorId, @JsonKey(name: 'created_at') required this.createdAt, final  List<dynamic> attachments = const []}): _attachments = attachments;
  factory _AnnouncementDTO.fromJson(Map<String, dynamic> json) => _$AnnouncementDTOFromJson(json);

@override@JsonKey(fromJson: _intToString) final  String id;
@override final  String title;
@override final  String content;
@override final  String status;
// 'draft' | 'published' | 'expired'
@override@JsonKey(name: 'publish_at') final  String publishAt;
@override@JsonKey(name: 'expires_at') final  String expiresAt;
@override@JsonKey(name: 'author_id', fromJson: _intToString) final  String authorId;
@override@JsonKey(name: 'created_at') final  String createdAt;
 final  List<dynamic> _attachments;
@override@JsonKey() List<dynamic> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}


/// Create a copy of AnnouncementDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnouncementDTOCopyWith<_AnnouncementDTO> get copyWith => __$AnnouncementDTOCopyWithImpl<_AnnouncementDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnouncementDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnouncementDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.status, status) || other.status == status)&&(identical(other.publishAt, publishAt) || other.publishAt == publishAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,status,publishAt,expiresAt,authorId,createdAt,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'AnnouncementDTO(id: $id, title: $title, content: $content, status: $status, publishAt: $publishAt, expiresAt: $expiresAt, authorId: $authorId, createdAt: $createdAt, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$AnnouncementDTOCopyWith<$Res> implements $AnnouncementDTOCopyWith<$Res> {
  factory _$AnnouncementDTOCopyWith(_AnnouncementDTO value, $Res Function(_AnnouncementDTO) _then) = __$AnnouncementDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intToString) String id, String title, String content, String status,@JsonKey(name: 'publish_at') String publishAt,@JsonKey(name: 'expires_at') String expiresAt,@JsonKey(name: 'author_id', fromJson: _intToString) String authorId,@JsonKey(name: 'created_at') String createdAt, List<dynamic> attachments
});




}
/// @nodoc
class __$AnnouncementDTOCopyWithImpl<$Res>
    implements _$AnnouncementDTOCopyWith<$Res> {
  __$AnnouncementDTOCopyWithImpl(this._self, this._then);

  final _AnnouncementDTO _self;
  final $Res Function(_AnnouncementDTO) _then;

/// Create a copy of AnnouncementDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = null,Object? status = null,Object? publishAt = null,Object? expiresAt = null,Object? authorId = null,Object? createdAt = null,Object? attachments = null,}) {
  return _then(_AnnouncementDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,publishAt: null == publishAt ? _self.publishAt : publishAt // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

// dart format on
