import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/message_get_messages_for_chat_use_case.dart';

part 'message_event.dart';
part 'message_state.dart';
part 'message_bloc.freezed.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageGetMessagesForChatUseCase getMessagesForChatUseCase;

  MessageBloc(this.getMessagesForChatUseCase) : super(MessageState.initial()) {
    on<MessageEvent>(_onEvent);
  }

  Future<void> _onEvent(MessageEvent event, Emitter<MessageState> emit) async {
    await event.when(
      loadData: () async {
      },
      getMessagesForChat: (String chatId) async {
        emit(MessageState.loading());

        try {
          final message = await getMessagesForChatUseCase.call(chatId);
          emit(MessageState.success(message));
        } catch (_) {
          emit(MessageState.error(error: 'Ошибка загрузки новостей'));
        }
      },
    );
  }
}