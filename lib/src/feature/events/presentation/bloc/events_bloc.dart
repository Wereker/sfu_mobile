import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/events/domain/entity/event.dart';
import 'package:sfu/src/feature/events/domain/use_case/enroll_event_use_case.dart';
import 'package:sfu/src/feature/events/domain/use_case/get_events_use_case.dart';
import 'package:sfu/src/feature/events/domain/use_case/unenroll_event_use_case.dart';

part 'events_event.dart';
part 'events_state.dart';
part 'events_bloc.freezed.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final GetEventsUseCase _getEventsUseCase;
  final EnrollEventUseCase _enrollEventUseCase;
  final UnenrollEventUseCase _unenrollEventUseCase;

  EventsBloc({
    required GetEventsUseCase getEventsUseCase,
    required EnrollEventUseCase enrollEventUseCase,
    required UnenrollEventUseCase unenrollEventUseCase,
  }) : _getEventsUseCase = getEventsUseCase,
       _enrollEventUseCase = enrollEventUseCase,
       _unenrollEventUseCase = unenrollEventUseCase,
       super(EventsState.initial()) {
    on<EventsEvent>(_onEvent);
  }

  Future<void> _onEvent(EventsEvent event, Emitter<EventsState> emit) async {
    await event.when(
      load: () async {
        emit(EventsState.loading());
        try {
          final events = await _getEventsUseCase.call();
          emit(EventsState.success(events));
        } on AppException catch (e) {
          emit(EventsState.error(e.message));
        } catch (_) {
          emit(EventsState.error('Ошибка загрузки событий'));
        }
      },
      enroll: (String eventId) async {
        try {
          await _enrollEventUseCase.call(eventId);
          final events = await _getEventsUseCase.call();
          emit(EventsState.success(events));
        } on AppException catch (e) {
          emit(EventsState.error(e.message));
        } catch (_) {
          emit(EventsState.error('Ошибка записи на событие'));
        }
      },
      unenroll: (String eventId) async {
        try {
          await _unenrollEventUseCase.call(eventId);
          final events = await _getEventsUseCase.call();
          emit(EventsState.success(events));
        } on AppException catch (e) {
          emit(EventsState.error(e.message));
        } catch (_) {
          emit(EventsState.error('Ошибка отмены записи'));
        }
      },
    );
  }
}
