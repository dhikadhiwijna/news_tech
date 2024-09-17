import 'package:news_us_tech/core/resources/data_state.dart';
import 'package:news_us_tech/core/usecases/usecases.dart';
import 'package:news_us_tech/features/daily_news/domain/entities/article.dart';
import 'package:news_us_tech/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticlesEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticlesEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
