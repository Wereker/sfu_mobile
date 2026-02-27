// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthSignIn value)?  signIn,TResult Function( _AuthResetPassword value)?  resetPassword,TResult Function( _AuthSignUp value)?  signUp,TResult Function( _AuthLogout value)?  logout,TResult Function( _AuthCheckAuthStatus value)?  checkAuthStatus,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthSignIn() when signIn != null:
return signIn(_that);case _AuthResetPassword() when resetPassword != null:
return resetPassword(_that);case _AuthSignUp() when signUp != null:
return signUp(_that);case _AuthLogout() when logout != null:
return logout(_that);case _AuthCheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthSignIn value)  signIn,required TResult Function( _AuthResetPassword value)  resetPassword,required TResult Function( _AuthSignUp value)  signUp,required TResult Function( _AuthLogout value)  logout,required TResult Function( _AuthCheckAuthStatus value)  checkAuthStatus,}){
final _that = this;
switch (_that) {
case _AuthSignIn():
return signIn(_that);case _AuthResetPassword():
return resetPassword(_that);case _AuthSignUp():
return signUp(_that);case _AuthLogout():
return logout(_that);case _AuthCheckAuthStatus():
return checkAuthStatus(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthSignIn value)?  signIn,TResult? Function( _AuthResetPassword value)?  resetPassword,TResult? Function( _AuthSignUp value)?  signUp,TResult? Function( _AuthLogout value)?  logout,TResult? Function( _AuthCheckAuthStatus value)?  checkAuthStatus,}){
final _that = this;
switch (_that) {
case _AuthSignIn() when signIn != null:
return signIn(_that);case _AuthResetPassword() when resetPassword != null:
return resetPassword(_that);case _AuthSignUp() when signUp != null:
return signUp(_that);case _AuthLogout() when logout != null:
return logout(_that);case _AuthCheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  signIn,TResult Function( String newPassword)?  resetPassword,TResult Function( String email,  String password1,  String password2,  String name,  String role,  String group)?  signUp,TResult Function()?  logout,TResult Function()?  checkAuthStatus,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthSignIn() when signIn != null:
return signIn(_that.email,_that.password);case _AuthResetPassword() when resetPassword != null:
return resetPassword(_that.newPassword);case _AuthSignUp() when signUp != null:
return signUp(_that.email,_that.password1,_that.password2,_that.name,_that.role,_that.group);case _AuthLogout() when logout != null:
return logout();case _AuthCheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  signIn,required TResult Function( String newPassword)  resetPassword,required TResult Function( String email,  String password1,  String password2,  String name,  String role,  String group)  signUp,required TResult Function()  logout,required TResult Function()  checkAuthStatus,}) {final _that = this;
switch (_that) {
case _AuthSignIn():
return signIn(_that.email,_that.password);case _AuthResetPassword():
return resetPassword(_that.newPassword);case _AuthSignUp():
return signUp(_that.email,_that.password1,_that.password2,_that.name,_that.role,_that.group);case _AuthLogout():
return logout();case _AuthCheckAuthStatus():
return checkAuthStatus();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  signIn,TResult? Function( String newPassword)?  resetPassword,TResult? Function( String email,  String password1,  String password2,  String name,  String role,  String group)?  signUp,TResult? Function()?  logout,TResult? Function()?  checkAuthStatus,}) {final _that = this;
switch (_that) {
case _AuthSignIn() when signIn != null:
return signIn(_that.email,_that.password);case _AuthResetPassword() when resetPassword != null:
return resetPassword(_that.newPassword);case _AuthSignUp() when signUp != null:
return signUp(_that.email,_that.password1,_that.password2,_that.name,_that.role,_that.group);case _AuthLogout() when logout != null:
return logout();case _AuthCheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case _:
  return null;

}
}

}

/// @nodoc


