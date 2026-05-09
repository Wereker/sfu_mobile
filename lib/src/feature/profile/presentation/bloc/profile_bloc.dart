import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/use_case/get_profile_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;

  ProfileBloc(this._getProfileUseCase) : super(ProfileState.initial()) {
    on<ProfileEvent>(_onEvent);
  }

  Future<void> _onEvent(ProfileEvent event, Emitter<ProfileState> emit) async {
    await event.when(
      loadData: () async {
        emit(ProfileState.loading());
        try {
          final user = await _getProfileUseCase.call();
          emit(ProfileState.success(user));
        } on AppException catch (e) {
          emit(ProfileState.error(error: e.message));
        } catch (_) {
          emit(ProfileState.error(error: 'Ошибка загрузки профиля'));
        }
      },
    );
  }
}
