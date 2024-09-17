import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_us_tech/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticlesEntity>? articles;
  final DioException? error;

  const RemoteArticleState({
    this.articles,
    this.error,
  });

  @override
  List<Object?> get props => [articles ?? [], error];
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticlesEntity> articles)
      : super(articles: articles);
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioException error) : super(error: error);
}
