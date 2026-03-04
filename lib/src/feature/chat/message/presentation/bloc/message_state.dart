part of 'message_bloc.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState.initial() = _MessageInitial;

  const factory MessageState.loading() = _MessageLoading;

  const factory MessageState.success(List<Message> message) = _MessageSucces;

  const factory MessageState.error({required String error})= _MessageError;
}