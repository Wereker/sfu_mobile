import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/use_case/load_data_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final LoadDataUseCase loadDataUseCase;

  ProfileBloc(this.loadDataUseCase) : super(ProfileState.initial()) {
    on<ProfileEvent>(_onEvent);
  }

  Future<void> _onEvent(ProfileEvent event, Emitter<ProfileState> emit) async {
    await event.when(
      loadData: () async {
        emit(ProfileState.loading());

        try {
          final user = await loadDataUseCase.call();
          emit(ProfileState.success(user));
        } catch (_) {
          emit(ProfileState.error(error: "Ошибка загрузки профиля"));
        }
      },
    );
  }
}
