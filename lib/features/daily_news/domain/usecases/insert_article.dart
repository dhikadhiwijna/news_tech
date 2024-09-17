import 'package:news_us_tech/core/usecases/usecases.dart';
import 'package:news_us_tech/features/daily_news/domain/entities/article.dart';
import 'package:news_us_tech/features/daily_news/domain/repository/article_repository.dart';

class InsertArticleUseCase implements UseCase<void, ArticlesEntity> {
  final ArticleRepository _articleRepository;

  InsertArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticlesEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}
