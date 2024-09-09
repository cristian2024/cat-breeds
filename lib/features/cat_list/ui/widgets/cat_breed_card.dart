import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds/core/domain.dart';
import 'package:cat_breeds/core/ui.dart';
import 'package:cat_breeds/features/cat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedCard extends StatelessWidget {
  const CatBreedCard({
    super.key,
    required this.imageId,
    required this.breedName,
    required this.location,
    required this.intelligence,
    required this.onClickCard,
  });

  final String imageId;
  final String breedName;
  final String location;
  final int intelligence;

  final VoidCallback onClickCard;

  factory CatBreedCard.fromCatBreed(
    CatBreed breed, {
    required VoidCallback onClickCard,
  }) {
    return CatBreedCard(
      breedName: breed.breedName,
      imageId: breed.breedImageId,
      intelligence: breed.intelligence,
      location: breed.countryCodeOrigin,
      onClickCard: onClickCard,
    );
  }

  @override
  Widget build(BuildContext context) {
    //due to the [obtainImage] on its cubit implementation,
    //it is not required to double check if the image is already loaded
    context.read<BreedImageCubit>().obtainImage(imageId);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onClickCard,
        borderRadius: BorderRadius.circular(16),
        child: BlocBuilder<BreedImageCubit, BreedImageState>(
          builder: (context, state) {
            final image = state.imagesById[imageId];
            if (image != null) {
              return _CatBreedInfo(
                imageUrl: image,
                breedName: breedName,
                location: location,
                intelligence: intelligence,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _CatBreedInfo extends StatelessWidget {
  const _CatBreedInfo({
    required this.imageUrl,
    required this.breedName,
    required this.location,
    required this.intelligence,
  });

  final String imageUrl;
  final String breedName;
  final String location;
  final int intelligence;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //cat image
          Container(
            decoration: BoxDecoration(
              color: context.getPrimarColor(),
              borderRadius: BorderRadius.circular(4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 300,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            breedName,
            textAlign: TextAlign.center,
            style: context.getTitleSmall(),
          ),
          const SizedBox(height: 8),
          _SvgItem(
            icon: AssetSVG.location,
            title: 'Location',
            text: location,
          ),
          const SizedBox(height: 4),
          _SvgItem(
            icon: AssetSVG.brain,
            title: 'Intelligence',
            text: intelligence.toString(),
          ),

          const SizedBox(height: 4),
          Text(
            'See More',
            style: context.getLabelLarge(),
          )
        ],
      ),
    );
  }
}

class _SvgItem extends StatelessWidget {
  const _SvgItem({
    required this.text,
    required this.icon,
    required this.title,
  });

  final String title;
  final String text;
  final AssetSVG icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Center(
            child: icon.getWidget(
              context,
              height: 18,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$title: ',
              style: context.getBodyLarge().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              text,
              style: context.getBodyMedium(),
            ),
          ],
        ),
      ],
    );
  }
}
