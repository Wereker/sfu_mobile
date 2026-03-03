import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/news/domain/entity/news.dart';
import 'package:sfu/src/feature/news/domain/use_case/news_load_data_use_case.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsLoadDataUseCase loadDataUseCase;

  NewsBloc(this.loadDataUseCase) : super(NewsState.initial()) {
    on<NewsEvent>(_onEvent);
  }

  Future<void> _onEvent(NewsEvent event, Emitter<NewsState> emit) async {
    await event.when(
      loadData: () async {
        emit(NewsState.loading());

        try {
          final news = await loadDataUseCase.call();
          emit(NewsState.success(news));
        } catch (_) {
          emit(NewsState.error(error: 'Ошибка загрузки новостей'));
        }
      },
    );
  }
}
