import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data__for_group_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_for_teacher_use_case.dart';

part 'timetable_event.dart';
part 'timetable_state.dart';
part 'timetable_bloc.freezed.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  final TimetableLoadDataForGroupUseCase timetableLoadDataForGroupUseCase;
  final TimetableLoadDataForTeacherUseCase timetableLoadDataForTeacherUseCase;

  TimetableBloc(
    this.timetableLoadDataForGroupUseCase,
    this.timetableLoadDataForTeacherUseCase,
  ) : super(TimetableState.initial()) {
    on<TimetableEvent>(_onEvent);
  }

  Future<void> _onEvent(
    TimetableEvent event,
    Emitter<TimetableState> emit,
  ) async {
    await event.when(
      loadDataForGroup: () async {
        emit(TimetableState.loading());

        try {
          final result = await timetableLoadDataForGroupUseCase.call();
          emit(TimetableState.success(result));
        } catch (_) {
          emit(
            TimetableState.error(
              error: 'Ошибка при загрузке расписания группы',
            ),
          );
        }
      },
      loadDataForTeacher: () async {
        emit(TimetableState.loading());
        try {
          final result = await timetableLoadDataForTeacherUseCase.call();
          emit(TimetableState.success(result));
        } catch (_) {
          emit(
            TimetableState.error(
              error: 'Ошибка при загрузке расписания преподавателя',
            ),
          );
        }
      },
    );
  }
}
