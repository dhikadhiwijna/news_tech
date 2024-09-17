import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_us_tech/features/daily_news/domain/entities/article.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_us_tech/features/daily_news/presentation/pages/article_detail/daily_news_detail.dart';
import 'package:news_us_tech/features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'package:news_us_tech/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatefulWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  State<DailyNews> createState() => _DailyNewsState();
}

class _DailyNewsState extends State<DailyNews> {
  @override
  void initState() {
    super.initState();
  }

  void _onArticlePressed(BuildContext context, ArticlesEntity article) {
    Navigator.pushNamed(context, DailyNewsDetail.routeName,
        arguments: DetailArguments(article));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
            builder: (context, state) {
          return IconButton(
            onPressed: () {
              if (state is RemoteArticlesLoading) {
                return;
              }
              if (state is RemoteArticlesDone) {
                state.articles!.clear();
              }
              context
                  .read<RemoteArticleBloc>()
                  .add(const GetRemoteArticlesEvent());
            },
            icon: const Icon(Icons.refresh),
          );
        }),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, SavedArticle.routeName);
          },
          icon: const Icon(
            Icons.bookmark,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is RemoteArticlesError) {
        return Column(
          children: [
            const Text('Error loading articles'),
            Text(state.error.toString()),
            GestureDetector(
              onTap: () {
                context
                    .read<RemoteArticleBloc>()
                    .add(const GetRemoteArticlesEvent());
              },
              child: const Center(
                child: Icon(Icons.refresh),
              ),
            ),
          ],
        );
      }

      if (state is RemoteArticlesDone) {
        if (state.articles!.isEmpty) {
          return const Center(
            child: Text('No articles found'),
          );
        }
        return ListView.builder(
          itemCount: state.articles!.length,
          itemBuilder: (_, index) {
            final article = state.articles![index];
            return GestureDetector(
                onTap: () => _onArticlePressed(context, state.articles![index]),
                child: ArticleWidget(article: article));
          },
        );
      }

      return const SizedBox();
    });
  }
}
