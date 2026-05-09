import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/announcements/domain/entity/announcement.dart';
import 'package:sfu/src/feature/announcements/domain/use_case/get_announcements_use_case.dart';

part 'announcements_event.dart';
part 'announcements_state.dart';
part 'announcements_bloc.freezed.dart';

class AnnouncementsBloc extends Bloc<AnnouncementsEvent, AnnouncementsState> {
  final GetAnnouncementsUseCase _getAnnouncementsUseCase;

  AnnouncementsBloc(this._getAnnouncementsUseCase)
      : super(AnnouncementsState.initial()) {
    on<AnnouncementsEvent>(_onEvent);
  }

  Future<void> _onEvent(
      AnnouncementsEvent event,
      Emitter<AnnouncementsState> emit,
      ) async {
    await event.when(
      load: () async {
        emit(AnnouncementsState.loading());
        try {
          final items = await _getAnnouncementsUseCase.call();
          emit(AnnouncementsState.success(items));
        } on AppException catch (e) {
          emit(AnnouncementsState.error(e.message));
        } catch (_) {
          emit(AnnouncementsState.error('Ошибка загрузки объявлений'));
        }
      },
    );
  }
}