// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SuggestionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuggestionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SuggestionEvent()';
}


}

/// @nodoc
class $SuggestionEventCopyWith<$Res>  {
$SuggestionEventCopyWith(SuggestionEvent _, $Res Function(SuggestionEvent) __);
}


/// Adds pattern-matching-related methods to [SuggestionEvent].
extension SuggestionEventPatterns on SuggestionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SuggestionLoadData value)?  loadData,TResult Function( _SuggestionLoadDataForTarget value)?  loadSuggestions,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuggestionLoadData() when loadData != null:
return loadData(_that);case _SuggestionLoadDataForTarget() when loadSuggestions != null:
return loadSuggestions(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SuggestionLoadData value)  loadData,required TResult Function( _SuggestionLoadDataForTarget value)  loadSuggestions,}){
final _that = this;
switch (_that) {
case _SuggestionLoadData():
return loadData(_that);case _SuggestionLoadDataForTarget():
return loadSuggestions(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SuggestionLoadData value)?  loadData,TResult? Function( _SuggestionLoadDataForTarget value)?  loadSuggestions,}){
final _that = this;
switch (_that) {
case _SuggestionLoadData() when loadData != null:
return loadData(_that);case _SuggestionLoadDataForTarget() when loadSuggestions != null:
return loadSuggestions(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadData,TResult Function( String query)?  loadSuggestions,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuggestionLoadData() when loadData != null:
return loadData();case _SuggestionLoadDataForTarget() when loadSuggestions != null:
return loadSuggestions(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadData,required TResult Function( String query)  loadSuggestions,}) {final _that = this;
switch (_that) {
case _SuggestionLoadData():
return loadData();case _SuggestionLoadDataForTarget():
return loadSuggestions(_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadData,TResult? Function( String query)?  loadSuggestions,}) {final _that = this;
switch (_that) {
case _SuggestionLoadData() when loadData != null:
return loadData();case _SuggestionLoadDataForTarget() when loadSuggestions != null:
return loadSuggestions(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _SuggestionLoadData implements SuggestionEvent {
  const _SuggestionLoadData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestionLoadData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SuggestionEvent.loadData()';
}


}




/// @nodoc


class _SuggestionLoadDataForTarget implements SuggestionEvent {
  const _SuggestionLoadDataForTarget(this.query);
  

 final  String query;

/// Create a copy of SuggestionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionLoadDataForTargetCopyWith<_SuggestionLoadDataForTarget> get copyWith => __$SuggestionLoadDataForTargetCopyWithImpl<_SuggestionLoadDataForTarget>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestionLoadDataForTarget&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SuggestionEvent.loadSuggestions(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SuggestionLoadDataForTargetCopyWith<$Res> implements $SuggestionEventCopyWith<$Res> {
  factory _$SuggestionLoadDataForTargetCopyWith(_SuggestionLoadDataForTarget value, $Res Function(_SuggestionLoadDataForTarget) _then) = __$SuggestionLoadDataForTargetCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SuggestionLoadDataForTargetCopyWithImpl<$Res>
    implements _$SuggestionLoadDataForTargetCopyWith<$Res> {
  __$SuggestionLoadDataForTargetCopyWithImpl(this._self, this._then);

  final _SuggestionLoadDataForTarget _self;
  final $Res Function(_SuggestionLoadDataForTarget) _then;

/// Create a copy of SuggestionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_SuggestionLoadDataForTarget(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SuggestionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuggestionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SuggestionState()';
}


}

/// @nodoc
class $SuggestionStateCopyWith<$Res>  {
$SuggestionStateCopyWith(SuggestionState _, $Res Function(SuggestionState) __);
}


/// Adds pattern-matching-related methods to [SuggestionState].
extension SuggestionStatePatterns on SuggestionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SuggestionInitial value)?  initial,TResult Function( _SuggestionLoading value)?  loading,TResult Function( _SuggestionSuccess value)?  success,TResult Function( _SuggestionError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuggestionInitial() when initial != null:
return initial(_that);case _SuggestionLoading() when loading != null:
return loading(_that);case _SuggestionSuccess() when success != null:
return success(_that);case _SuggestionError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SuggestionInitial value)  initial,required TResult Function( _SuggestionLoading value)  loading,required TResult Function( _SuggestionSuccess value)  success,required TResult Function( _SuggestionError value)  error,}){
final _that = this;
switch (_that) {
case _SuggestionInitial():
return initial(_that);case _SuggestionLoading():
return loading(_that);case _SuggestionSuccess():
return success(_that);case _SuggestionError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SuggestionInitial value)?  initial,TResult? Function( _SuggestionLoading value)?  loading,TResult? Function( _SuggestionSuccess value)?  success,TResult? Function( _SuggestionError value)?  error,}){
final _that = this;
switch (_that) {
case _SuggestionInitial() when initial != null:
return initial(_that);case _SuggestionLoading() when loading != null:
return loading(_that);case _SuggestionSuccess() when success != null:
return success(_that);case _SuggestionError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<String> suggestions)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuggestionInitial() when initial != null:
return initial();case _SuggestionLoading() when loading != null:
return loading();case _SuggestionSuccess() when success != null:
return success(_that.suggestions);case _SuggestionError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<String> suggestions)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _SuggestionInitial():
return initial();case _SuggestionLoading():
return loading();case _SuggestionSuccess():
return success(_that.suggestions);case _SuggestionError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<String> suggestions)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _SuggestionInitial() when initial != null:
return initial();case _SuggestionLoading() when loading != null:
return loading();case _SuggestionSuccess() when success != null:
return success(_that.suggestions);case _SuggestionError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SuggestionInitial implements SuggestionState {
  const _SuggestionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SuggestionState.initial()';
}


}




