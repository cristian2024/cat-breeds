import 'package:cat_breeds/core.dart'
    show EnvironmentConfig, configInjection, read;
import 'package:cat_breeds/core/domain.dart';
import 'package:cat_breeds/core/ui.dart';
import 'package:cat_breeds/features/cat_list.dart';
import 'package:cat_breeds/features/search.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  //calling the EnvironmentConfig for the first try
  //forcing it to create its data
  EnvironmentConfig();

  configInjection();
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
      routes: [
        GoRoute(
          path: SearchBreed.route,
          name: SearchBreed.routeName,
          builder: (context, state) {
            final word = state.pathParameters['word'];
            return SearchBreed(
              initialWord: word ?? '',
            );
          },
        ),
        GoRoute(
          path: BreedDetailScreen.route,
          name: BreedDetailScreen.routeName,
          builder: (context, state) {
            final catBreed = state.extra as CatBreed;
            return BreedDetailScreen(catBreed);
          },
        ),
      ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BreedImageCubit(read())),
      ],
      child: MaterialApp.router(
        supportedLocales: const [
          Locale('en'),
        ],
        localizationsDelegates: const [
          CountryLocalizations.delegate,
        ],
        theme: getLigthTheme(),
        routerConfig: _router,
      ),
    );
  }
}
