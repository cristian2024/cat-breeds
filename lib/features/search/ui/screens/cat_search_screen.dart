import 'package:cat_breeds/core/domain.dart';
import 'package:cat_breeds/core/ui.dart';

import 'package:cat_breeds/features/cat_list/ui.dart';
import 'package:cat_breeds/features/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchBreed extends StatelessWidget {
  const SearchBreed({
    super.key,
    required this.initialWord,
  });

  final String initialWord;

  static const String routeName = 'search';
  static const String route = 'breeds_search/:word';
  static const String fullRoute = '${CatBreedsScreen.fullRoute}/$route';

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider<SearchBreedCubit, SearchBreedState>(
      create: (context) => SearchBreedCubit(
        read(),
        initialWord: initialWord,
      )..search(),
      child: _SearchBody(initialWord),
    );
  }
}

class _SearchBody extends StatefulWidget {
  const _SearchBody(this.word);

  final String word;

  @override
  State<_SearchBody> createState() => __SearchBodyState();
}

class __SearchBodyState extends State<_SearchBody> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.word;
    _controller.addListener(() {
      context.read<SearchBreedCubit>().changeWord(_controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CatBreedsBase(
      titleExtra: 'Search',
      controller: _controller,
      onSearch: (word) {
        context.read<SearchBreedCubit>().search(
              word: _controller.text,
            );
      },
      child: BlocBuilder<SearchBreedCubit, SearchBreedState>(
        builder: (context, state) {
          final SearchBreedState(:cats, :status) = state;
          if (status.isLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (cats.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetSVG.emotionless.getWidget(
                  context,
                  height: 250,
                ),
                Text(
                  "No cat breed found containing '${state.lastSearchedWord}' word",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            );
          }
          return ListView.builder(
            itemCount: cats.length,
            itemBuilder: (context, index) {
              final breed = cats[index];
              return CatBreedCard.fromCatBreed(
                breed,
                onClickCard: () {
                  context.goNamed(
                    BreedDetailScreen.routeName,
                    extra: breed,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
