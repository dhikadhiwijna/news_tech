import 'package:floor/floor.dart';
import 'package:news_us_tech/features/daily_news/data/models/article.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @Query('SELECT * FROM articles')
  Future<List<ArticleModel>> getArticles();

  @delete
  Future<void> deleteArticles(ArticleModel article);
}
