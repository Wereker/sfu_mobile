// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_mark_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceMarkEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceMarkEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttendanceMarkEvent()';
}


}

/// @nodoc
class $AttendanceMarkEventCopyWith<$Res>  {
$AttendanceMarkEventCopyWith(AttendanceMarkEvent _, $Res Function(AttendanceMarkEvent) __);
}


/// Adds pattern-matching-related methods to [AttendanceMarkEvent].
extension AttendanceMarkEventPatterns on AttendanceMarkEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Scan value)?  scan,TResult Function( _LoadHistory value)?  loadHistory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Scan() when scan != null:
return scan(_that);case _LoadHistory() when loadHistory != null:
return loadHistory(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Scan value)  scan,required TResult Function( _LoadHistory value)  loadHistory,}){
final _that = this;
switch (_that) {
case _Scan():
return scan(_that);case _LoadHistory():
return loadHistory(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Scan value)?  scan,TResult? Function( _LoadHistory value)?  loadHistory,}){
final _that = this;
switch (_that) {
case _Scan() when scan != null:
return scan(_that);case _LoadHistory() when loadHistory != null:
return loadHistory(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String token)?  scan,TResult Function( int studentId)?  loadHistory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Scan() when scan != null:
return scan(_that.token);case _LoadHistory() when loadHistory != null:
return loadHistory(_that.studentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String token)  scan,required TResult Function( int studentId)  loadHistory,}) {final _that = this;
switch (_that) {
case _Scan():
return scan(_that.token);case _LoadHistory():
return loadHistory(_that.studentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String token)?  scan,TResult? Function( int studentId)?  loadHistory,}) {final _that = this;
switch (_that) {
case _Scan() when scan != null:
return scan(_that.token);case _LoadHistory() when loadHistory != null:
return loadHistory(_that.studentId);case _:
  return null;

}
}

}

/// @nodoc


class _Scan implements AttendanceMarkEvent {
  const _Scan(this.token);
  

 final  String token;

/// Create a copy of AttendanceMarkEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanCopyWith<_Scan> get copyWith => __$ScanCopyWithImpl<_Scan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scan&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'AttendanceMarkEvent.scan(token: $token)';
}


}

/// @nodoc
abstract mixin class _$ScanCopyWith<$Res> implements $AttendanceMarkEventCopyWith<$Res> {
  factory _$ScanCopyWith(_Scan value, $Res Function(_Scan) _then) = __$ScanCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class __$ScanCopyWithImpl<$Res>
    implements _$ScanCopyWith<$Res> {
  __$ScanCopyWithImpl(this._self, this._then);

  final _Scan _self;
  final $Res Function(_Scan) _then;

/// Create a copy of AttendanceMarkEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_Scan(
null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadHistory implements AttendanceMarkEvent {
  const _LoadHistory(this.studentId);
  

 final  int studentId;

/// Create a copy of AttendanceMarkEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadHistoryCopyWith<_LoadHistory> get copyWith => __$LoadHistoryCopyWithImpl<_LoadHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadHistory&&(identical(other.studentId, studentId) || other.studentId == studentId));
}


@override
int get hashCode => Object.hash(runtimeType,studentId);

@override
String toString() {
  return 'AttendanceMarkEvent.loadHistory(studentId: $studentId)';
}


}

/// @nodoc
abstract mixin class _$LoadHistoryCopyWith<$Res> implements $AttendanceMarkEventCopyWith<$Res> {
  factory _$LoadHistoryCopyWith(_LoadHistory value, $Res Function(_LoadHistory) _then) = __$LoadHistoryCopyWithImpl;
@useResult
$Res call({
 int studentId
});




}
/// @nodoc
class __$LoadHistoryCopyWithImpl<$Res>
    implements _$LoadHistoryCopyWith<$Res> {
  __$LoadHistoryCopyWithImpl(this._self, this._then);

  final _LoadHistory _self;
  final $Res Function(_LoadHistory) _then;

/// Create a copy of AttendanceMarkEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? studentId = null,}) {
  return _then(_LoadHistory(
null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$AttendanceMarkState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceMarkState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttendanceMarkState()';
}


}

/// @nodoc
class $AttendanceMarkStateCopyWith<$Res>  {
$AttendanceMarkStateCopyWith(AttendanceMarkState _, $Res Function(AttendanceMarkState) __);
}


/// Adds pattern-matching-related methods to [AttendanceMarkState].
extension AttendanceMarkStatePatterns on AttendanceMarkState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Marking value)?  marking,TResult Function( _MarkSuccess value)?  markSuccess,TResult Function( _HistoryLoading value)?  historyLoading,TResult Function( _HistorySuccess value)?  historySuccess,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Marking() when marking != null:
return marking(_that);case _MarkSuccess() when markSuccess != null:
return markSuccess(_that);case _HistoryLoading() when historyLoading != null:
return historyLoading(_that);case _HistorySuccess() when historySuccess != null:
return historySuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Marking value)  marking,required TResult Function( _MarkSuccess value)  markSuccess,required TResult Function( _HistoryLoading value)  historyLoading,required TResult Function( _HistorySuccess value)  historySuccess,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Marking():
return marking(_that);case _MarkSuccess():
return markSuccess(_that);case _HistoryLoading():
return historyLoading(_that);case _HistorySuccess():
return historySuccess(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Marking value)?  marking,TResult? Function( _MarkSuccess value)?  markSuccess,TResult? Function( _HistoryLoading value)?  historyLoading,TResult? Function( _HistorySuccess value)?  historySuccess,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Marking() when marking != null:
return marking(_that);case _MarkSuccess() when markSuccess != null:
return markSuccess(_that);case _HistoryLoading() when historyLoading != null:
return historyLoading(_that);case _HistorySuccess() when historySuccess != null:
return historySuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  marking,TResult Function( AttendanceRecord record)?  markSuccess,TResult Function()?  historyLoading,TResult Function( List<AttendanceRecord> records)?  historySuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Marking() when marking != null:
return marking();case _MarkSuccess() when markSuccess != null:
return markSuccess(_that.record);case _HistoryLoading() when historyLoading != null:
return historyLoading();case _HistorySuccess() when historySuccess != null:
return historySuccess(_that.records);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  marking,required TResult Function( AttendanceRecord record)  markSuccess,required TResult Function()  historyLoading,required TResult Function( List<AttendanceRecord> records)  historySuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Marking():
return marking();case _MarkSuccess():
return markSuccess(_that.record);case _HistoryLoading():
return historyLoading();case _HistorySuccess():
return historySuccess(_that.records);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  marking,TResult? Function( AttendanceRecord record)?  markSuccess,TResult? Function()?  historyLoading,TResult? Function( List<AttendanceRecord> records)?  historySuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Marking() when marking != null:
return marking();case _MarkSuccess() when markSuccess != null:
return markSuccess(_that.record);case _HistoryLoading() when historyLoading != null:
return historyLoading();case _HistorySuccess() when historySuccess != null:
return historySuccess(_that.records);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AttendanceMarkState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttendanceMarkState.initial()';
}


}




