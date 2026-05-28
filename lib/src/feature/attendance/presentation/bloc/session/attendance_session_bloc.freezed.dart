// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceSessionEvent {

 int get lessonId;
/// Create a copy of AttendanceSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceSessionEventCopyWith<AttendanceSessionEvent> get copyWith => _$AttendanceSessionEventCopyWithImpl<AttendanceSessionEvent>(this as AttendanceSessionEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceSessionEvent&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId));
}


@override
int get hashCode => Object.hash(runtimeType,lessonId);

@override
String toString() {
  return 'AttendanceSessionEvent(lessonId: $lessonId)';
}


}

/// @nodoc
abstract mixin class $AttendanceSessionEventCopyWith<$Res>  {
  factory $AttendanceSessionEventCopyWith(AttendanceSessionEvent value, $Res Function(AttendanceSessionEvent) _then) = _$AttendanceSessionEventCopyWithImpl;
@useResult
$Res call({
 int lessonId
});




}
/// @nodoc
class _$AttendanceSessionEventCopyWithImpl<$Res>
    implements $AttendanceSessionEventCopyWith<$Res> {
  _$AttendanceSessionEventCopyWithImpl(this._self, this._then);

  final AttendanceSessionEvent _self;
  final $Res Function(AttendanceSessionEvent) _then;

/// Create a copy of AttendanceSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lessonId = null,}) {
  return _then(_self.copyWith(
lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceSessionEvent].
extension AttendanceSessionEventPatterns on AttendanceSessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateSession value)?  createSession,TResult Function( _LoadStudents value)?  loadStudents,TResult Function( _MarkManual value)?  markManual,TResult Function( _Refresh value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSession() when createSession != null:
return createSession(_that);case _LoadStudents() when loadStudents != null:
return loadStudents(_that);case _MarkManual() when markManual != null:
return markManual(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateSession value)  createSession,required TResult Function( _LoadStudents value)  loadStudents,required TResult Function( _MarkManual value)  markManual,required TResult Function( _Refresh value)  refresh,}){
final _that = this;
switch (_that) {
case _CreateSession():
return createSession(_that);case _LoadStudents():
return loadStudents(_that);case _MarkManual():
return markManual(_that);case _Refresh():
return refresh(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateSession value)?  createSession,TResult? Function( _LoadStudents value)?  loadStudents,TResult? Function( _MarkManual value)?  markManual,TResult? Function( _Refresh value)?  refresh,}){
final _that = this;
switch (_that) {
case _CreateSession() when createSession != null:
return createSession(_that);case _LoadStudents() when loadStudents != null:
return loadStudents(_that);case _MarkManual() when markManual != null:
return markManual(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int lessonId)?  createSession,TResult Function( int lessonId)?  loadStudents,TResult Function( int lessonId,  int studentId)?  markManual,TResult Function( int lessonId)?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSession() when createSession != null:
return createSession(_that.lessonId);case _LoadStudents() when loadStudents != null:
return loadStudents(_that.lessonId);case _MarkManual() when markManual != null:
return markManual(_that.lessonId,_that.studentId);case _Refresh() when refresh != null:
return refresh(_that.lessonId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int lessonId)  createSession,required TResult Function( int lessonId)  loadStudents,required TResult Function( int lessonId,  int studentId)  markManual,required TResult Function( int lessonId)  refresh,}) {final _that = this;
switch (_that) {
case _CreateSession():
return createSession(_that.lessonId);case _LoadStudents():
return loadStudents(_that.lessonId);case _MarkManual():
return markManual(_that.lessonId,_that.studentId);case _Refresh():
return refresh(_that.lessonId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int lessonId)?  createSession,TResult? Function( int lessonId)?  loadStudents,TResult? Function( int lessonId,  int studentId)?  markManual,TResult? Function( int lessonId)?  refresh,}) {final _that = this;
switch (_that) {
case _CreateSession() when createSession != null:
return createSession(_that.lessonId);case _LoadStudents() when loadStudents != null:
return loadStudents(_that.lessonId);case _MarkManual() when markManual != null:
return markManual(_that.lessonId,_that.studentId);case _Refresh() when refresh != null:
return refresh(_that.lessonId);case _:
  return null;

}
}

}

