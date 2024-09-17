import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_us_tech/core/utils/format_date.dart';
import 'package:news_us_tech/features/daily_news/domain/entities/article.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_us_tech/injection_container.dart';

class DetailArguments {
  final ArticlesEntity articlesEntity;

  DetailArguments(this.articlesEntity);
}

class DailyNewsDetail extends StatefulWidget {
  static const routeName = '/ArticleDetails';
  const DailyNewsDetail({Key? key}) : super(key: key);

  @override
  State<DailyNewsDetail> createState() => _DailyNewsDetailState();
}

class _DailyNewsDetailState extends State<DailyNewsDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(args),
        body: _buildBody(args),
        floatingActionButton: _buildFloatingActionButton(args),
      ),
    );
  }

  _buildFloatingActionButton(DetailArguments args) {
    return FloatingActionButton(
      onPressed: () {
        context.read<LocalArticleBloc>().add(
              InsertArticleEvent(args.articlesEntity),
            );
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Yay! data added')));
      },
      child: const Icon(
        Icons.bookmark,
        color: Colors.black,
      ),
    );
  }

  _buildAppBar(DetailArguments args) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildBody(DetailArguments args) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: args.articlesEntity.urlToImage ?? '',
            imageBuilder: (context, imageProvider) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )),
            progressIndicatorBuilder: (context, url, progress) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  color: Colors.black.withOpacity(0.08),
                  child: Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  color: Colors.black.withOpacity(0.08),
                  child: const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            args.articlesEntity.title ?? 'No Title Available',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(formatDate(args.articlesEntity.publishedAt!)),
          const SizedBox(height: 10),
          Text(args.articlesEntity.description ?? 'No Description Available'),
          Text(args.articlesEntity.content ?? 'No Content Available'),
        ],
      ),
    );
  }
}
