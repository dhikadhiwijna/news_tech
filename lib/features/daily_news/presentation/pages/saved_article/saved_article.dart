import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_us_tech/features/daily_news/domain/entities/article.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:news_us_tech/features/daily_news/presentation/pages/article_detail/daily_news_detail.dart';
import 'package:news_us_tech/features/daily_news/presentation/widgets/article_tile.dart';

class SavedArticle extends StatefulWidget {
  static const routeName = '/local';
  const SavedArticle({Key? key}) : super(key: key);

  @override
  State<SavedArticle> createState() => _SavedArticleState();
}

class _SavedArticleState extends State<SavedArticle> {
  @override
  void initState() {
    super.initState();
    context.read<LocalArticleBloc>().add(GetSavedArticlesEvent());
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
        'Bookmarked Articles',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.read<LocalArticleBloc>().add(GetSavedArticlesEvent());
          },
          icon: const Icon(
            Icons.refresh,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<LocalArticleBloc, LocalArticleState>(
        builder: (_, state) {
      if (state is LocalArticlesLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is LocalArticlesDone) {
        if (state.article!.isEmpty) {
          return const Center(
            child: Text('No Bookmarked Articles'),
          );
        }
        return ListView.builder(
          itemCount: state.article!.length,
          itemBuilder: (_, index) {
            final article = state.article![index];
            return GestureDetector(
                onTap: () => _onArticlePressed(context, state.article![index]),
                child: ArticleWidget(
                    article: article,
                    onPressedDelete: () {
                      context.read<LocalArticleBloc>().add(
                            RemoveArticleEvent(article),
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Yay! data deleted')));
                    }));
          },
        );
      }

      return const SizedBox();
    });
  }
}