/// @nodoc


class _CreateSession implements AttendanceSessionEvent {
  const _CreateSession(this.lessonId);
  

@override final  int lessonId;

/// Create a copy of AttendanceSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSessionCopyWith<_CreateSession> get copyWith => __$CreateSessionCopyWithImpl<_CreateSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSession&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId));
}


@override
int get hashCode => Object.hash(runtimeType,lessonId);

@override
String toString() {
  return 'AttendanceSessionEvent.createSession(lessonId: $lessonId)';
}


}

/// @nodoc
abstract mixin class _$CreateSessionCopyWith<$Res> implements $AttendanceSessionEventCopyWith<$Res> {
  factory _$CreateSessionCopyWith(_CreateSession value, $Res Function(_CreateSession) _then) = __$CreateSessionCopyWithImpl;
@override @useResult
$Res call({
 int lessonId
});




}
/// @nodoc
class __$CreateSessionCopyWithImpl<$Res>
    implements _$CreateSessionCopyWith<$Res> {
  __$CreateSessionCopyWithImpl(this._self, this._then);

  final _CreateSession _self;
  final $Res Function(_CreateSession) _then;

/// Create a copy of AttendanceSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lessonId = null,}) {
  return _then(_CreateSession(
null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _LoadStudents implements AttendanceSessionEvent {
  const _LoadStudents(this.lessonId);
  

@override final  int lessonId;

/// Create a copy of AttendanceSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadStudentsCopyWith<_LoadStudents> get copyWith => __$LoadStudentsCopyWithImpl<_LoadStudents>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadStudents&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId));
}


@override
int get hashCode => Object.hash(runtimeType,lessonId);

@override
String toString() {
  return 'AttendanceSessionEvent.loadStudents(lessonId: $lessonId)';
}


}

/// @nodoc
abstract mixin class _$LoadStudentsCopyWith<$Res> implements $AttendanceSessionEventCopyWith<$Res> {
  factory _$LoadStudentsCopyWith(_LoadStudents value, $Res Function(_LoadStudents) _then) = __$LoadStudentsCopyWithImpl;
@override @useResult
$Res call({
 int lessonId
});




}
/// @nodoc
class __$LoadStudentsCopyWithImpl<$Res>
    implements _$LoadStudentsCopyWith<$Res> {
  __$LoadStudentsCopyWithImpl(this._self, this._then);

  final _LoadStudents _self;
  final $Res Function(_LoadStudents) _then;

/// Create a copy of AttendanceSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lessonId = null,}) {
  return _then(_LoadStudents(
null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _MarkManual implements AttendanceSessionEvent {
  const _MarkManual({required this.lessonId, required this.studentId});
  

@override final  int lessonId;
 final  int studentId;

/// Create a copy of AttendanceSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkManualCopyWith<_MarkManual> get copyWith => __$MarkManualCopyWithImpl<_MarkManual>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkManual&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.studentId, studentId) || other.studentId == studentId));
}


@override
int get hashCode => Object.hash(runtimeType,lessonId,studentId);

@override
String toString() {
  return 'AttendanceSessionEvent.markManual(lessonId: $lessonId, studentId: $studentId)';
}


}

/// @nodoc
abstract mixin class _$MarkManualCopyWith<$Res> implements $AttendanceSessionEventCopyWith<$Res> {
  factory _$MarkManualCopyWith(_MarkManual value, $Res Function(_MarkManual) _then) = __$MarkManualCopyWithImpl;
@override @useResult
$Res call({
 int lessonId, int studentId
});




}
/// @nodoc
class __$MarkManualCopyWithImpl<$Res>
    implements _$MarkManualCopyWith<$Res> {
  __$MarkManualCopyWithImpl(this._self, this._then);

  final _MarkManual _self;
  final $Res Function(_MarkManual) _then;

/// Create a copy of AttendanceSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lessonId = null,Object? studentId = null,}) {
  return _then(_MarkManual(
lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Refresh implements AttendanceSessionEvent {
  const _Refresh(this.lessonId);
  

@override final  int lessonId;

/// Create a copy of AttendanceSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshCopyWith<_Refresh> get copyWith => __$RefreshCopyWithImpl<_Refresh>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId));
}


@override
int get hashCode => Object.hash(runtimeType,lessonId);

@override
String toString() {
  return 'AttendanceSessionEvent.refresh(lessonId: $lessonId)';
}


}

/// @nodoc
abstract mixin class _$RefreshCopyWith<$Res> implements $AttendanceSessionEventCopyWith<$Res> {
  factory _$RefreshCopyWith(_Refresh value, $Res Function(_Refresh) _then) = __$RefreshCopyWithImpl;
@override @useResult
$Res call({
 int lessonId
});




}
/// @nodoc
class __$RefreshCopyWithImpl<$Res>
    implements _$RefreshCopyWith<$Res> {
  __$RefreshCopyWithImpl(this._self, this._then);

  final _Refresh _self;
  final $Res Function(_Refresh) _then;

/// Create a copy of AttendanceSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lessonId = null,}) {
  return _then(_Refresh(
null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$AttendanceSessionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceSessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttendanceSessionState()';
}


}

/// @nodoc
class $AttendanceSessionStateCopyWith<$Res>  {
$AttendanceSessionStateCopyWith(AttendanceSessionState _, $Res Function(AttendanceSessionState) __);
}


/// Adds pattern-matching-related methods to [AttendanceSessionState].
extension AttendanceSessionStatePatterns on AttendanceSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _SessionLoading value)?  sessionLoading,TResult Function( _SessionReady value)?  sessionReady,TResult Function( _StudentsLoading value)?  studentsLoading,TResult Function( _StudentsSuccess value)?  studentsSuccess,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SessionLoading() when sessionLoading != null:
return sessionLoading(_that);case _SessionReady() when sessionReady != null:
return sessionReady(_that);case _StudentsLoading() when studentsLoading != null:
return studentsLoading(_that);case _StudentsSuccess() when studentsSuccess != null:
return studentsSuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _SessionLoading value)  sessionLoading,required TResult Function( _SessionReady value)  sessionReady,required TResult Function( _StudentsLoading value)  studentsLoading,required TResult Function( _StudentsSuccess value)  studentsSuccess,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _SessionLoading():
return sessionLoading(_that);case _SessionReady():
return sessionReady(_that);case _StudentsLoading():
return studentsLoading(_that);case _StudentsSuccess():
return studentsSuccess(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _SessionLoading value)?  sessionLoading,TResult? Function( _SessionReady value)?  sessionReady,TResult? Function( _StudentsLoading value)?  studentsLoading,TResult? Function( _StudentsSuccess value)?  studentsSuccess,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SessionLoading() when sessionLoading != null:
return sessionLoading(_that);case _SessionReady() when sessionReady != null:
return sessionReady(_that);case _StudentsLoading() when studentsLoading != null:
return studentsLoading(_that);case _StudentsSuccess() when studentsSuccess != null:
return studentsSuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  sessionLoading,TResult Function( AttendanceSession session)?  sessionReady,TResult Function()?  studentsLoading,TResult Function( AttendanceSession? session,  List<AttendanceStudent> students)?  studentsSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SessionLoading() when sessionLoading != null:
return sessionLoading();case _SessionReady() when sessionReady != null:
return sessionReady(_that.session);case _StudentsLoading() when studentsLoading != null:
return studentsLoading();case _StudentsSuccess() when studentsSuccess != null:
return studentsSuccess(_that.session,_that.students);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  sessionLoading,required TResult Function( AttendanceSession session)  sessionReady,required TResult Function()  studentsLoading,required TResult Function( AttendanceSession? session,  List<AttendanceStudent> students)  studentsSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _SessionLoading():
return sessionLoading();case _SessionReady():
return sessionReady(_that.session);case _StudentsLoading():
return studentsLoading();case _StudentsSuccess():
return studentsSuccess(_that.session,_that.students);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  sessionLoading,TResult? Function( AttendanceSession session)?  sessionReady,TResult? Function()?  studentsLoading,TResult? Function( AttendanceSession? session,  List<AttendanceStudent> students)?  studentsSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SessionLoading() when sessionLoading != null:
return sessionLoading();case _SessionReady() when sessionReady != null:
return sessionReady(_that.session);case _StudentsLoading() when studentsLoading != null:
return studentsLoading();case _StudentsSuccess() when studentsSuccess != null:
return studentsSuccess(_that.session,_that.students);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AttendanceSessionState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttendanceSessionState.initial()';
}


}




/// @nodoc


class _SessionLoading implements AttendanceSessionState {
  const _SessionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttendanceSessionState.sessionLoading()';
}


}




/// @nodoc


class _SessionReady implements AttendanceSessionState {
  const _SessionReady(this.session);
  

 final  AttendanceSession session;

/// Create a copy of AttendanceSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionReadyCopyWith<_SessionReady> get copyWith => __$SessionReadyCopyWithImpl<_SessionReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionReady&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'AttendanceSessionState.sessionReady(session: $session)';
}


}

/// @nodoc
abstract mixin class _$SessionReadyCopyWith<$Res> implements $AttendanceSessionStateCopyWith<$Res> {
  factory _$SessionReadyCopyWith(_SessionReady value, $Res Function(_SessionReady) _then) = __$SessionReadyCopyWithImpl;
@useResult
$Res call({
 AttendanceSession session
});


$AttendanceSessionCopyWith<$Res> get session;

}
/// @nodoc
class __$SessionReadyCopyWithImpl<$Res>
    implements _$SessionReadyCopyWith<$Res> {
  __$SessionReadyCopyWithImpl(this._self, this._then);

  final _SessionReady _self;
  final $Res Function(_SessionReady) _then;

/// Create a copy of AttendanceSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(_SessionReady(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AttendanceSession,
  ));
}

