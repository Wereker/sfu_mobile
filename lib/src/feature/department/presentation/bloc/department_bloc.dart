import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/department/domain/entity/staff_member.dart';
import 'package:sfu/src/feature/department/domain/use_case/get_staff_use_case.dart';

part 'department_event.dart';
part 'department_state.dart';
part 'department_bloc.freezed.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final GetStaffUseCase _getStaffUseCase;

  DepartmentBloc(this._getStaffUseCase) : super(DepartmentState.initial()) {
    on<DepartmentEvent>(_onEvent);
  }

  Future<void> _onEvent(
    DepartmentEvent event,
    Emitter<DepartmentState> emit,
  ) async {
    await event.when(
      load: () async {
        emit(DepartmentState.loading());
        try {
          final staff = await _getStaffUseCase.call();
          emit(DepartmentState.success(staff));
        } on AppException catch (e) {
          emit(DepartmentState.error(e.message));
        } catch (_) {
          emit(DepartmentState.error('Ошибка загрузки преподавателей'));
        }
      },
    );
  }
}
