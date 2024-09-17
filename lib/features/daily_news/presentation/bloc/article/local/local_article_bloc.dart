import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_us_tech/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_us_tech/features/daily_news/domain/usecases/insert_article.dart';
import 'package:news_us_tech/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final InsertArticleUseCase _insertArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._insertArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<InsertArticleEvent>(onInsertArticle);
    on<RemoveArticleEvent>(onRemoveArticle);
    on<GetSavedArticlesEvent>(onGetSavedArticles);
  }

  void onInsertArticle(
      InsertArticleEvent event, Emitter<LocalArticleState> emit) async {
    await _insertArticleUseCase(params: event.article!);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(article: articles));
  }

  void onRemoveArticle(
      RemoveArticleEvent event, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: event.article!);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(article: articles));
  }

  void onGetSavedArticles(
      GetSavedArticlesEvent event, Emitter<LocalArticleState> emit) async {
    emit(const LocalArticlesLoading());
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(article: articles));
  }
}
