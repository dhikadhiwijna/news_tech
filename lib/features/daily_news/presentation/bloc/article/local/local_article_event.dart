import 'package:equatable/equatable.dart';
import 'package:news_us_tech/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticlesEntity? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object?> get props => [article];
}

class InsertArticleEvent extends LocalArticleEvent {
  const InsertArticleEvent(ArticlesEntity article) : super(article: article);
}

class RemoveArticleEvent extends LocalArticleEvent {
  const RemoveArticleEvent(ArticlesEntity article) : super(article: article);
}

class GetSavedArticlesEvent extends LocalArticleEvent {}
