import 'package:equatable/equatable.dart';
import 'package:news_us_tech/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticlesEntity>? article;

  const LocalArticleState({this.article});

  @override
  List<Object?> get props => [article];
}

class LocalArticlesLoading extends LocalArticleState {
  const LocalArticlesLoading() : super(article: null);
}

class LocalArticlesDone extends LocalArticleState {
  const LocalArticlesDone({List<ArticlesEntity> article = const []})
      : super(article: article);
}

class LocalArticlesError extends LocalArticleState {
  const LocalArticlesError() : super(article: null);
}
