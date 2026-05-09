import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/timetable/suggestion/domain/use_case/get_suggestions_use_case.dart';

part 'suggestions_bloc.freezed.dart';
part 'suggestions_event.dart';
part 'suggestions_state.dart';

class SuggestionsBloc extends Bloc<SuggestionEvent, SuggestionState> {
  final GetSuggestionsUseCase _getSuggestionsUseCase;

  SuggestionsBloc(this._getSuggestionsUseCase)
    : super(SuggestionState.initial()) {
    on<SuggestionEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SuggestionEvent event,
    Emitter<SuggestionState> emit,
  ) async {
    await event.when(
      loadData: () async {
        emit(SuggestionState.success(suggestions: []));
      },
      loadSuggestions: (String query) async {
        try {
          final suggestions = await _getSuggestionsUseCase.call(query);
          emit(SuggestionState.success(suggestions: suggestions));
        } on AppException catch (e) {
          emit(SuggestionState.error(error: e.message));
        } catch (_) {
          emit(SuggestionState.error(error: 'Ошибка загрузки подсказок'));
        }
      },
    );
  }
}
