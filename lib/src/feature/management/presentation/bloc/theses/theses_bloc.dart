import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/management/domain/entity/thesis.dart';
import 'package:sfu/src/feature/management/domain/use_case/create_thesis_use_case.dart';
import 'package:sfu/src/feature/management/domain/use_case/get_my_theses_use_case.dart';
import 'package:sfu/src/feature/management/domain/use_case/update_thesis_use_case.dart';

part 'theses_event.dart';
part 'theses_state.dart';
part 'theses_bloc.freezed.dart';

class ThesesBloc extends Bloc<ThesesEvent, ThesesState> {
  final GetMyThesesUseCase _getMyThesesUseCase;
  final CreateThesisUseCase _createThesisUseCase;
  final UpdateThesisUseCase _updateThesisUseCase;

  ThesesBloc({
    required GetMyThesesUseCase getMyThesesUseCase,
    required CreateThesisUseCase createThesisUseCase,
    required UpdateThesisUseCase updateThesisUseCase,
  }) : _getMyThesesUseCase = getMyThesesUseCase,
       _createThesisUseCase = createThesisUseCase,
       _updateThesisUseCase = updateThesisUseCase,
       super(ThesesState.initial()) {
    on<ThesesEvent>(_onEvent);
  }

  Future<void> _onEvent(ThesesEvent event, Emitter<ThesesState> emit) async {
    await event.when(
      load: () async {
        emit(ThesesState.loading());
        try {
          final theses = await _getMyThesesUseCase.call();
          emit(ThesesState.success(theses));
        } on AppException catch (e) {
          emit(ThesesState.error(e.message));
        } catch (_) {
          emit(ThesesState.error('Ошибка загрузки тем ВКР'));
        }
      },
      create: (String title) async {
        emit(ThesesState.loading());
        try {
          await _createThesisUseCase.call(title);
          // После создания перезагружаем список
          final theses = await _getMyThesesUseCase.call();
          emit(ThesesState.success(theses));
        } on AppException catch (e) {
          emit(ThesesState.error(e.message));
        } catch (_) {
          emit(ThesesState.error('Ошибка создания темы'));
        }
      },
      update: (String id, String? title, bool? isFree) async {
        emit(ThesesState.loading());
        try {
          await _updateThesisUseCase.call(id, title: title, isFree: isFree);
          final theses = await _getMyThesesUseCase.call();
          emit(ThesesState.success(theses));
        } on AppException catch (e) {
          emit(ThesesState.error(e.message));
        } catch (_) {
          emit(ThesesState.error('Ошибка обновления темы'));
        }
      },
    );
  }
}
