import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/get_attendance_history_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/mark_attendance_use_case.dart';

part 'attendance_mark_event.dart';
part 'attendance_mark_state.dart';
part 'attendance_mark_bloc.freezed.dart';

class AttendanceMarkBloc
    extends Bloc<AttendanceMarkEvent, AttendanceMarkState> {
  final MarkAttendanceUseCase _markAttendanceUseCase;
  final GetAttendanceHistoryUseCase _getHistoryUseCase;

  AttendanceMarkBloc({
    required MarkAttendanceUseCase markAttendanceUseCase,
    required GetAttendanceHistoryUseCase getHistoryUseCase,
  }) : _markAttendanceUseCase = markAttendanceUseCase,
       _getHistoryUseCase = getHistoryUseCase,
       super(AttendanceMarkState.initial()) {
    on<AttendanceMarkEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AttendanceMarkEvent event,
    Emitter<AttendanceMarkState> emit,
  ) async {
    await event.when(
      mark: (String token) async {
        emit(AttendanceMarkState.marking());
        try {
          final record = await _markAttendanceUseCase.call(token);
          emit(AttendanceMarkState.markSuccess(record));
        } on AppException catch (e) {
          emit(AttendanceMarkState.error(e.message));
        } catch (_) {
          emit(AttendanceMarkState.error('Ошибка отметки посещаемости'));
        }
      },
      loadHistory: () async {
        emit(AttendanceMarkState.historyLoading());
        try {
          final records = await _getHistoryUseCase.call();
          emit(AttendanceMarkState.historySuccess(records));
        } on AppException catch (e) {
          emit(AttendanceMarkState.error(e.message));
        } catch (_) {
          emit(AttendanceMarkState.error('Ошибка загрузки истории'));
        }
      },
    );
  }
}
