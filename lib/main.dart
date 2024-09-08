import 'package:cat_breeds/core/ui.dart';
import 'package:cat_breeds/features/cat_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  initialLocation: SplashScreen.fullRoute,
  routes: <RouteBase>[
    GoRoute(
      path: '/${SplashScreen.route}',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/${CatBreedsScreen.route}',
      name: CatBreedsScreen.routeName,
      builder: (context, state) {
        return const CatBreedsScreen();
      },
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: getLigthTheme(),
      routerConfig: _router,
    );
  }
}
