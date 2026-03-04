// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent()';
}


}

/// @nodoc
class $NewsEventCopyWith<$Res>  {
$NewsEventCopyWith(NewsEvent _, $Res Function(NewsEvent) __);
}


/// Adds pattern-matching-related methods to [NewsEvent].
extension NewsEventPatterns on NewsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NewsLoadData value)?  loadData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsLoadData() when loadData != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NewsLoadData value)  loadData,}){
final _that = this;
switch (_that) {
case _NewsLoadData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NewsLoadData value)?  loadData,}){
final _that = this;
switch (_that) {
case _NewsLoadData() when loadData != null:
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
case _NewsLoadData() when loadData != null:
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
case _NewsLoadData():
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
case _NewsLoadData() when loadData != null:
return loadData();case _:
  return null;

}
}

}

/// @nodoc


class _NewsLoadData implements NewsEvent {
  const _NewsLoadData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsLoadData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent.loadData()';
}


}




/// @nodoc
mixin _$NewsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState()';
}


}

/// @nodoc
class $NewsStateCopyWith<$Res>  {
$NewsStateCopyWith(NewsState _, $Res Function(NewsState) __);
}


/// Adds pattern-matching-related methods to [NewsState].
extension NewsStatePatterns on NewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NewsInitial value)?  initial,TResult Function( _NewsLoading value)?  loading,TResult Function( _NewsSucces value)?  success,TResult Function( _NewsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsInitial() when initial != null:
return initial(_that);case _NewsLoading() when loading != null:
return loading(_that);case _NewsSucces() when success != null:
return success(_that);case _NewsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NewsInitial value)  initial,required TResult Function( _NewsLoading value)  loading,required TResult Function( _NewsSucces value)  success,required TResult Function( _NewsError value)  error,}){
final _that = this;
switch (_that) {
case _NewsInitial():
return initial(_that);case _NewsLoading():
return loading(_that);case _NewsSucces():
return success(_that);case _NewsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NewsInitial value)?  initial,TResult? Function( _NewsLoading value)?  loading,TResult? Function( _NewsSucces value)?  success,TResult? Function( _NewsError value)?  error,}){
final _that = this;
switch (_that) {
case _NewsInitial() when initial != null:
return initial(_that);case _NewsLoading() when loading != null:
return loading(_that);case _NewsSucces() when success != null:
return success(_that);case _NewsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<News> news)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsInitial() when initial != null:
return initial();case _NewsLoading() when loading != null:
return loading();case _NewsSucces() when success != null:
return success(_that.news);case _NewsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<News> news)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _NewsInitial():
return initial();case _NewsLoading():
return loading();case _NewsSucces():
return success(_that.news);case _NewsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<News> news)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _NewsInitial() when initial != null:
return initial();case _NewsLoading() when loading != null:
return loading();case _NewsSucces() when success != null:
return success(_that.news);case _NewsError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _NewsInitial implements NewsState {
  const _NewsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.initial()';
}


}




/// @nodoc


class _NewsLoading implements NewsState {
  const _NewsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.loading()';
}


}




/// @nodoc


class _NewsSucces implements NewsState {
  const _NewsSucces(final  List<News> news): _news = news;
  

 final  List<News> _news;
 List<News> get news {
  if (_news is EqualUnmodifiableListView) return _news;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_news);
}


/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsSuccesCopyWith<_NewsSucces> get copyWith => __$NewsSuccesCopyWithImpl<_NewsSucces>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsSucces&&const DeepCollectionEquality().equals(other._news, _news));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_news));

@override
String toString() {
  return 'NewsState.success(news: $news)';
}


}

/// @nodoc
abstract mixin class _$NewsSuccesCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$NewsSuccesCopyWith(_NewsSucces value, $Res Function(_NewsSucces) _then) = __$NewsSuccesCopyWithImpl;
@useResult
$Res call({
 List<News> news
});




}
/// @nodoc
class __$NewsSuccesCopyWithImpl<$Res>
    implements _$NewsSuccesCopyWith<$Res> {
  __$NewsSuccesCopyWithImpl(this._self, this._then);

  final _NewsSucces _self;
  final $Res Function(_NewsSucces) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,}) {
  return _then(_NewsSucces(
null == news ? _self._news : news // ignore: cast_nullable_to_non_nullable
as List<News>,
  ));
}


}

/// @nodoc


class _NewsError implements NewsState {
  const _NewsError({required this.error});
  

 final  String error;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsErrorCopyWith<_NewsError> get copyWith => __$NewsErrorCopyWithImpl<_NewsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'NewsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$NewsErrorCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$NewsErrorCopyWith(_NewsError value, $Res Function(_NewsError) _then) = __$NewsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$NewsErrorCopyWithImpl<$Res>
    implements _$NewsErrorCopyWith<$Res> {
  __$NewsErrorCopyWithImpl(this._self, this._then);

  final _NewsError _self;
  final $Res Function(_NewsError) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_NewsError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
