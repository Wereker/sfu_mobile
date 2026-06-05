import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/core/widgets/user_avatar.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/domain/use_case/get_profile_use_case.dart';
import 'package:sfu/src/feature/profile/domain/use_case/upload_avatar_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfile;
  final UploadAvatarUseCase _uploadAvatar;

  ProfileBloc({
    required GetProfileUseCase getProfile,
    required UploadAvatarUseCase uploadAvatar,
  })  : _getProfile = getProfile,
        _uploadAvatar = uploadAvatar,
        super(const ProfileState.initial()) {
    on<ProfileEvent>(_onEvent);
  }

  Future<void> _onEvent(ProfileEvent event, Emitter<ProfileState> emit) async {
    await event.when(
      loadData: () async {
        emit(ProfileState.loading());
        try {
          final user = await _getProfile.call();
          emit(ProfileState.success(user));
        } on AppException catch (e) {
          emit(ProfileState.error(error: e.message));
        } catch (_) {
          emit(ProfileState.error(error: 'Ошибка загрузки профиля'));
        }
      },
      uploadAvatar: (String filePath) async {
        try {
          await _uploadAvatar.call(filePath);

          final currentUser = state.maybeWhen(
            success: (user) => user,
            orElse: () => null,
          );
          if (currentUser != null) {
            UserAvatar.clearCacheForUser(currentUser.id);
          }

          // Перезагружаем профиль
          add(const ProfileEvent.loadData());
        } on AppException catch (_) {
          emit(state);
        }
      },
    );
  }
}
