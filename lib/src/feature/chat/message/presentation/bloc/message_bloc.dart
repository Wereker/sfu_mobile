import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/core/error/ws_exception.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/connect_to_chat_use_case.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/get_messages_use_case.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/send_message_use_case.dart';

part 'message_event.dart';
part 'message_state.dart';
part 'message_bloc.freezed.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetMessagesUseCase _getMessages;
  final ConnectToChatUseCase _connect;
  final SendMessageUseCase _send;

  StreamSubscription<Message>? _wsSub;

  MessageBloc({
    required GetMessagesUseCase getMessages,
    required ConnectToChatUseCase connect,
    required SendMessageUseCase send,
  })  : _getMessages = getMessages,
        _connect = connect,
        _send = send,
        super(const MessageState.initial()) {
    on<MessageEvent>(_onEvent);
  }

  Future<void> _onEvent(
      MessageEvent event,
      Emitter<MessageState> emit,
      ) async {
    await event.when(
      connect: (int chatId) async {
        emit(const MessageState.loading());

        // 1. Загружаем историю
        try {
          final history = await _getMessages.call(chatId);
          emit(MessageState.success(messages: history));
        } on AppException catch (e) {
          emit(MessageState.error(error: e.message));
          return;
        } catch (_) {
          emit(const MessageState.error(error: 'Ошибка загрузки истории'));
          return;
        }

        // 2. Подключаемся к WebSocket
        await _wsSub?.cancel();
        _wsSub = _connect.call(chatId).listen(
              (message) => add(MessageEvent.messageReceived(message)),
          onError: (e) {
            if (e is WsUnauthorizedException) {
              add(MessageEvent.wsError(e.message));
            } else if (e is WsForbiddenException) {
              add(MessageEvent.wsError(e.message));
            } else if (e is WsDisconnectedException) {
              add(MessageEvent.wsError(e.message));
            } else {
              add(const MessageEvent.wsError('Ошибка соединения с чатом'));
            }
          },
          cancelOnError: false,
        );
      },

      send: (String text) async {
        if (text.trim().isEmpty) return;
        _send.call(text.trim());
        // Не добавляем локально — придёт обратно через WS
      },

      messageReceived: (Message message) async {
        final current = state.maybeWhen(
          success: (messages, _) => messages,
          orElse: () => <Message>[],
        );
        emit(MessageState.success(messages: [...current, message]));
      },

      wsError: (String error) async {
        emit(MessageState.disconnected(reason: error));
      },

      disconnect: () async {
        await _wsSub?.cancel();
        _wsSub = null;
      },
    );
  }

  @override
  Future<void> close() async {
    await _wsSub?.cancel();
    return super.close();
  }
}