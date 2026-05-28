part of 'message_bloc.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState.initial() = _MessageInitial;
  const factory MessageState.loading() = _MessageLoading;
  const factory MessageState.success({
    required List<Message> messages,
    @Default(true) bool isConnected,
  }) = _MessageSuccess;
  const factory MessageState.error({required String error}) = _MessageError;
  const factory MessageState.disconnected({required String reason}) =
  _MessageDisconnected;
}