/// @nodoc


class _SuggestionLoading implements SuggestionState {
  const _SuggestionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SuggestionState.loading()';
}


}




/// @nodoc


class _SuggestionSuccess implements SuggestionState {
  const _SuggestionSuccess({required final  List<String> suggestions}): _suggestions = suggestions;
  

 final  List<String> _suggestions;
 List<String> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}


/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionSuccessCopyWith<_SuggestionSuccess> get copyWith => __$SuggestionSuccessCopyWithImpl<_SuggestionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestionSuccess&&const DeepCollectionEquality().equals(other._suggestions, _suggestions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_suggestions));

@override
String toString() {
  return 'SuggestionState.success(suggestion: $suggestions)';
}


}

/// @nodoc
abstract mixin class _$SuggestionSuccessCopyWith<$Res> implements $SuggestionStateCopyWith<$Res> {
  factory _$SuggestionSuccessCopyWith(_SuggestionSuccess value, $Res Function(_SuggestionSuccess) _then) = __$SuggestionSuccessCopyWithImpl;
@useResult
$Res call({
 List<String> suggestions
});




}
/// @nodoc
class __$SuggestionSuccessCopyWithImpl<$Res>
    implements _$SuggestionSuccessCopyWith<$Res> {
  __$SuggestionSuccessCopyWithImpl(this._self, this._then);

  final _SuggestionSuccess _self;
  final $Res Function(_SuggestionSuccess) _then;

/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? suggestions = null,}) {
  return _then(_SuggestionSuccess(
suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class _SuggestionError implements SuggestionState {
  const _SuggestionError({required this.error});
  

 final  String error;

/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionErrorCopyWith<_SuggestionError> get copyWith => __$SuggestionErrorCopyWithImpl<_SuggestionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestionError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SuggestionState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$SuggestionErrorCopyWith<$Res> implements $SuggestionStateCopyWith<$Res> {
  factory _$SuggestionErrorCopyWith(_SuggestionError value, $Res Function(_SuggestionError) _then) = __$SuggestionErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$SuggestionErrorCopyWithImpl<$Res>
    implements _$SuggestionErrorCopyWith<$Res> {
  __$SuggestionErrorCopyWithImpl(this._self, this._then);

  final _SuggestionError _self;
  final $Res Function(_SuggestionError) _then;

/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_SuggestionError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
