import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/chat/domain/entity/chat.dart';
import 'package:sfu/src/feature/chat/domain/use_case/get_chats_use_case.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatsUseCase _getChatsUseCase;

  ChatBloc(this._getChatsUseCase) : super(ChatState.initial()) {
    on<ChatEvent>(_onEvent);
  }

  Future<void> _onEvent(ChatEvent event, Emitter<ChatState> emit) async {
    await event.when(
      loadData: () async {
        emit(ChatState.loading());
        try {
          final chats = await _getChatsUseCase.call();
          emit(ChatState.success(chats));
        } on AppException catch (e) {
          emit(ChatState.error(error: e.message));
        } catch (_) {
          emit(ChatState.error(error: 'Ошибка загрузки чатов'));
        }
      },
    );
  }
}