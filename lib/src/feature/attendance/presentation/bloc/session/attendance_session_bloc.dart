import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_session.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/create_attendance_session_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/get_session_students_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/update_student_status_use_case.dart';

part 'attendance_session_event.dart';
part 'attendance_session_state.dart';
part 'attendance_session_bloc.freezed.dart';

class AttendanceSessionBloc
    extends Bloc<AttendanceSessionEvent, AttendanceSessionState> {
  final CreateAttendanceSessionUseCase _createSession;
  final GetSessionStudentsUseCase _getStudents;
  final UpdateStudentStatusUseCase _markManual;

  // Кэшируем сессию чтобы не терять token при перезагрузке студентов
  AttendanceSession? _currentSession;

  AttendanceSessionBloc({
    required CreateAttendanceSessionUseCase createSession,
    required GetSessionStudentsUseCase getStudents,
    required UpdateStudentStatusUseCase markManual,
  })  : _createSession = createSession,
        _getStudents = getStudents,
        _markManual = markManual,
        super(const AttendanceSessionState.initial()) {
    on<AttendanceSessionEvent>(_onEvent);
  }

  Future<void> _onEvent(
      AttendanceSessionEvent event,
      Emitter<AttendanceSessionState> emit,
      ) async {
    await event.when(
      createSession: (int lessonId) async {
        emit(const AttendanceSessionState.sessionLoading());
        try {
          final session = await _createSession.call(lessonId);
          _currentSession = session;
          emit(AttendanceSessionState.sessionReady(session));
          // Сразу загружаем список — кто уже отметился
          add(AttendanceSessionEvent.loadStudents(lessonId));
        } on AppException catch (e) {
          emit(AttendanceSessionState.error(e.message));
        } catch (_) {
          emit(const AttendanceSessionState.error('Ошибка создания QR-токена'));
        }
      },

      loadStudents: (int lessonId) async {
        emit(const AttendanceSessionState.studentsLoading());
        try {
          final students = await _getStudents.call(lessonId);
          emit(AttendanceSessionState.studentsSuccess(
            session: _currentSession,
            students: students,
          ));
        } on AppException catch (e) {
          emit(AttendanceSessionState.error(e.message));
        } catch (_) {
          emit(const AttendanceSessionState.error('Ошибка загрузки студентов'));
        }
      },

      markManual: (int lessonId, int studentId) async {
        try {
          await _markManual.call(lessonId, studentId);
          // Обновляем список после ручной отметки
          add(AttendanceSessionEvent.loadStudents(lessonId));
        } on AppException catch (e) {
          emit(AttendanceSessionState.error(e.message));
        } catch (_) {
          emit(const AttendanceSessionState.error('Ошибка ручной отметки'));
        }
      },

      refresh: (int lessonId) async {
        add(AttendanceSessionEvent.loadStudents(lessonId));
      },
    );
  }
}