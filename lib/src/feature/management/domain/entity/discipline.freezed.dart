// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discipline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Discipline {

 String get id; String get name; String get teacherId; String get teacherName; int get credits; String get level; int get totalSeats; int get takenSeats; bool get isEnrolled;
/// Create a copy of Discipline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisciplineCopyWith<Discipline> get copyWith => _$DisciplineCopyWithImpl<Discipline>(this as Discipline, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Discipline&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.level, level) || other.level == level)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.takenSeats, takenSeats) || other.takenSeats == takenSeats)&&(identical(other.isEnrolled, isEnrolled) || other.isEnrolled == isEnrolled));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,teacherId,teacherName,credits,level,totalSeats,takenSeats,isEnrolled);

@override
String toString() {
  return 'Discipline(id: $id, name: $name, teacherId: $teacherId, teacherName: $teacherName, credits: $credits, level: $level, totalSeats: $totalSeats, takenSeats: $takenSeats, isEnrolled: $isEnrolled)';
}


}

/// @nodoc
abstract mixin class $DisciplineCopyWith<$Res>  {
  factory $DisciplineCopyWith(Discipline value, $Res Function(Discipline) _then) = _$DisciplineCopyWithImpl;
@useResult
$Res call({
 String id, String name, String teacherId, String teacherName, int credits, String level, int totalSeats, int takenSeats, bool isEnrolled
});




}
/// @nodoc
class _$DisciplineCopyWithImpl<$Res>
    implements $DisciplineCopyWith<$Res> {
  _$DisciplineCopyWithImpl(this._self, this._then);

  final Discipline _self;
  final $Res Function(Discipline) _then;

/// Create a copy of Discipline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? teacherId = null,Object? teacherName = null,Object? credits = null,Object? level = null,Object? totalSeats = null,Object? takenSeats = null,Object? isEnrolled = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,takenSeats: null == takenSeats ? _self.takenSeats : takenSeats // ignore: cast_nullable_to_non_nullable
as int,isEnrolled: null == isEnrolled ? _self.isEnrolled : isEnrolled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Discipline].
extension DisciplinePatterns on Discipline {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Discipline value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Discipline() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Discipline value)  $default,){
final _that = this;
switch (_that) {
case _Discipline():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Discipline value)?  $default,){
final _that = this;
switch (_that) {
case _Discipline() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String teacherId,  String teacherName,  int credits,  String level,  int totalSeats,  int takenSeats,  bool isEnrolled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Discipline() when $default != null:
return $default(_that.id,_that.name,_that.teacherId,_that.teacherName,_that.credits,_that.level,_that.totalSeats,_that.takenSeats,_that.isEnrolled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String teacherId,  String teacherName,  int credits,  String level,  int totalSeats,  int takenSeats,  bool isEnrolled)  $default,) {final _that = this;
switch (_that) {
case _Discipline():
return $default(_that.id,_that.name,_that.teacherId,_that.teacherName,_that.credits,_that.level,_that.totalSeats,_that.takenSeats,_that.isEnrolled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String teacherId,  String teacherName,  int credits,  String level,  int totalSeats,  int takenSeats,  bool isEnrolled)?  $default,) {final _that = this;
switch (_that) {
case _Discipline() when $default != null:
return $default(_that.id,_that.name,_that.teacherId,_that.teacherName,_that.credits,_that.level,_that.totalSeats,_that.takenSeats,_that.isEnrolled);case _:
  return null;

}
}

}

/// @nodoc


class _Discipline implements Discipline {
  const _Discipline({required this.id, required this.name, required this.teacherId, required this.teacherName, required this.credits, required this.level, required this.totalSeats, required this.takenSeats, required this.isEnrolled});
  

@override final  String id;
@override final  String name;
@override final  String teacherId;
@override final  String teacherName;
@override final  int credits;
@override final  String level;
@override final  int totalSeats;
@override final  int takenSeats;
@override final  bool isEnrolled;

/// Create a copy of Discipline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisciplineCopyWith<_Discipline> get copyWith => __$DisciplineCopyWithImpl<_Discipline>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Discipline&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.level, level) || other.level == level)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.takenSeats, takenSeats) || other.takenSeats == takenSeats)&&(identical(other.isEnrolled, isEnrolled) || other.isEnrolled == isEnrolled));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,teacherId,teacherName,credits,level,totalSeats,takenSeats,isEnrolled);

@override
String toString() {
  return 'Discipline(id: $id, name: $name, teacherId: $teacherId, teacherName: $teacherName, credits: $credits, level: $level, totalSeats: $totalSeats, takenSeats: $takenSeats, isEnrolled: $isEnrolled)';
}


}

/// @nodoc
abstract mixin class _$DisciplineCopyWith<$Res> implements $DisciplineCopyWith<$Res> {
  factory _$DisciplineCopyWith(_Discipline value, $Res Function(_Discipline) _then) = __$DisciplineCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String teacherId, String teacherName, int credits, String level, int totalSeats, int takenSeats, bool isEnrolled
});




}
/// @nodoc
class __$DisciplineCopyWithImpl<$Res>
    implements _$DisciplineCopyWith<$Res> {
  __$DisciplineCopyWithImpl(this._self, this._then);

  final _Discipline _self;
  final $Res Function(_Discipline) _then;

/// Create a copy of Discipline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? teacherId = null,Object? teacherName = null,Object? credits = null,Object? level = null,Object? totalSeats = null,Object? takenSeats = null,Object? isEnrolled = null,}) {
  return _then(_Discipline(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,takenSeats: null == takenSeats ? _self.takenSeats : takenSeats // ignore: cast_nullable_to_non_nullable
as int,isEnrolled: null == isEnrolled ? _self.isEnrolled : isEnrolled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
