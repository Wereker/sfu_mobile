import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/chat/domain/entity/chat/chat.dart';
import 'package:sfu/src/feature/chat/domain/use_case/chat_load_data_use_case.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatLoadDataUseCase loadDataUseCase;

  ChatBloc(this.loadDataUseCase) : super(ChatState.initial()) {
    on<ChatEvent>(_onEvent);
  }

  Future<void> _onEvent(ChatEvent event, Emitter<ChatState> emit) async {
    await event.when(
      loadData: () async {
        emit(ChatState.loading());

        try {
          final chat = await loadDataUseCase.call();
          emit(ChatState.success(chat));
        } catch (_) {
          emit(ChatState.error(error: 'Ошибка загрузки новостей'));
        }
      },
    );
  }
}