/// Create a copy of AttendanceSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceSessionCopyWith<$Res> get session {
  
  return $AttendanceSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc


class _StudentsLoading implements AttendanceSessionState {
  const _StudentsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttendanceSessionState.studentsLoading()';
}


}




/// @nodoc


class _StudentsSuccess implements AttendanceSessionState {
  const _StudentsSuccess({this.session, required final  List<AttendanceStudent> students}): _students = students;
  

 final  AttendanceSession? session;
 final  List<AttendanceStudent> _students;
 List<AttendanceStudent> get students {
  if (_students is EqualUnmodifiableListView) return _students;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_students);
}


/// Create a copy of AttendanceSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentsSuccessCopyWith<_StudentsSuccess> get copyWith => __$StudentsSuccessCopyWithImpl<_StudentsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentsSuccess&&(identical(other.session, session) || other.session == session)&&const DeepCollectionEquality().equals(other._students, _students));
}


@override
int get hashCode => Object.hash(runtimeType,session,const DeepCollectionEquality().hash(_students));

@override
String toString() {
  return 'AttendanceSessionState.studentsSuccess(session: $session, students: $students)';
}


}

/// @nodoc
abstract mixin class _$StudentsSuccessCopyWith<$Res> implements $AttendanceSessionStateCopyWith<$Res> {
  factory _$StudentsSuccessCopyWith(_StudentsSuccess value, $Res Function(_StudentsSuccess) _then) = __$StudentsSuccessCopyWithImpl;
@useResult
$Res call({
 AttendanceSession? session, List<AttendanceStudent> students
});


$AttendanceSessionCopyWith<$Res>? get session;

}
/// @nodoc
class __$StudentsSuccessCopyWithImpl<$Res>
    implements _$StudentsSuccessCopyWith<$Res> {
  __$StudentsSuccessCopyWithImpl(this._self, this._then);

  final _StudentsSuccess _self;
  final $Res Function(_StudentsSuccess) _then;

/// Create a copy of AttendanceSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = freezed,Object? students = null,}) {
  return _then(_StudentsSuccess(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AttendanceSession?,students: null == students ? _self._students : students // ignore: cast_nullable_to_non_nullable
as List<AttendanceStudent>,
  ));
}

/// Create a copy of AttendanceSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $AttendanceSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc


class _Error implements AttendanceSessionState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of AttendanceSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AttendanceSessionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AttendanceSessionStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AttendanceSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
