// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent()';
}


}

/// @nodoc
class $SettingsEventCopyWith<$Res>  {
$SettingsEventCopyWith(SettingsEvent _, $Res Function(SettingsEvent) __);
}


/// Adds pattern-matching-related methods to [SettingsEvent].
extension SettingsEventPatterns on SettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetAppSettings value)?  getAppSettings,TResult Function( _UpdateThemeMode value)?  updateAppThemeMode,TResult Function( _UpdateLocalization value)?  updateAppLocalization,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAppSettings() when getAppSettings != null:
return getAppSettings(_that);case _UpdateThemeMode() when updateAppThemeMode != null:
return updateAppThemeMode(_that);case _UpdateLocalization() when updateAppLocalization != null:
return updateAppLocalization(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetAppSettings value)  getAppSettings,required TResult Function( _UpdateThemeMode value)  updateAppThemeMode,required TResult Function( _UpdateLocalization value)  updateAppLocalization,}){
final _that = this;
switch (_that) {
case _GetAppSettings():
return getAppSettings(_that);case _UpdateThemeMode():
return updateAppThemeMode(_that);case _UpdateLocalization():
return updateAppLocalization(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetAppSettings value)?  getAppSettings,TResult? Function( _UpdateThemeMode value)?  updateAppThemeMode,TResult? Function( _UpdateLocalization value)?  updateAppLocalization,}){
final _that = this;
switch (_that) {
case _GetAppSettings() when getAppSettings != null:
return getAppSettings(_that);case _UpdateThemeMode() when updateAppThemeMode != null:
return updateAppThemeMode(_that);case _UpdateLocalization() when updateAppLocalization != null:
return updateAppLocalization(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getAppSettings,TResult Function( String themeMode)?  updateAppThemeMode,TResult Function( String locale)?  updateAppLocalization,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetAppSettings() when getAppSettings != null:
return getAppSettings();case _UpdateThemeMode() when updateAppThemeMode != null:
return updateAppThemeMode(_that.themeMode);case _UpdateLocalization() when updateAppLocalization != null:
return updateAppLocalization(_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getAppSettings,required TResult Function( String themeMode)  updateAppThemeMode,required TResult Function( String locale)  updateAppLocalization,}) {final _that = this;
switch (_that) {
case _GetAppSettings():
return getAppSettings();case _UpdateThemeMode():
return updateAppThemeMode(_that.themeMode);case _UpdateLocalization():
return updateAppLocalization(_that.locale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getAppSettings,TResult? Function( String themeMode)?  updateAppThemeMode,TResult? Function( String locale)?  updateAppLocalization,}) {final _that = this;
switch (_that) {
case _GetAppSettings() when getAppSettings != null:
return getAppSettings();case _UpdateThemeMode() when updateAppThemeMode != null:
return updateAppThemeMode(_that.themeMode);case _UpdateLocalization() when updateAppLocalization != null:
return updateAppLocalization(_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class _GetAppSettings implements SettingsEvent {
  const _GetAppSettings();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAppSettings);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.getAppSettings()';
}


}




/// @nodoc


class _UpdateThemeMode implements SettingsEvent {
  const _UpdateThemeMode({required this.themeMode});
  

 final  String themeMode;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateThemeModeCopyWith<_UpdateThemeMode> get copyWith => __$UpdateThemeModeCopyWithImpl<_UpdateThemeMode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateThemeMode&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'SettingsEvent.updateAppThemeMode(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$UpdateThemeModeCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$UpdateThemeModeCopyWith(_UpdateThemeMode value, $Res Function(_UpdateThemeMode) _then) = __$UpdateThemeModeCopyWithImpl;
@useResult
$Res call({
 String themeMode
});




}
/// @nodoc
class __$UpdateThemeModeCopyWithImpl<$Res>
    implements _$UpdateThemeModeCopyWith<$Res> {
  __$UpdateThemeModeCopyWithImpl(this._self, this._then);

  final _UpdateThemeMode _self;
  final $Res Function(_UpdateThemeMode) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? themeMode = null,}) {
  return _then(_UpdateThemeMode(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateLocalization implements SettingsEvent {
  const _UpdateLocalization({required this.locale});
  

 final  String locale;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateLocalizationCopyWith<_UpdateLocalization> get copyWith => __$UpdateLocalizationCopyWithImpl<_UpdateLocalization>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateLocalization&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'SettingsEvent.updateAppLocalization(locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$UpdateLocalizationCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$UpdateLocalizationCopyWith(_UpdateLocalization value, $Res Function(_UpdateLocalization) _then) = __$UpdateLocalizationCopyWithImpl;
@useResult
$Res call({
 String locale
});




}
/// @nodoc
class __$UpdateLocalizationCopyWithImpl<$Res>
    implements _$UpdateLocalizationCopyWith<$Res> {
  __$UpdateLocalizationCopyWithImpl(this._self, this._then);

  final _UpdateLocalization _self;
  final $Res Function(_UpdateLocalization) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(_UpdateLocalization(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SettingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState()';
}


}

/// @nodoc
class $SettingsStateCopyWith<$Res>  {
$SettingsStateCopyWith(SettingsState _, $Res Function(SettingsState) __);
}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SettingsInitial value)?  initial,TResult Function( _SettingsLoading value)?  loading,TResult Function( _SettingsSuccess value)?  success,TResult Function( _SettingsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsInitial() when initial != null:
return initial(_that);case _SettingsLoading() when loading != null:
return loading(_that);case _SettingsSuccess() when success != null:
return success(_that);case _SettingsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SettingsInitial value)  initial,required TResult Function( _SettingsLoading value)  loading,required TResult Function( _SettingsSuccess value)  success,required TResult Function( _SettingsError value)  error,}){
final _that = this;
switch (_that) {
case _SettingsInitial():
return initial(_that);case _SettingsLoading():
return loading(_that);case _SettingsSuccess():
return success(_that);case _SettingsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SettingsInitial value)?  initial,TResult? Function( _SettingsLoading value)?  loading,TResult? Function( _SettingsSuccess value)?  success,TResult? Function( _SettingsError value)?  error,}){
final _that = this;
switch (_that) {
case _SettingsInitial() when initial != null:
return initial(_that);case _SettingsLoading() when loading != null:
return loading(_that);case _SettingsSuccess() when success != null:
return success(_that);case _SettingsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AppSettings settings)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsInitial() when initial != null:
return initial();case _SettingsLoading() when loading != null:
return loading();case _SettingsSuccess() when success != null:
return success(_that.settings);case _SettingsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AppSettings settings)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _SettingsInitial():
return initial();case _SettingsLoading():
return loading();case _SettingsSuccess():
return success(_that.settings);case _SettingsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AppSettings settings)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _SettingsInitial() when initial != null:
return initial();case _SettingsLoading() when loading != null:
return loading();case _SettingsSuccess() when success != null:
return success(_that.settings);case _SettingsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsInitial implements SettingsState {
  const _SettingsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState.initial()';
}


}




/// @nodoc


class _SettingsLoading implements SettingsState {
  const _SettingsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState.loading()';
}


}




