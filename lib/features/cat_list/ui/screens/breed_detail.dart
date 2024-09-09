import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds/core/domain.dart';
import 'package:cat_breeds/core/ui.dart';
import 'package:cat_breeds/features/cat_list/provider.dart';
import 'package:cat_breeds/features/cat_list/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedDetailScreen extends StatelessWidget {
  const BreedDetailScreen(this.catBreed, {super.key});

  static const String routeName = 'breedDetail';
  static const String route = 'breed';
  static const String fullRoute = '${CatBreedsScreen.fullRoute}/$route';

  final CatBreed catBreed;

  @override
  Widget build(BuildContext context) {
    //due to the [obtainImage] on its cubit implementation,
    //it is not required to double check if the image is already loaded
    context.read<BreedImageCubit>().obtainImage(catBreed.breedImageId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          catBreed.breedName,
          style: context.getTitleLarge(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.getPrimarColor(),
                ),
                child: BlocBuilder<BreedImageCubit, BreedImageState>(
                  builder: (context, state) {
                    final image = state.imagesById[catBreed.breedImageId];
                    if (image == null) {
                      return AssetSVG.emotionless.getWidget(
                        context,
                        height: 300,
                      );
                    }
                    return CachedNetworkImage(imageUrl: image);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              //context
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Description:',
                      style: context.getTitleMedium(),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      catBreed.description,
                      style: context.getBodyMedium(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
