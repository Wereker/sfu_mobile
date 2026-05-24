import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/get_next_lesson_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/get_timetable_use_case.dart';

part 'timetable_event.dart';
part 'timetable_state.dart';
part 'timetable_bloc.freezed.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  final GetTimetableUseCase _getTimetableUseCase;
  final GetNextLessonUseCase _getNextLessonUseCase;

  TimetableBloc({
    required GetTimetableUseCase getTimetableUseCase,
    required GetNextLessonUseCase getNextLessonUseCase,
  })  : _getTimetableUseCase = getTimetableUseCase,
        _getNextLessonUseCase = getNextLessonUseCase,
        super(TimetableState.initial()) {
    on<TimetableEvent>(_onEvent);
  }

  Future<void> _onEvent(
      TimetableEvent event,
      Emitter<TimetableState> emit,
      ) async {
    await event.when(
      loadData: (int userId, TimetableTargetType userType) async {
        emit(TimetableState.loading());
        try {
          final timetable = await _getTimetableUseCase.call(
            targetId: userId,
            type: userType,
          );
          emit(TimetableState.success(
            timetable: timetable,
            nextLesson: _getNextLessonUseCase.call(
              timetable: timetable,
              now: DateTime.now(),
            ),
          ));
        } on AppException catch (e) {
          emit(TimetableState.error(error: e.message));
        } catch (e) {
          emit(TimetableState.error(error: 'Ошибка загрузки расписания ($e)'));
        }
      },
      loadDataForTarget: (int searchId, TimetableTargetType searchType) async {
        emit(TimetableState.loading());
        try {
          final timetable = await _getTimetableUseCase.call(
            targetId: searchId,
            type: searchType,
          );
          emit(TimetableState.success(
            timetable: timetable,
            nextLesson: _getNextLessonUseCase.call(
              timetable: timetable,
              now: DateTime.now(),
            ),
          ));
        } on AppException catch (e) {
          emit(TimetableState.error(error: e.message));
        } catch (e) {
          emit(TimetableState.error(error: 'Ошибка загрузки расписания ($e)'));
        }
      },
    );
  }
}