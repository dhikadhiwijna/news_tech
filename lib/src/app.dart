import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_us_tech/config/theme/app_themes.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_us_tech/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_us_tech/features/daily_news/presentation/pages/article_detail/daily_news_detail.dart';
import 'package:news_us_tech/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_us_tech/features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'package:news_us_tech/injection_container.dart';
import 'package:news_us_tech/src/settings/settings_view.dart';

import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RemoteArticleBloc>(create: (_) => sl()),
          BlocProvider<LocalArticleBloc>(create: (_) => sl()),
        ],
        child: ListenableBuilder(
          listenable: settingsController,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              // Providing a restorationScopeId allows the Navigator built by the
              // MaterialApp to restore the navigation stack when a user leaves and
              // returns to the app after it has been killed while running in the
              // background.
              restorationScopeId: 'app',

              // Provide the generated AppLocalizations to the MaterialApp. This
              // allows descendant Widgets to display the correct translations
              // depending on the user's locale.
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,

              // Define a light and dark color theme. Then, read the user's
              // preferred ThemeMode (light, dark, or system default) from the
              // SettingsController to display the correct theme.
              theme: theme(),
              darkTheme: darkTheme(),
              themeMode: settingsController.themeMode,
              home: const DailyNews(),
              routes: {
                DailyNewsDetail.routeName: (context) => const DailyNewsDetail(),
                SavedArticle.routeName: (context) => const SavedArticle(),
                SettingsView.routeName: (context) => SettingsView(
                      settingsController: settingsController,
                      controller: settingsController,
                    ),
              },
            );
          },
        ));
  }
}
