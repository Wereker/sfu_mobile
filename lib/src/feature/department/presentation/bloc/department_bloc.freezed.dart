// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'department_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DepartmentEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DepartmentEvent()';
}


}

/// @nodoc
class $DepartmentEventCopyWith<$Res>  {
$DepartmentEventCopyWith(DepartmentEvent _, $Res Function(DepartmentEvent) __);
}


/// Adds pattern-matching-related methods to [DepartmentEvent].
extension DepartmentEventPatterns on DepartmentEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class _Load implements DepartmentEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DepartmentEvent.load()';
}


}




/// @nodoc
mixin _$DepartmentState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DepartmentState()';
}


}

/// @nodoc
class $DepartmentStateCopyWith<$Res>  {
$DepartmentStateCopyWith(DepartmentState _, $Res Function(DepartmentState) __);
}


/// Adds pattern-matching-related methods to [DepartmentState].
extension DepartmentStatePatterns on DepartmentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DepartmentInitial value)?  initial,TResult Function( _DepartmentLoading value)?  loading,TResult Function( _DepartmentSuccess value)?  success,TResult Function( _DepartmentError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentInitial() when initial != null:
return initial(_that);case _DepartmentLoading() when loading != null:
return loading(_that);case _DepartmentSuccess() when success != null:
return success(_that);case _DepartmentError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DepartmentInitial value)  initial,required TResult Function( _DepartmentLoading value)  loading,required TResult Function( _DepartmentSuccess value)  success,required TResult Function( _DepartmentError value)  error,}){
final _that = this;
switch (_that) {
case _DepartmentInitial():
return initial(_that);case _DepartmentLoading():
return loading(_that);case _DepartmentSuccess():
return success(_that);case _DepartmentError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DepartmentInitial value)?  initial,TResult? Function( _DepartmentLoading value)?  loading,TResult? Function( _DepartmentSuccess value)?  success,TResult? Function( _DepartmentError value)?  error,}){
final _that = this;
switch (_that) {
case _DepartmentInitial() when initial != null:
return initial(_that);case _DepartmentLoading() when loading != null:
return loading(_that);case _DepartmentSuccess() when success != null:
return success(_that);case _DepartmentError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<StaffMember> staff)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentInitial() when initial != null:
return initial();case _DepartmentLoading() when loading != null:
return loading();case _DepartmentSuccess() when success != null:
return success(_that.staff);case _DepartmentError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<StaffMember> staff)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _DepartmentInitial():
return initial();case _DepartmentLoading():
return loading();case _DepartmentSuccess():
return success(_that.staff);case _DepartmentError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<StaffMember> staff)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _DepartmentInitial() when initial != null:
return initial();case _DepartmentLoading() when loading != null:
return loading();case _DepartmentSuccess() when success != null:
return success(_that.staff);case _DepartmentError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _DepartmentInitial implements DepartmentState {
  const _DepartmentInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DepartmentState.initial()';
}


}




/// @nodoc


class _DepartmentLoading implements DepartmentState {
  const _DepartmentLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DepartmentState.loading()';
}


}




/// @nodoc


class _DepartmentSuccess implements DepartmentState {
  const _DepartmentSuccess(final  List<StaffMember> staff): _staff = staff;
  

 final  List<StaffMember> _staff;
 List<StaffMember> get staff {
  if (_staff is EqualUnmodifiableListView) return _staff;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_staff);
}


/// Create a copy of DepartmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentSuccessCopyWith<_DepartmentSuccess> get copyWith => __$DepartmentSuccessCopyWithImpl<_DepartmentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentSuccess&&const DeepCollectionEquality().equals(other._staff, _staff));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_staff));

@override
String toString() {
  return 'DepartmentState.success(staff: $staff)';
}


}

/// @nodoc
abstract mixin class _$DepartmentSuccessCopyWith<$Res> implements $DepartmentStateCopyWith<$Res> {
  factory _$DepartmentSuccessCopyWith(_DepartmentSuccess value, $Res Function(_DepartmentSuccess) _then) = __$DepartmentSuccessCopyWithImpl;
@useResult
$Res call({
 List<StaffMember> staff
});




}
/// @nodoc
class __$DepartmentSuccessCopyWithImpl<$Res>
    implements _$DepartmentSuccessCopyWith<$Res> {
  __$DepartmentSuccessCopyWithImpl(this._self, this._then);

  final _DepartmentSuccess _self;
  final $Res Function(_DepartmentSuccess) _then;

/// Create a copy of DepartmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? staff = null,}) {
  return _then(_DepartmentSuccess(
null == staff ? _self._staff : staff // ignore: cast_nullable_to_non_nullable
as List<StaffMember>,
  ));
}


}

/// @nodoc


class _DepartmentError implements DepartmentState {
  const _DepartmentError(this.message);
  

 final  String message;

/// Create a copy of DepartmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentErrorCopyWith<_DepartmentError> get copyWith => __$DepartmentErrorCopyWithImpl<_DepartmentError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DepartmentState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$DepartmentErrorCopyWith<$Res> implements $DepartmentStateCopyWith<$Res> {
  factory _$DepartmentErrorCopyWith(_DepartmentError value, $Res Function(_DepartmentError) _then) = __$DepartmentErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$DepartmentErrorCopyWithImpl<$Res>
    implements _$DepartmentErrorCopyWith<$Res> {
  __$DepartmentErrorCopyWithImpl(this._self, this._then);

  final _DepartmentError _self;
  final $Res Function(_DepartmentError) _then;

/// Create a copy of DepartmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_DepartmentError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
