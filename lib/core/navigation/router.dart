import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/widgets/app_shell.dart';
import 'package:news_app/domain/entities/article.dart';
import 'package:news_app/features/article_detail/presentation/screens/article_detail_screen.dart';
import 'package:news_app/features/article_detail/presentation/screens/article_webview_screen.dart';
import 'package:news_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:news_app/features/auth/presentation/screens/login_screen.dart';
import 'package:news_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:news_app/features/news_feed/presentation/screens/home_screen.dart';
import 'package:news_app/features/saved_articles/presentation/screens/saved_articles_screen.dart';
import 'package:news_app/features/search/presentation/screens/search_screen.dart';
import 'package:news_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:news_app/features/settings/presentation/screens/notification_settings_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/signup', builder: (context, state) => const SignUpScreen()),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return AppShell(child: child);
        },
        routes: [
          GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
          GoRoute(path: '/saved', builder: (context, state) => const SavedArticlesScreen()),
          GoRoute(path: '/profile', builder: (context, state) => const SettingsScreen()),
        ],
      ),
      GoRoute(path: '/search', builder: (context, state) => const SearchScreen()),
      GoRoute(path: '/article_detail', builder: (context, state) { final article = state.extra as Article; return ArticleDetailScreen(article: article); }),
      GoRoute(path: '/article_webview', builder: (context, state) { final url = state.extra as String; return ArticleWebViewScreen(url: url); }),
      GoRoute(path: '/settings/notifications', builder: (context, state) => const NotificationSettingsScreen()),
    ],
    redirect: (context, state) {
      final isLoggedIn = authState.asData?.value != null;
      final isAuthenticating = state.matchedLocation == '/login' || state.matchedLocation == '/signup';

      if (!isLoggedIn && !isAuthenticating) return '/login';
      if (isLoggedIn && isAuthenticating) return '/home';

      return null;
    },
  );
});
