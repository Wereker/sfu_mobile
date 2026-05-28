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
  final MarkAttendanceUseCase _mark;
  final GetAttendanceHistoryUseCase _history;

  AttendanceMarkBloc({
    required MarkAttendanceUseCase mark,
    required GetAttendanceHistoryUseCase history,
  })  : _mark = mark,
        _history = history,
        super(const AttendanceMarkState.initial()) {
    on<AttendanceMarkEvent>(_onEvent);
  }

  Future<void> _onEvent(
      AttendanceMarkEvent event,
      Emitter<AttendanceMarkState> emit,
      ) async {
    await event.when(
      scan: (String token) async {
        emit(const AttendanceMarkState.marking());
        try {
          final record = await _mark.call(token);
          emit(AttendanceMarkState.markSuccess(record));
        } on AppException catch (e) {
          emit(AttendanceMarkState.error(e.message));
        } catch (_) {
          emit(const AttendanceMarkState.error('Ошибка отметки посещаемости'));
        }
      },
      loadHistory: (int studentId) async {
        emit(const AttendanceMarkState.historyLoading());
        try {
          final records = await _history.call(studentId);
          emit(AttendanceMarkState.historySuccess(records));
        } on AppException catch (e) {
          emit(AttendanceMarkState.error(e.message));
        } catch (_) {
          emit(const AttendanceMarkState.error('Ошибка загрузки истории'));
        }
      },
    );
  }
}