import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_us_tech/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:news_us_tech/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_us_tech/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_us_tech/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_us_tech/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_us_tech/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_us_tech/features/daily_news/domain/usecases/insert_article.dart';
import 'package:news_us_tech/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;
// This is the service locator instance that will be used to register and resolve dependencies.
Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsAPIService>(NewsAPIService(sl()));
  // Repositories
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));
  // Use cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<InsertArticleUseCase>(InsertArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}
