import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_use_case.dart';

part 'timetable_event.dart';
part 'timetable_state.dart';
part 'timetable_bloc.freezed.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  final TimetableLoadDataUseCase timetableLoadDataUseCase;

  TimetableBloc(
    this.timetableLoadDataUseCase,
  ) : super(TimetableState.initial()) {
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
          final result = await timetableLoadDataUseCase.call();
          emit(TimetableState.success(result));
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
