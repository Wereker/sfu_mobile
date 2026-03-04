part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _ChatInitial;

  const factory ChatState.loading() = _ChatLoading;

  const factory ChatState.success(List<Chat> chat) = _ChatSucces;

  const factory ChatState.error({required String error})= _ChatError;
}