part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _NewsInitial;

  const factory NewsState.loading() = _NewsLoading;

  const factory NewsState.success(List<News> news) = _NewsSucces;

  const factory NewsState.error({required String error})= _NewsError;
}