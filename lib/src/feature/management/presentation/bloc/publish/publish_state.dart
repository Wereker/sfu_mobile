part of 'publish_bloc.dart';

@freezed
class PublishState with _$PublishState {
  const factory PublishState.initial() = _PublishInitial;
  const factory PublishState.loading() = _PublishLoading;
  const factory PublishState.success() = _PublishSuccess;
  const factory PublishState.error(String message) = _PublishError;
}