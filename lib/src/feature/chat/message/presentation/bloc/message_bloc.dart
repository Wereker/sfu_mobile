import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/get_messages_use_case.dart';

part 'message_event.dart';
part 'message_state.dart';
part 'message_bloc.freezed.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetMessagesUseCase _getMessagesUseCase;

  MessageBloc(this._getMessagesUseCase) : super(MessageState.initial()) {
    on<MessageEvent>(_onEvent);
  }

  Future<void> _onEvent(MessageEvent event, Emitter<MessageState> emit) async {
    await event.when(
      getMessagesForChat: (String chatId) async {
        emit(MessageState.loading());
        try {
          final messages = await _getMessagesUseCase.call(chatId);
          emit(MessageState.success(messages));
        } on AppException catch (e) {
          emit(MessageState.error(error: e.message));
        } catch (_) {
          emit(MessageState.error(error: 'Ошибка загрузки сообщений'));
        }
      },
    );
  }
}
