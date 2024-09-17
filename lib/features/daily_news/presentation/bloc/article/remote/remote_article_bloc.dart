import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_us_tech/core/resources/data_state.dart';
import 'package:news_us_tech/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetRemoteArticlesEvent>(onGetArticles);
    add(const GetRemoteArticlesEvent());
  }

  void onGetArticles(
      GetRemoteArticlesEvent event, Emitter<RemoteArticleState> emit) async {
    emit(const RemoteArticlesLoading());
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
