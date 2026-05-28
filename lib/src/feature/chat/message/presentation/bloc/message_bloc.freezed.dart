// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MessageEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageEvent()';
}


}

/// @nodoc
class $MessageEventCopyWith<$Res>  {
$MessageEventCopyWith(MessageEvent _, $Res Function(MessageEvent) __);
}


/// Adds pattern-matching-related methods to [MessageEvent].
extension MessageEventPatterns on MessageEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Connect value)?  connect,TResult Function( _Send value)?  send,TResult Function( _Disconnect value)?  disconnect,TResult Function( _MessageReceived value)?  messageReceived,TResult Function( _WsError value)?  wsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _Send() when send != null:
return send(_that);case _Disconnect() when disconnect != null:
return disconnect(_that);case _MessageReceived() when messageReceived != null:
return messageReceived(_that);case _WsError() when wsError != null:
return wsError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Connect value)  connect,required TResult Function( _Send value)  send,required TResult Function( _Disconnect value)  disconnect,required TResult Function( _MessageReceived value)  messageReceived,required TResult Function( _WsError value)  wsError,}){
final _that = this;
switch (_that) {
case _Connect():
return connect(_that);case _Send():
return send(_that);case _Disconnect():
return disconnect(_that);case _MessageReceived():
return messageReceived(_that);case _WsError():
return wsError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Connect value)?  connect,TResult? Function( _Send value)?  send,TResult? Function( _Disconnect value)?  disconnect,TResult? Function( _MessageReceived value)?  messageReceived,TResult? Function( _WsError value)?  wsError,}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _Send() when send != null:
return send(_that);case _Disconnect() when disconnect != null:
return disconnect(_that);case _MessageReceived() when messageReceived != null:
return messageReceived(_that);case _WsError() when wsError != null:
return wsError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int chatId)?  connect,TResult Function( String text)?  send,TResult Function()?  disconnect,TResult Function( Message message)?  messageReceived,TResult Function( String error)?  wsError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that.chatId);case _Send() when send != null:
return send(_that.text);case _Disconnect() when disconnect != null:
return disconnect();case _MessageReceived() when messageReceived != null:
return messageReceived(_that.message);case _WsError() when wsError != null:
return wsError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int chatId)  connect,required TResult Function( String text)  send,required TResult Function()  disconnect,required TResult Function( Message message)  messageReceived,required TResult Function( String error)  wsError,}) {final _that = this;
switch (_that) {
case _Connect():
return connect(_that.chatId);case _Send():
return send(_that.text);case _Disconnect():
return disconnect();case _MessageReceived():
return messageReceived(_that.message);case _WsError():
return wsError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int chatId)?  connect,TResult? Function( String text)?  send,TResult? Function()?  disconnect,TResult? Function( Message message)?  messageReceived,TResult? Function( String error)?  wsError,}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that.chatId);case _Send() when send != null:
return send(_that.text);case _Disconnect() when disconnect != null:
return disconnect();case _MessageReceived() when messageReceived != null:
return messageReceived(_that.message);case _WsError() when wsError != null:
return wsError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Connect implements MessageEvent {
  const _Connect(this.chatId);
  

 final  int chatId;

/// Create a copy of MessageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectCopyWith<_Connect> get copyWith => __$ConnectCopyWithImpl<_Connect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connect&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,chatId);

@override
String toString() {
  return 'MessageEvent.connect(chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class _$ConnectCopyWith<$Res> implements $MessageEventCopyWith<$Res> {
  factory _$ConnectCopyWith(_Connect value, $Res Function(_Connect) _then) = __$ConnectCopyWithImpl;
@useResult
$Res call({
 int chatId
});




}
/// @nodoc
class __$ConnectCopyWithImpl<$Res>
    implements _$ConnectCopyWith<$Res> {
  __$ConnectCopyWithImpl(this._self, this._then);

  final _Connect _self;
  final $Res Function(_Connect) _then;

/// Create a copy of MessageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chatId = null,}) {
  return _then(_Connect(
null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Send implements MessageEvent {
  const _Send(this.text);
  

 final  String text;

/// Create a copy of MessageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendCopyWith<_Send> get copyWith => __$SendCopyWithImpl<_Send>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Send&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'MessageEvent.send(text: $text)';
}


}

/// @nodoc
abstract mixin class _$SendCopyWith<$Res> implements $MessageEventCopyWith<$Res> {
  factory _$SendCopyWith(_Send value, $Res Function(_Send) _then) = __$SendCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class __$SendCopyWithImpl<$Res>
    implements _$SendCopyWith<$Res> {
  __$SendCopyWithImpl(this._self, this._then);

  final _Send _self;
  final $Res Function(_Send) _then;

/// Create a copy of MessageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_Send(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Disconnect implements MessageEvent {
  const _Disconnect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disconnect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageEvent.disconnect()';
}


}




/// @nodoc


class _MessageReceived implements MessageEvent {
  const _MessageReceived(this.message);
  

 final  Message message;

/// Create a copy of MessageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageReceivedCopyWith<_MessageReceived> get copyWith => __$MessageReceivedCopyWithImpl<_MessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageReceived&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessageEvent.messageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class _$MessageReceivedCopyWith<$Res> implements $MessageEventCopyWith<$Res> {
  factory _$MessageReceivedCopyWith(_MessageReceived value, $Res Function(_MessageReceived) _then) = __$MessageReceivedCopyWithImpl;
@useResult
$Res call({
 Message message
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class __$MessageReceivedCopyWithImpl<$Res>
    implements _$MessageReceivedCopyWith<$Res> {
  __$MessageReceivedCopyWithImpl(this._self, this._then);

  final _MessageReceived _self;
  final $Res Function(_MessageReceived) _then;

/// Create a copy of MessageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_MessageReceived(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of MessageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

/// @nodoc


class _WsError implements MessageEvent {
  const _WsError(this.error);
  

 final  String error;

/// Create a copy of MessageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WsErrorCopyWith<_WsError> get copyWith => __$WsErrorCopyWithImpl<_WsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'MessageEvent.wsError(error: $error)';
}


}

/// @nodoc
abstract mixin class _$WsErrorCopyWith<$Res> implements $MessageEventCopyWith<$Res> {
  factory _$WsErrorCopyWith(_WsError value, $Res Function(_WsError) _then) = __$WsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$WsErrorCopyWithImpl<$Res>
    implements _$WsErrorCopyWith<$Res> {
  __$WsErrorCopyWithImpl(this._self, this._then);

  final _WsError _self;
  final $Res Function(_WsError) _then;

/// Create a copy of MessageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_WsError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MessageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageState()';
}


}

/// @nodoc
class $MessageStateCopyWith<$Res>  {
$MessageStateCopyWith(MessageState _, $Res Function(MessageState) __);
}


/// Adds pattern-matching-related methods to [MessageState].
extension MessageStatePatterns on MessageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MessageInitial value)?  initial,TResult Function( _MessageLoading value)?  loading,TResult Function( _MessageSuccess value)?  success,TResult Function( _MessageError value)?  error,TResult Function( _MessageDisconnected value)?  disconnected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageInitial() when initial != null:
return initial(_that);case _MessageLoading() when loading != null:
return loading(_that);case _MessageSuccess() when success != null:
return success(_that);case _MessageError() when error != null:
return error(_that);case _MessageDisconnected() when disconnected != null:
return disconnected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MessageInitial value)  initial,required TResult Function( _MessageLoading value)  loading,required TResult Function( _MessageSuccess value)  success,required TResult Function( _MessageError value)  error,required TResult Function( _MessageDisconnected value)  disconnected,}){
final _that = this;
switch (_that) {
case _MessageInitial():
return initial(_that);case _MessageLoading():
return loading(_that);case _MessageSuccess():
return success(_that);case _MessageError():
return error(_that);case _MessageDisconnected():
return disconnected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MessageInitial value)?  initial,TResult? Function( _MessageLoading value)?  loading,TResult? Function( _MessageSuccess value)?  success,TResult? Function( _MessageError value)?  error,TResult? Function( _MessageDisconnected value)?  disconnected,}){
final _that = this;
switch (_that) {
case _MessageInitial() when initial != null:
return initial(_that);case _MessageLoading() when loading != null:
return loading(_that);case _MessageSuccess() when success != null:
return success(_that);case _MessageError() when error != null:
return error(_that);case _MessageDisconnected() when disconnected != null:
return disconnected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Message> messages,  bool isConnected)?  success,TResult Function( String error)?  error,TResult Function( String reason)?  disconnected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageInitial() when initial != null:
return initial();case _MessageLoading() when loading != null:
return loading();case _MessageSuccess() when success != null:
return success(_that.messages,_that.isConnected);case _MessageError() when error != null:
return error(_that.error);case _MessageDisconnected() when disconnected != null:
return disconnected(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Message> messages,  bool isConnected)  success,required TResult Function( String error)  error,required TResult Function( String reason)  disconnected,}) {final _that = this;
switch (_that) {
case _MessageInitial():
return initial();case _MessageLoading():
return loading();case _MessageSuccess():
return success(_that.messages,_that.isConnected);case _MessageError():
return error(_that.error);case _MessageDisconnected():
return disconnected(_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Message> messages,  bool isConnected)?  success,TResult? Function( String error)?  error,TResult? Function( String reason)?  disconnected,}) {final _that = this;
switch (_that) {
case _MessageInitial() when initial != null:
return initial();case _MessageLoading() when loading != null:
return loading();case _MessageSuccess() when success != null:
return success(_that.messages,_that.isConnected);case _MessageError() when error != null:
return error(_that.error);case _MessageDisconnected() when disconnected != null:
return disconnected(_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class _MessageInitial implements MessageState {
  const _MessageInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageState.initial()';
}


}




/// @nodoc


class _MessageLoading implements MessageState {
  const _MessageLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageState.loading()';
}


}




/// @nodoc


class _MessageSuccess implements MessageState {
  const _MessageSuccess({required final  List<Message> messages, this.isConnected = true}): _messages = messages;
  

 final  List<Message> _messages;
 List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@JsonKey() final  bool isConnected;

/// Create a copy of MessageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageSuccessCopyWith<_MessageSuccess> get copyWith => __$MessageSuccessCopyWithImpl<_MessageSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageSuccess&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),isConnected);

@override
String toString() {
  return 'MessageState.success(messages: $messages, isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class _$MessageSuccessCopyWith<$Res> implements $MessageStateCopyWith<$Res> {
  factory _$MessageSuccessCopyWith(_MessageSuccess value, $Res Function(_MessageSuccess) _then) = __$MessageSuccessCopyWithImpl;
@useResult
$Res call({
 List<Message> messages, bool isConnected
});




}
/// @nodoc
class __$MessageSuccessCopyWithImpl<$Res>
    implements _$MessageSuccessCopyWith<$Res> {
  __$MessageSuccessCopyWithImpl(this._self, this._then);

  final _MessageSuccess _self;
  final $Res Function(_MessageSuccess) _then;

/// Create a copy of MessageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? isConnected = null,}) {
  return _then(_MessageSuccess(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _MessageError implements MessageState {
  const _MessageError({required this.error});
  

 final  String error;

/// Create a copy of MessageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageErrorCopyWith<_MessageError> get copyWith => __$MessageErrorCopyWithImpl<_MessageError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'MessageState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$MessageErrorCopyWith<$Res> implements $MessageStateCopyWith<$Res> {
  factory _$MessageErrorCopyWith(_MessageError value, $Res Function(_MessageError) _then) = __$MessageErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$MessageErrorCopyWithImpl<$Res>
    implements _$MessageErrorCopyWith<$Res> {
  __$MessageErrorCopyWithImpl(this._self, this._then);

  final _MessageError _self;
  final $Res Function(_MessageError) _then;

/// Create a copy of MessageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_MessageError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _MessageDisconnected implements MessageState {
  const _MessageDisconnected({required this.reason});
  

 final  String reason;

/// Create a copy of MessageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageDisconnectedCopyWith<_MessageDisconnected> get copyWith => __$MessageDisconnectedCopyWithImpl<_MessageDisconnected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageDisconnected&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'MessageState.disconnected(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$MessageDisconnectedCopyWith<$Res> implements $MessageStateCopyWith<$Res> {
  factory _$MessageDisconnectedCopyWith(_MessageDisconnected value, $Res Function(_MessageDisconnected) _then) = __$MessageDisconnectedCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class __$MessageDisconnectedCopyWithImpl<$Res>
    implements _$MessageDisconnectedCopyWith<$Res> {
  __$MessageDisconnectedCopyWithImpl(this._self, this._then);

  final _MessageDisconnected _self;
  final $Res Function(_MessageDisconnected) _then;

/// Create a copy of MessageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(_MessageDisconnected(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