/// @nodoc


class _Marking implements AttendanceMarkState {
  const _Marking();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Marking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttendanceMarkState.marking()';
}


}




/// @nodoc


class _MarkSuccess implements AttendanceMarkState {
  const _MarkSuccess(this.record);
  

 final  AttendanceRecord record;

/// Create a copy of AttendanceMarkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkSuccessCopyWith<_MarkSuccess> get copyWith => __$MarkSuccessCopyWithImpl<_MarkSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkSuccess&&(identical(other.record, record) || other.record == record));
}


@override
int get hashCode => Object.hash(runtimeType,record);

@override
String toString() {
  return 'AttendanceMarkState.markSuccess(record: $record)';
}


}

/// @nodoc
abstract mixin class _$MarkSuccessCopyWith<$Res> implements $AttendanceMarkStateCopyWith<$Res> {
  factory _$MarkSuccessCopyWith(_MarkSuccess value, $Res Function(_MarkSuccess) _then) = __$MarkSuccessCopyWithImpl;
@useResult
$Res call({
 AttendanceRecord record
});


$AttendanceRecordCopyWith<$Res> get record;

}
/// @nodoc
class __$MarkSuccessCopyWithImpl<$Res>
    implements _$MarkSuccessCopyWith<$Res> {
  __$MarkSuccessCopyWithImpl(this._self, this._then);

  final _MarkSuccess _self;
  final $Res Function(_MarkSuccess) _then;

/// Create a copy of AttendanceMarkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? record = null,}) {
  return _then(_MarkSuccess(
null == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as AttendanceRecord,
  ));
}

/// Create a copy of AttendanceMarkState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceRecordCopyWith<$Res> get record {
  
  return $AttendanceRecordCopyWith<$Res>(_self.record, (value) {
    return _then(_self.copyWith(record: value));
  });
}
}

/// @nodoc


class _HistoryLoading implements AttendanceMarkState {
  const _HistoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttendanceMarkState.historyLoading()';
}


}




/// @nodoc


class _HistorySuccess implements AttendanceMarkState {
  const _HistorySuccess(final  List<AttendanceRecord> records): _records = records;
  

 final  List<AttendanceRecord> _records;
 List<AttendanceRecord> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}


/// Create a copy of AttendanceMarkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistorySuccessCopyWith<_HistorySuccess> get copyWith => __$HistorySuccessCopyWithImpl<_HistorySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistorySuccess&&const DeepCollectionEquality().equals(other._records, _records));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_records));

@override
String toString() {
  return 'AttendanceMarkState.historySuccess(records: $records)';
}


}

/// @nodoc
abstract mixin class _$HistorySuccessCopyWith<$Res> implements $AttendanceMarkStateCopyWith<$Res> {
  factory _$HistorySuccessCopyWith(_HistorySuccess value, $Res Function(_HistorySuccess) _then) = __$HistorySuccessCopyWithImpl;
@useResult
$Res call({
 List<AttendanceRecord> records
});




}
/// @nodoc
class __$HistorySuccessCopyWithImpl<$Res>
    implements _$HistorySuccessCopyWith<$Res> {
  __$HistorySuccessCopyWithImpl(this._self, this._then);

  final _HistorySuccess _self;
  final $Res Function(_HistorySuccess) _then;

/// Create a copy of AttendanceMarkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? records = null,}) {
  return _then(_HistorySuccess(
null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<AttendanceRecord>,
  ));
}


}

/// @nodoc


class _Error implements AttendanceMarkState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of AttendanceMarkState
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
  return 'AttendanceMarkState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AttendanceMarkStateCopyWith<$Res> {
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

/// Create a copy of AttendanceMarkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
