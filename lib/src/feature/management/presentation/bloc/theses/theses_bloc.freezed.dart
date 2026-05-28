// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theses_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThesesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThesesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThesesEvent()';
}


}

/// @nodoc
class $ThesesEventCopyWith<$Res>  {
$ThesesEventCopyWith(ThesesEvent _, $Res Function(ThesesEvent) __);
}


/// Adds pattern-matching-related methods to [ThesesEvent].
extension ThesesEventPatterns on ThesesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _Create value)?  create,TResult Function( _Update value)?  update,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Create() when create != null:
return create(_that);case _Update() when update != null:
return update(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _Create value)  create,required TResult Function( _Update value)  update,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _Create():
return create(_that);case _Update():
return update(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _Create value)?  create,TResult? Function( _Update value)?  update,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Create() when create != null:
return create(_that);case _Update() when update != null:
return update(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String title)?  create,TResult Function( String id,  String? title,  bool? isFree)?  update,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Create() when create != null:
return create(_that.title);case _Update() when update != null:
return update(_that.id,_that.title,_that.isFree);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String title)  create,required TResult Function( String id,  String? title,  bool? isFree)  update,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _Create():
return create(_that.title);case _Update():
return update(_that.id,_that.title,_that.isFree);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String title)?  create,TResult? Function( String id,  String? title,  bool? isFree)?  update,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Create() when create != null:
return create(_that.title);case _Update() when update != null:
return update(_that.id,_that.title,_that.isFree);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements ThesesEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThesesEvent.load()';
}


}




/// @nodoc


class _Create implements ThesesEvent {
  const _Create(this.title);
  

 final  String title;

/// Create a copy of ThesesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'ThesesEvent.create(title: $title)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $ThesesEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of ThesesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(_Create(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Update implements ThesesEvent {
  const _Update(this.id, {this.title, this.isFree});
  

 final  String id;
 final  String? title;
 final  bool? isFree;

/// Create a copy of ThesesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isFree, isFree) || other.isFree == isFree));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,isFree);

@override
String toString() {
  return 'ThesesEvent.update(id: $id, title: $title, isFree: $isFree)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $ThesesEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 String id, String? title, bool? isFree
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of ThesesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = freezed,Object? isFree = freezed,}) {
  return _then(_Update(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,isFree: freezed == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc
mixin _$ThesesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThesesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThesesState()';
}


}

/// @nodoc
class $ThesesStateCopyWith<$Res>  {
$ThesesStateCopyWith(ThesesState _, $Res Function(ThesesState) __);
}


/// Adds pattern-matching-related methods to [ThesesState].
extension ThesesStatePatterns on ThesesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ThesesInitial value)?  initial,TResult Function( _ThesesLoading value)?  loading,TResult Function( _ThesesSuccess value)?  success,TResult Function( _ThesesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThesesInitial() when initial != null:
return initial(_that);case _ThesesLoading() when loading != null:
return loading(_that);case _ThesesSuccess() when success != null:
return success(_that);case _ThesesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ThesesInitial value)  initial,required TResult Function( _ThesesLoading value)  loading,required TResult Function( _ThesesSuccess value)  success,required TResult Function( _ThesesError value)  error,}){
final _that = this;
switch (_that) {
case _ThesesInitial():
return initial(_that);case _ThesesLoading():
return loading(_that);case _ThesesSuccess():
return success(_that);case _ThesesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ThesesInitial value)?  initial,TResult? Function( _ThesesLoading value)?  loading,TResult? Function( _ThesesSuccess value)?  success,TResult? Function( _ThesesError value)?  error,}){
final _that = this;
switch (_that) {
case _ThesesInitial() when initial != null:
return initial(_that);case _ThesesLoading() when loading != null:
return loading(_that);case _ThesesSuccess() when success != null:
return success(_that);case _ThesesError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Thesis> theses)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThesesInitial() when initial != null:
return initial();case _ThesesLoading() when loading != null:
return loading();case _ThesesSuccess() when success != null:
return success(_that.theses);case _ThesesError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Thesis> theses)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _ThesesInitial():
return initial();case _ThesesLoading():
return loading();case _ThesesSuccess():
return success(_that.theses);case _ThesesError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Thesis> theses)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _ThesesInitial() when initial != null:
return initial();case _ThesesLoading() when loading != null:
return loading();case _ThesesSuccess() when success != null:
return success(_that.theses);case _ThesesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ThesesInitial implements ThesesState {
  const _ThesesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThesesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThesesState.initial()';
}


}




/// @nodoc


class _ThesesLoading implements ThesesState {
  const _ThesesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThesesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThesesState.loading()';
}


}




/// @nodoc


class _ThesesSuccess implements ThesesState {
  const _ThesesSuccess(final  List<Thesis> theses): _theses = theses;
  

 final  List<Thesis> _theses;
 List<Thesis> get theses {
  if (_theses is EqualUnmodifiableListView) return _theses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_theses);
}


/// Create a copy of ThesesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThesesSuccessCopyWith<_ThesesSuccess> get copyWith => __$ThesesSuccessCopyWithImpl<_ThesesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThesesSuccess&&const DeepCollectionEquality().equals(other._theses, _theses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_theses));

@override
String toString() {
  return 'ThesesState.success(theses: $theses)';
}


}

/// @nodoc
abstract mixin class _$ThesesSuccessCopyWith<$Res> implements $ThesesStateCopyWith<$Res> {
  factory _$ThesesSuccessCopyWith(_ThesesSuccess value, $Res Function(_ThesesSuccess) _then) = __$ThesesSuccessCopyWithImpl;
@useResult
$Res call({
 List<Thesis> theses
});




}
/// @nodoc
class __$ThesesSuccessCopyWithImpl<$Res>
    implements _$ThesesSuccessCopyWith<$Res> {
  __$ThesesSuccessCopyWithImpl(this._self, this._then);

  final _ThesesSuccess _self;
  final $Res Function(_ThesesSuccess) _then;

/// Create a copy of ThesesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? theses = null,}) {
  return _then(_ThesesSuccess(
null == theses ? _self._theses : theses // ignore: cast_nullable_to_non_nullable
as List<Thesis>,
  ));
}


}

/// @nodoc


class _ThesesError implements ThesesState {
  const _ThesesError(this.message);
  

 final  String message;

/// Create a copy of ThesesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThesesErrorCopyWith<_ThesesError> get copyWith => __$ThesesErrorCopyWithImpl<_ThesesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThesesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ThesesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ThesesErrorCopyWith<$Res> implements $ThesesStateCopyWith<$Res> {
  factory _$ThesesErrorCopyWith(_ThesesError value, $Res Function(_ThesesError) _then) = __$ThesesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ThesesErrorCopyWithImpl<$Res>
    implements _$ThesesErrorCopyWith<$Res> {
  __$ThesesErrorCopyWithImpl(this._self, this._then);

  final _ThesesError _self;
  final $Res Function(_ThesesError) _then;

/// Create a copy of ThesesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ThesesError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
