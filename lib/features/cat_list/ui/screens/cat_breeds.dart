import 'package:cat_breeds/core/ui.dart';
import 'package:flutter/material.dart';

class CatBreedsScreen extends StatelessWidget {
  const CatBreedsScreen({super.key});

  static const String routeName = 'breeds';
  static const String route = 'breeds';
  static const String fullRoute = '/breeds';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          
          tag: 'cat_breeds_title',
          child: Text(
            "Cat breeds",
            style: context.getTitleLarge(),
          ),
        ),
      ),
    );
  }
}
