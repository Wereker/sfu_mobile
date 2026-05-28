// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'students_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentsEvent {

 String? get stream; String? get groupId; String? get search;
/// Create a copy of StudentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentsEventCopyWith<StudentsEvent> get copyWith => _$StudentsEventCopyWithImpl<StudentsEvent>(this as StudentsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentsEvent&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,stream,groupId,search);

@override
String toString() {
  return 'StudentsEvent(stream: $stream, groupId: $groupId, search: $search)';
}


}

/// @nodoc
abstract mixin class $StudentsEventCopyWith<$Res>  {
  factory $StudentsEventCopyWith(StudentsEvent value, $Res Function(StudentsEvent) _then) = _$StudentsEventCopyWithImpl;
@useResult
$Res call({
 String? stream, String? groupId, String? search
});




}
/// @nodoc
class _$StudentsEventCopyWithImpl<$Res>
    implements $StudentsEventCopyWith<$Res> {
  _$StudentsEventCopyWithImpl(this._self, this._then);

  final StudentsEvent _self;
  final $Res Function(StudentsEvent) _then;

/// Create a copy of StudentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stream = freezed,Object? groupId = freezed,Object? search = freezed,}) {
  return _then(_self.copyWith(
stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentsEvent].
extension StudentsEventPatterns on StudentsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? stream,  String? groupId,  String? search)?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.stream,_that.groupId,_that.search);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? stream,  String? groupId,  String? search)  load,}) {final _that = this;
switch (_that) {
case _Load():
return load(_that.stream,_that.groupId,_that.search);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? stream,  String? groupId,  String? search)?  load,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.stream,_that.groupId,_that.search);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements StudentsEvent {
  const _Load({this.stream, this.groupId, this.search});
  

@override final  String? stream;
@override final  String? groupId;
@override final  String? search;

/// Create a copy of StudentsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadCopyWith<_Load> get copyWith => __$LoadCopyWithImpl<_Load>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,stream,groupId,search);

@override
String toString() {
  return 'StudentsEvent.load(stream: $stream, groupId: $groupId, search: $search)';
}


}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res> implements $StudentsEventCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) = __$LoadCopyWithImpl;
@override @useResult
$Res call({
 String? stream, String? groupId, String? search
});




}
/// @nodoc
class __$LoadCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

/// Create a copy of StudentsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stream = freezed,Object? groupId = freezed,Object? search = freezed,}) {
  return _then(_Load(
stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$StudentsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StudentsState()';
}


}

/// @nodoc
class $StudentsStateCopyWith<$Res>  {
$StudentsStateCopyWith(StudentsState _, $Res Function(StudentsState) __);
}


/// Adds pattern-matching-related methods to [StudentsState].
extension StudentsStatePatterns on StudentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StudentsInitial value)?  initial,TResult Function( _StudentsLoading value)?  loading,TResult Function( _StudentsSuccess value)?  success,TResult Function( _StudentsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentsInitial() when initial != null:
return initial(_that);case _StudentsLoading() when loading != null:
return loading(_that);case _StudentsSuccess() when success != null:
return success(_that);case _StudentsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StudentsInitial value)  initial,required TResult Function( _StudentsLoading value)  loading,required TResult Function( _StudentsSuccess value)  success,required TResult Function( _StudentsError value)  error,}){
final _that = this;
switch (_that) {
case _StudentsInitial():
return initial(_that);case _StudentsLoading():
return loading(_that);case _StudentsSuccess():
return success(_that);case _StudentsError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StudentsInitial value)?  initial,TResult? Function( _StudentsLoading value)?  loading,TResult? Function( _StudentsSuccess value)?  success,TResult? Function( _StudentsError value)?  error,}){
final _that = this;
switch (_that) {
case _StudentsInitial() when initial != null:
return initial(_that);case _StudentsLoading() when loading != null:
return loading(_that);case _StudentsSuccess() when success != null:
return success(_that);case _StudentsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ManagedStudent> students)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentsInitial() when initial != null:
return initial();case _StudentsLoading() when loading != null:
return loading();case _StudentsSuccess() when success != null:
return success(_that.students);case _StudentsError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ManagedStudent> students)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _StudentsInitial():
return initial();case _StudentsLoading():
return loading();case _StudentsSuccess():
return success(_that.students);case _StudentsError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ManagedStudent> students)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _StudentsInitial() when initial != null:
return initial();case _StudentsLoading() when loading != null:
return loading();case _StudentsSuccess() when success != null:
return success(_that.students);case _StudentsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _StudentsInitial implements StudentsState {
  const _StudentsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StudentsState.initial()';
}


}




/// @nodoc


class _StudentsLoading implements StudentsState {
  const _StudentsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StudentsState.loading()';
}


}




/// @nodoc


class _StudentsSuccess implements StudentsState {
  const _StudentsSuccess(final  List<ManagedStudent> students): _students = students;
  

 final  List<ManagedStudent> _students;
 List<ManagedStudent> get students {
  if (_students is EqualUnmodifiableListView) return _students;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_students);
}


/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentsSuccessCopyWith<_StudentsSuccess> get copyWith => __$StudentsSuccessCopyWithImpl<_StudentsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentsSuccess&&const DeepCollectionEquality().equals(other._students, _students));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_students));

@override
String toString() {
  return 'StudentsState.success(students: $students)';
}


}

/// @nodoc
abstract mixin class _$StudentsSuccessCopyWith<$Res> implements $StudentsStateCopyWith<$Res> {
  factory _$StudentsSuccessCopyWith(_StudentsSuccess value, $Res Function(_StudentsSuccess) _then) = __$StudentsSuccessCopyWithImpl;
@useResult
$Res call({
 List<ManagedStudent> students
});




}
/// @nodoc
class __$StudentsSuccessCopyWithImpl<$Res>
    implements _$StudentsSuccessCopyWith<$Res> {
  __$StudentsSuccessCopyWithImpl(this._self, this._then);

  final _StudentsSuccess _self;
  final $Res Function(_StudentsSuccess) _then;

/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? students = null,}) {
  return _then(_StudentsSuccess(
null == students ? _self._students : students // ignore: cast_nullable_to_non_nullable
as List<ManagedStudent>,
  ));
}


}

/// @nodoc


class _StudentsError implements StudentsState {
  const _StudentsError(this.message);
  

 final  String message;

/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentsErrorCopyWith<_StudentsError> get copyWith => __$StudentsErrorCopyWithImpl<_StudentsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'StudentsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$StudentsErrorCopyWith<$Res> implements $StudentsStateCopyWith<$Res> {
  factory _$StudentsErrorCopyWith(_StudentsError value, $Res Function(_StudentsError) _then) = __$StudentsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$StudentsErrorCopyWithImpl<$Res>
    implements _$StudentsErrorCopyWith<$Res> {
  __$StudentsErrorCopyWithImpl(this._self, this._then);

  final _StudentsError _self;
  final $Res Function(_StudentsError) _then;

/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_StudentsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
