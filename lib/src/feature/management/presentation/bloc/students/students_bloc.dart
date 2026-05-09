import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/management/domain/entity/managed_student.dart';
import 'package:sfu/src/feature/management/domain/use_case/get_students_use_case.dart';

part 'students_event.dart';
part 'students_state.dart';
part 'students_bloc.freezed.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  final GetStudentsUseCase _getStudentsUseCase;

  StudentsBloc(this._getStudentsUseCase) : super(StudentsState.initial()) {
    on<StudentsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    StudentsEvent event,
    Emitter<StudentsState> emit,
  ) async {
    await event.when(
      load: (String? stream, String? groupId, String? search) async {
        emit(StudentsState.loading());
        try {
          final students = await _getStudentsUseCase.call(
            stream: stream,
            groupId: groupId,
            search: search,
          );
          emit(StudentsState.success(students));
        } on AppException catch (e) {
          emit(StudentsState.error(e.message));
        } catch (_) {
          emit(StudentsState.error('Ошибка загрузки студентов'));
        }
      },
    );
  }
}
