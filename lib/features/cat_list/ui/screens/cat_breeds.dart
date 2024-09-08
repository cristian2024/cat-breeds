import 'package:cat_breeds/core/ui.dart';
import 'package:cat_breeds/features/cat_list.dart';
import 'package:flutter/material.dart';

class CatBreedsScreen extends StatelessWidget {
  const CatBreedsScreen({super.key});

  static const String routeName = 'breeds';
  static const String route = 'breeds';
  static const String fullRoute = '/breeds';

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      create: (context) => BreedsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Hero(
            tag: 'cat_breeds_title',
            child: Text(
              "Cat breeds",
              style: context.getTitleLarge(),
            ),
          ),
        ),
        body: Column(
          children: [
            // TODO(Cristian) - Add searchbar
            const Text('Search bar'),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container();
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
