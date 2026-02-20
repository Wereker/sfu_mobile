import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_for_target_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/suggestions_load_use_case.dart';

part 'timetable_event.dart';
part 'timetable_state.dart';
part 'timetable_bloc.freezed.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  final TimetableLoadDataUseCase timetableLoadDataUseCase;
  final TimetableLoadDataForTargetUseCase timetableLoadDataForTargetUseCase;


  TimetableBloc({
    required this.timetableLoadDataUseCase,
    required this.timetableLoadDataForTargetUseCase,
  }) : super(TimetableState.initial()) {
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
          final timetable = await timetableLoadDataUseCase.call();
          emit(
            TimetableState.success(timetable: timetable),
          );
        } catch (_) {
          emit(
            TimetableState.error(
              error: 'Ошибка при загрузке расписания группы',
            ),
          );
        }
      },

      loadDataForTarget: (String target) async {
        emit(TimetableState.loading());

        try {
          final timetable = await timetableLoadDataForTargetUseCase.call(
            target,
          );
          emit(
            TimetableState.success(timetable: timetable),
          );
        } catch (_) {
          emit(
            TimetableState.error(
              error: 'Ошибка при загрузке расписания группы',
            ),
          );
        }
      },
    );
  }
}
