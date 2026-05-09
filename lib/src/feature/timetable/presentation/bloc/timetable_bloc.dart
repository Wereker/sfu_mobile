import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/get_timetable_use_case.dart';

part 'timetable_event.dart';
part 'timetable_state.dart';
part 'timetable_bloc.freezed.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  final GetTimetableUseCase _getTimetableUseCase;

  TimetableBloc(this._getTimetableUseCase) : super(TimetableState.initial()) {
    on<TimetableEvent>(_onEvent);
  }

  Future<void> _onEvent(
      TimetableEvent event,
      Emitter<TimetableState> emit,
      ) async {
    await event.when(
      loadData: () async {
        emit(TimetableState.loading());
        try {
          final timetable = await _getTimetableUseCase.call();
          emit(TimetableState.success(timetable: timetable));
        } on AppException catch (e) {
          emit(TimetableState.error(error: e.message));
        } catch (_) {
          emit(TimetableState.error(error: 'Ошибка загрузки расписания'));
        }
      },
      loadDataForTarget: (String target) async {
        emit(TimetableState.loading());
        try {
          final timetable = await _getTimetableUseCase.call(target: target);
          emit(TimetableState.success(timetable: timetable));
        } on AppException catch (e) {
          emit(TimetableState.error(error: e.message));
        } catch (_) {
          emit(TimetableState.error(error: 'Ошибка загрузки расписания'));
        }
      },
    );
  }
}