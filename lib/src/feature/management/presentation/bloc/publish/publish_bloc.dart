import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/management/domain/use_case/publish_announcement_use_case.dart';
import 'package:sfu/src/feature/management/domain/use_case/publish_event_use_case.dart';

part 'publish_event.dart';
part 'publish_state.dart';
part 'publish_bloc.freezed.dart';

class PublishBloc extends Bloc<PublishEvent, PublishState> {
  final PublishAnnouncementUseCase _publishAnnouncementUseCase;
  final PublishEventUseCase _publishEventUseCase;

  PublishBloc({
    required PublishAnnouncementUseCase publishAnnouncementUseCase,
    required PublishEventUseCase publishEventUseCase,
  })  : _publishAnnouncementUseCase = publishAnnouncementUseCase,
        _publishEventUseCase = publishEventUseCase,
        super(PublishState.initial()) {
    on<PublishEvent>(_onEvent);
  }

  Future<void> _onEvent(PublishEvent event, Emitter<PublishState> emit) async {
    await event.when(
      publishAnnouncement: (
          String title,
          String content,
          String publishAt,
          String expiresAt,
          List<int> targetGroupIds,
          List<int> targetStreamIds,
          ) async {
        emit(PublishState.loading());
        try {
          await _publishAnnouncementUseCase.call(
            title: title,
            content: content,
            publishAt: publishAt,
            expiresAt: expiresAt,
            targetGroupIds: targetGroupIds,
            targetStreamIds: targetStreamIds,
          );
          emit(PublishState.success());
        } on AppException catch (e) {
          emit(PublishState.error(e.message));
        } catch (_) {
          emit(PublishState.error('Ошибка публикации объявления'));
        }
      },

      publishEvent: (
          String title,
          String annotation,
          String startsAt,
          String endsAt,
          int roomId,
          ) async {
        emit(PublishState.loading());
        try {
          await _publishEventUseCase.call(
            title: title,
            annotation: annotation,
            startsAt: startsAt,
            endsAt: endsAt,
            roomId: roomId,
          );
          emit(PublishState.success());
        } on AppException catch (e) {
          emit(PublishState.error(e.message));
        } catch (_) {
          emit(PublishState.error('Ошибка создания события'));
        }
      },
    );
  }
}