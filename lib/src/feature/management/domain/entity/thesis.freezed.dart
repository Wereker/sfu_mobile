// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thesis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Thesis {

 String get id; String get title; String get teacherId; String get teacherName; bool get isFree; String? get takenBy; String? get takenById;
/// Create a copy of Thesis
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThesisCopyWith<Thesis> get copyWith => _$ThesisCopyWithImpl<Thesis>(this as Thesis, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Thesis&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.takenBy, takenBy) || other.takenBy == takenBy)&&(identical(other.takenById, takenById) || other.takenById == takenById));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,teacherId,teacherName,isFree,takenBy,takenById);

@override
String toString() {
  return 'Thesis(id: $id, title: $title, teacherId: $teacherId, teacherName: $teacherName, isFree: $isFree, takenBy: $takenBy, takenById: $takenById)';
}


}

/// @nodoc
abstract mixin class $ThesisCopyWith<$Res>  {
  factory $ThesisCopyWith(Thesis value, $Res Function(Thesis) _then) = _$ThesisCopyWithImpl;
@useResult
$Res call({
 String id, String title, String teacherId, String teacherName, bool isFree, String? takenBy, String? takenById
});




}
/// @nodoc
class _$ThesisCopyWithImpl<$Res>
    implements $ThesisCopyWith<$Res> {
  _$ThesisCopyWithImpl(this._self, this._then);

  final Thesis _self;
  final $Res Function(Thesis) _then;

/// Create a copy of Thesis
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? teacherId = null,Object? teacherName = null,Object? isFree = null,Object? takenBy = freezed,Object? takenById = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,takenBy: freezed == takenBy ? _self.takenBy : takenBy // ignore: cast_nullable_to_non_nullable
as String?,takenById: freezed == takenById ? _self.takenById : takenById // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Thesis].
extension ThesisPatterns on Thesis {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Thesis value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Thesis() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Thesis value)  $default,){
final _that = this;
switch (_that) {
case _Thesis():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Thesis value)?  $default,){
final _that = this;
switch (_that) {
case _Thesis() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String teacherId,  String teacherName,  bool isFree,  String? takenBy,  String? takenById)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Thesis() when $default != null:
return $default(_that.id,_that.title,_that.teacherId,_that.teacherName,_that.isFree,_that.takenBy,_that.takenById);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String teacherId,  String teacherName,  bool isFree,  String? takenBy,  String? takenById)  $default,) {final _that = this;
switch (_that) {
case _Thesis():
return $default(_that.id,_that.title,_that.teacherId,_that.teacherName,_that.isFree,_that.takenBy,_that.takenById);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String teacherId,  String teacherName,  bool isFree,  String? takenBy,  String? takenById)?  $default,) {final _that = this;
switch (_that) {
case _Thesis() when $default != null:
return $default(_that.id,_that.title,_that.teacherId,_that.teacherName,_that.isFree,_that.takenBy,_that.takenById);case _:
  return null;

}
}

}

/// @nodoc


class _Thesis implements Thesis {
  const _Thesis({required this.id, required this.title, required this.teacherId, required this.teacherName, required this.isFree, this.takenBy, this.takenById});
  

@override final  String id;
@override final  String title;
@override final  String teacherId;
@override final  String teacherName;
@override final  bool isFree;
@override final  String? takenBy;
@override final  String? takenById;

/// Create a copy of Thesis
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThesisCopyWith<_Thesis> get copyWith => __$ThesisCopyWithImpl<_Thesis>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Thesis&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.takenBy, takenBy) || other.takenBy == takenBy)&&(identical(other.takenById, takenById) || other.takenById == takenById));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,teacherId,teacherName,isFree,takenBy,takenById);

@override
String toString() {
  return 'Thesis(id: $id, title: $title, teacherId: $teacherId, teacherName: $teacherName, isFree: $isFree, takenBy: $takenBy, takenById: $takenById)';
}


}

/// @nodoc
abstract mixin class _$ThesisCopyWith<$Res> implements $ThesisCopyWith<$Res> {
  factory _$ThesisCopyWith(_Thesis value, $Res Function(_Thesis) _then) = __$ThesisCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String teacherId, String teacherName, bool isFree, String? takenBy, String? takenById
});




}
/// @nodoc
class __$ThesisCopyWithImpl<$Res>
    implements _$ThesisCopyWith<$Res> {
  __$ThesisCopyWithImpl(this._self, this._then);

  final _Thesis _self;
  final $Res Function(_Thesis) _then;

/// Create a copy of Thesis
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? teacherId = null,Object? teacherName = null,Object? isFree = null,Object? takenBy = freezed,Object? takenById = freezed,}) {
  return _then(_Thesis(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,takenBy: freezed == takenBy ? _self.takenBy : takenBy // ignore: cast_nullable_to_non_nullable
as String?,takenById: freezed == takenById ? _self.takenById : takenById // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
