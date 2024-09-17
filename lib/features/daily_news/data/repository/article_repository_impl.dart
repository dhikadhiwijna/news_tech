import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_us_tech/core/constants/constants.dart';
import 'package:news_us_tech/core/resources/data_state.dart';
import 'package:news_us_tech/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:news_us_tech/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_us_tech/features/daily_news/data/models/article.dart';
import 'package:news_us_tech/features/daily_news/domain/entities/article.dart';
import 'package:news_us_tech/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsAPIService _newsAPIService;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newsAPIService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsAPIService.getNewsArticles(
        apiKey: newsAPIKey,
        country: newsAPICountry,
        category: newsAPICategory,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(DioException(
        response: httpResponse.response,
        requestOptions: httpResponse.response.requestOptions,
        error: httpResponse.response.statusMessage,
        type: DioExceptionType.badResponse,
      ));
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<void> deleteArticle(ArticlesEntity article) async {
    return _appDatabase.articleDao
        .deleteArticles(ArticleModel.fromEntity(article));
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() async {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> saveArticle(ArticlesEntity article) {
    return _appDatabase.articleDao
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