/// @nodoc


class _SettingsSuccess implements SettingsState {
  const _SettingsSuccess(this.settings);
  

 final  AppSettings settings;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsSuccessCopyWith<_SettingsSuccess> get copyWith => __$SettingsSuccessCopyWithImpl<_SettingsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsSuccess&&(identical(other.settings, settings) || other.settings == settings));
}


@override
int get hashCode => Object.hash(runtimeType,settings);

@override
String toString() {
  return 'SettingsState.success(settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$SettingsSuccessCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsSuccessCopyWith(_SettingsSuccess value, $Res Function(_SettingsSuccess) _then) = __$SettingsSuccessCopyWithImpl;
@useResult
$Res call({
 AppSettings settings
});




}
/// @nodoc
class __$SettingsSuccessCopyWithImpl<$Res>
    implements _$SettingsSuccessCopyWith<$Res> {
  __$SettingsSuccessCopyWithImpl(this._self, this._then);

  final _SettingsSuccess _self;
  final $Res Function(_SettingsSuccess) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? settings = null,}) {
  return _then(_SettingsSuccess(
null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppSettings,
  ));
}


}

/// @nodoc


class _SettingsError implements SettingsState {
  const _SettingsError(this.message);
  

 final  String message;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsErrorCopyWith<_SettingsError> get copyWith => __$SettingsErrorCopyWithImpl<_SettingsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SettingsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SettingsErrorCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsErrorCopyWith(_SettingsError value, $Res Function(_SettingsError) _then) = __$SettingsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SettingsErrorCopyWithImpl<$Res>
    implements _$SettingsErrorCopyWith<$Res> {
  __$SettingsErrorCopyWithImpl(this._self, this._then);

  final _SettingsError _self;
  final $Res Function(_SettingsError) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SettingsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
