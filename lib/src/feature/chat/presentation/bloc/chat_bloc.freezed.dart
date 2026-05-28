// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// Adds pattern-matching-related methods to [ChatEvent].
extension ChatEventPatterns on ChatEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadData value)?  loadData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadData() when loadData != null:
return loadData(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadData value)  loadData,}){
final _that = this;
switch (_that) {
case _LoadData():
return loadData(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadData value)?  loadData,}){
final _that = this;
switch (_that) {
case _LoadData() when loadData != null:
return loadData(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadData() when loadData != null:
return loadData();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadData,}) {final _that = this;
switch (_that) {
case _LoadData():
return loadData();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadData,}) {final _that = this;
switch (_that) {
case _LoadData() when loadData != null:
return loadData();case _:
  return null;

}
}

}

/// @nodoc


class _LoadData implements ChatEvent {
  const _LoadData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.loadData()';
}


}




/// @nodoc
mixin _$ChatState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatState()';
}


}

/// @nodoc
class $ChatStateCopyWith<$Res>  {
$ChatStateCopyWith(ChatState _, $Res Function(ChatState) __);
}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChatInitial value)?  initial,TResult Function( _ChatLoading value)?  loading,TResult Function( _ChatSuccess value)?  success,TResult Function( _ChatError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatInitial() when initial != null:
return initial(_that);case _ChatLoading() when loading != null:
return loading(_that);case _ChatSuccess() when success != null:
return success(_that);case _ChatError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChatInitial value)  initial,required TResult Function( _ChatLoading value)  loading,required TResult Function( _ChatSuccess value)  success,required TResult Function( _ChatError value)  error,}){
final _that = this;
switch (_that) {
case _ChatInitial():
return initial(_that);case _ChatLoading():
return loading(_that);case _ChatSuccess():
return success(_that);case _ChatError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChatInitial value)?  initial,TResult? Function( _ChatLoading value)?  loading,TResult? Function( _ChatSuccess value)?  success,TResult? Function( _ChatError value)?  error,}){
final _that = this;
switch (_that) {
case _ChatInitial() when initial != null:
return initial(_that);case _ChatLoading() when loading != null:
return loading(_that);case _ChatSuccess() when success != null:
return success(_that);case _ChatError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Chat> chats)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatInitial() when initial != null:
return initial();case _ChatLoading() when loading != null:
return loading();case _ChatSuccess() when success != null:
return success(_that.chats);case _ChatError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Chat> chats)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _ChatInitial():
return initial();case _ChatLoading():
return loading();case _ChatSuccess():
return success(_that.chats);case _ChatError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Chat> chats)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _ChatInitial() when initial != null:
return initial();case _ChatLoading() when loading != null:
return loading();case _ChatSuccess() when success != null:
return success(_that.chats);case _ChatError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ChatInitial implements ChatState {
  const _ChatInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatState.initial()';
}


}




/// @nodoc


class _ChatLoading implements ChatState {
  const _ChatLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatState.loading()';
}


}




/// @nodoc


class _ChatSuccess implements ChatState {
  const _ChatSuccess(final  List<Chat> chats): _chats = chats;
  

 final  List<Chat> _chats;
 List<Chat> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}


/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatSuccessCopyWith<_ChatSuccess> get copyWith => __$ChatSuccessCopyWithImpl<_ChatSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatSuccess&&const DeepCollectionEquality().equals(other._chats, _chats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chats));

@override
String toString() {
  return 'ChatState.success(chats: $chats)';
}


}

/// @nodoc
abstract mixin class _$ChatSuccessCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatSuccessCopyWith(_ChatSuccess value, $Res Function(_ChatSuccess) _then) = __$ChatSuccessCopyWithImpl;
@useResult
$Res call({
 List<Chat> chats
});




}
/// @nodoc
class __$ChatSuccessCopyWithImpl<$Res>
    implements _$ChatSuccessCopyWith<$Res> {
  __$ChatSuccessCopyWithImpl(this._self, this._then);

  final _ChatSuccess _self;
  final $Res Function(_ChatSuccess) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chats = null,}) {
  return _then(_ChatSuccess(
null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<Chat>,
  ));
}


}

/// @nodoc


class _ChatError implements ChatState {
  const _ChatError({required this.error});
  

 final  String error;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatErrorCopyWith<_ChatError> get copyWith => __$ChatErrorCopyWithImpl<_ChatError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ChatState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ChatErrorCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatErrorCopyWith(_ChatError value, $Res Function(_ChatError) _then) = __$ChatErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$ChatErrorCopyWithImpl<$Res>
    implements _$ChatErrorCopyWith<$Res> {
  __$ChatErrorCopyWithImpl(this._self, this._then);

  final _ChatError _self;
  final $Res Function(_ChatError) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_ChatError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
