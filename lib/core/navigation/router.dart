import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/widgets/app_shell.dart';
import 'package:news_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:news_app/features/auth/presentation/screens/login_screen.dart';
import 'package:news_app/features/auth/presentation/screens/signup_screen.dart'; // Import the new screen
import 'package:news_app/features/news_feed/presentation/screens/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup', // NEW ROUTE
        builder: (context, state) => const SignUpScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return AppShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final isLoggedIn = authState.asData?.value != null;
      final isAuthenticating = state.matchedLocation == '/login' || state.matchedLocation == '/signup';

      if (!isLoggedIn && !isAuthenticating) return '/login';
      if (isLoggedIn && isAuthenticating) return '/home';

      return null;
    },
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.error}'),
      ),
    ),
  );
});