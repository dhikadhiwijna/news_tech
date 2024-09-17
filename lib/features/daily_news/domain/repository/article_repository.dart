import 'package:news_us_tech/core/resources/data_state.dart';
import 'package:news_us_tech/features/daily_news/data/models/article.dart';
import 'package:news_us_tech/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleModel>>> getNewsArticles();

  Future<List<ArticlesEntity>> getSavedArticles();
  Future<void> saveArticle(ArticlesEntity article);
  Future<void> deleteArticle(ArticlesEntity article);
}
