import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_session.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/close_attendance_session_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/create_attendance_session_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/get_session_students_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/update_student_status_use_case.dart';

part 'attendance_session_event.dart';
part 'attendance_session_state.dart';
part 'attendance_session_bloc.freezed.dart';

class AttendanceSessionBloc
    extends Bloc<AttendanceSessionEvent, AttendanceSessionState> {
  final CreateAttendanceSessionUseCase _createSessionUseCase;
  final CloseAttendanceSessionUseCase  _closeSessionUseCase;
  final GetSessionStudentsUseCase      _getSessionStudentsUseCase;
  final UpdateStudentStatusUseCase     _updateStudentStatusUseCase;

  AttendanceSessionBloc({
    required CreateAttendanceSessionUseCase createSessionUseCase,
    required CloseAttendanceSessionUseCase  closeSessionUseCase,
    required GetSessionStudentsUseCase      getSessionStudentsUseCase,
    required UpdateStudentStatusUseCase     updateStudentStatusUseCase,
  })  : _createSessionUseCase      = createSessionUseCase,
        _closeSessionUseCase       = closeSessionUseCase,
        _getSessionStudentsUseCase = getSessionStudentsUseCase,
        _updateStudentStatusUseCase = updateStudentStatusUseCase,
        super(AttendanceSessionState.initial()) {
    on<AttendanceSessionEvent>(_onEvent);
  }

  Future<void> _onEvent(
      AttendanceSessionEvent event,
      Emitter<AttendanceSessionState> emit,
      ) async {
    await event.when(
      createSession: (String lessonId, int ttlSeconds) async {
        emit(AttendanceSessionState.sessionLoading());
        try {
          final session = await _createSessionUseCase.call(
            lessonId:   lessonId,
            ttlSeconds: ttlSeconds,
          );
          emit(AttendanceSessionState.sessionReady(session));
        } on AppException catch (e) {
          emit(AttendanceSessionState.error(e.message));
        } catch (_) {
          emit(AttendanceSessionState.error('Ошибка создания QR-сессии'));
        }
      },
      closeSession: (String sessionId) async {
        try {
          await _closeSessionUseCase.call(sessionId);
          emit(AttendanceSessionState.initial());
        } on AppException catch (e) {
          emit(AttendanceSessionState.error(e.message));
        } catch (_) {
          emit(AttendanceSessionState.error('Ошибка закрытия сессии'));
        }
      },
      loadStudents: (String sessionId) async {
        emit(AttendanceSessionState.studentsLoading());
        try {
          final students = await _getSessionStudentsUseCase.call(sessionId);
          emit(AttendanceSessionState.studentsSuccess(students));
        } on AppException catch (e) {
          emit(AttendanceSessionState.error(e.message));
        } catch (_) {
          emit(AttendanceSessionState.error('Ошибка загрузки списка студентов'));
        }
      },
      updateStatus: (
          String sessionId,
          String studentId,
          AttendanceStatus status,
          ) async {
        try {
          final updated = await _updateStudentStatusUseCase.call(
            sessionId: sessionId,
            studentId: studentId,
            status:    status,
          );
          // Перезагружаем список после изменения статуса
          final students = await _getSessionStudentsUseCase.call(sessionId);
          emit(AttendanceSessionState.studentsSuccess(students));
        } on AppException catch (e) {
          emit(AttendanceSessionState.error(e.message));
        } catch (_) {
          emit(AttendanceSessionState.error('Ошибка обновления статуса'));
        }
      },
    );
  }
}