class _AuthSignIn implements AuthEvent {
  const _AuthSignIn({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSignInCopyWith<_AuthSignIn> get copyWith => __$AuthSignInCopyWithImpl<_AuthSignIn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSignIn&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.signIn(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$AuthSignInCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AuthSignInCopyWith(_AuthSignIn value, $Res Function(_AuthSignIn) _then) = __$AuthSignInCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$AuthSignInCopyWithImpl<$Res>
    implements _$AuthSignInCopyWith<$Res> {
  __$AuthSignInCopyWithImpl(this._self, this._then);

  final _AuthSignIn _self;
  final $Res Function(_AuthSignIn) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_AuthSignIn(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AuthResetPassword implements AuthEvent {
  const _AuthResetPassword({required this.newPassword});
  

 final  String newPassword;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResetPasswordCopyWith<_AuthResetPassword> get copyWith => __$AuthResetPasswordCopyWithImpl<_AuthResetPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResetPassword&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,newPassword);

@override
String toString() {
  return 'AuthEvent.resetPassword(newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$AuthResetPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AuthResetPasswordCopyWith(_AuthResetPassword value, $Res Function(_AuthResetPassword) _then) = __$AuthResetPasswordCopyWithImpl;
@useResult
$Res call({
 String newPassword
});




}
/// @nodoc
class __$AuthResetPasswordCopyWithImpl<$Res>
    implements _$AuthResetPasswordCopyWith<$Res> {
  __$AuthResetPasswordCopyWithImpl(this._self, this._then);

  final _AuthResetPassword _self;
  final $Res Function(_AuthResetPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newPassword = null,}) {
  return _then(_AuthResetPassword(
newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AuthSignUp implements AuthEvent {
  const _AuthSignUp({required this.email, required this.password1, required this.password2, required this.name, required this.role, required this.group});
  

 final  String email;
 final  String password1;
 final  String password2;
 final  String name;
 final  String role;
 final  String group;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSignUpCopyWith<_AuthSignUp> get copyWith => __$AuthSignUpCopyWithImpl<_AuthSignUp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSignUp&&(identical(other.email, email) || other.email == email)&&(identical(other.password1, password1) || other.password1 == password1)&&(identical(other.password2, password2) || other.password2 == password2)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,email,password1,password2,name,role,group);

@override
String toString() {
  return 'AuthEvent.signUp(email: $email, password1: $password1, password2: $password2, name: $name, role: $role, group: $group)';
}


}

/// @nodoc
abstract mixin class _$AuthSignUpCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AuthSignUpCopyWith(_AuthSignUp value, $Res Function(_AuthSignUp) _then) = __$AuthSignUpCopyWithImpl;
@useResult
$Res call({
 String email, String password1, String password2, String name, String role, String group
});




}
/// @nodoc
class __$AuthSignUpCopyWithImpl<$Res>
    implements _$AuthSignUpCopyWith<$Res> {
  __$AuthSignUpCopyWithImpl(this._self, this._then);

  final _AuthSignUp _self;
  final $Res Function(_AuthSignUp) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password1 = null,Object? password2 = null,Object? name = null,Object? role = null,Object? group = null,}) {
  return _then(_AuthSignUp(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password1: null == password1 ? _self.password1 : password1 // ignore: cast_nullable_to_non_nullable
as String,password2: null == password2 ? _self.password2 : password2 // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AuthLogout implements AuthEvent {
  const _AuthLogout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLogout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logout()';
}


}




/// @nodoc


class _AuthCheckAuthStatus implements AuthEvent {
  const _AuthCheckAuthStatus();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthCheckAuthStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkAuthStatus()';
}


}




/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthInitial value)?  initial,TResult Function( _AuthLoading value)?  loading,TResult Function( _AuthUnauthorized value)?  unauthorized,TResult Function( _AuthAuthorized value)?  authorized,TResult Function( _AuthError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial(_that);case _AuthLoading() when loading != null:
return loading(_that);case _AuthUnauthorized() when unauthorized != null:
return unauthorized(_that);case _AuthAuthorized() when authorized != null:
return authorized(_that);case _AuthError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthInitial value)  initial,required TResult Function( _AuthLoading value)  loading,required TResult Function( _AuthUnauthorized value)  unauthorized,required TResult Function( _AuthAuthorized value)  authorized,required TResult Function( _AuthError value)  error,}){
final _that = this;
switch (_that) {
case _AuthInitial():
return initial(_that);case _AuthLoading():
return loading(_that);case _AuthUnauthorized():
return unauthorized(_that);case _AuthAuthorized():
return authorized(_that);case _AuthError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthInitial value)?  initial,TResult? Function( _AuthLoading value)?  loading,TResult? Function( _AuthUnauthorized value)?  unauthorized,TResult? Function( _AuthAuthorized value)?  authorized,TResult? Function( _AuthError value)?  error,}){
final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial(_that);case _AuthLoading() when loading != null:
return loading(_that);case _AuthUnauthorized() when unauthorized != null:
return unauthorized(_that);case _AuthAuthorized() when authorized != null:
return authorized(_that);case _AuthError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  unauthorized,TResult Function()?  authorized,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial();case _AuthLoading() when loading != null:
return loading();case _AuthUnauthorized() when unauthorized != null:
return unauthorized();case _AuthAuthorized() when authorized != null:
return authorized();case _AuthError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  unauthorized,required TResult Function()  authorized,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _AuthInitial():
return initial();case _AuthLoading():
return loading();case _AuthUnauthorized():
return unauthorized();case _AuthAuthorized():
return authorized();case _AuthError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  unauthorized,TResult? Function()?  authorized,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial();case _AuthLoading() when loading != null:
return loading();case _AuthUnauthorized() when unauthorized != null:
return unauthorized();case _AuthAuthorized() when authorized != null:
return authorized();case _AuthError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AuthInitial implements AuthState {
  const _AuthInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _AuthLoading implements AuthState {
  const _AuthLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _AuthUnauthorized implements AuthState {
  const _AuthUnauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUnauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.unauthorized()';
}


}




/// @nodoc


class _AuthAuthorized implements AuthState {
  const _AuthAuthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthAuthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.authorized()';
}


}




/// @nodoc


class _AuthError implements AuthState {
  const _AuthError({required this.error});
  

 final  String error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthErrorCopyWith<_AuthError> get copyWith => __$AuthErrorCopyWithImpl<_AuthError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AuthState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$AuthErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthErrorCopyWith(_AuthError value, $Res Function(_AuthError) _then) = __$AuthErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$AuthErrorCopyWithImpl<$Res>
    implements _$AuthErrorCopyWith<$Res> {
  __$AuthErrorCopyWithImpl(this._self, this._then);

  final _AuthError _self;
  final $Res Function(_AuthError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_AuthError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
