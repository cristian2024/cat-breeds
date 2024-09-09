import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds/core/domain.dart';
import 'package:cat_breeds/core/ui.dart';
import 'package:cat_breeds/features/cat_list/provider.dart';
import 'package:cat_breeds/features/cat_list/ui.dart';
import 'package:flutter/gestures.dart';
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
                    const SizedBox(height: 8),
                    SvgItem(
                      icon: AssetSVG.location,
                      title: 'Location',
                      text: catBreed.location,
                    ),
                    const SizedBox(height: 4),
                    SvgItem(
                      icon: AssetSVG.brain,
                      title: 'Intelligence',
                      text: catBreed.intelligence.toString(),
                    ),
                    const SizedBox(height: 4),
                    SvgItem(
                      icon: AssetSVG.brain,
                      title: 'Life span',
                      text: catBreed.lifeSpan,
                      suffixText: 'years',
                    ),
                    if (catBreed.weight != null) ...[
                      const SizedBox(height: 4),
                      SvgItem(
                        icon: AssetSVG.apple,
                        title: 'Weight',
                        text: catBreed.weight!.metric ?? '',
                        suffixText: 'Kg',
                      ),
                    ],
                    if (catBreed.temperaments.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Temperaments',
                        style: context.getTitleMedium(),
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 6,
                        runSpacing: 6,
                        children: catBreed.temperaments.map(
                          (temperament) {
                            return Chip(label: Text(temperament));
                          },
                        ).toList(),
                      )
                    ],
                    //validates if the breed has any available url
                    if (catBreed.hasUrls) ...[
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'See available links',
                          style: context.getTitleSmall().copyWith(
                                decoration: TextDecoration.underline,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showBreedUrls(context);
                            },
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            SafeArea(top: false, child: SizedBox()),
          ],
        ),
      ),
    );
  }

  void showBreedUrls(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final CatBreed(
          :wikipediaURL,
          :cfaURL,
          :vcaHospitalURL,
          :vetStreetURL,
        ) = catBreed;
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (wikipediaURL?.isNotEmpty ?? false)
                  CompanyWithIcon(
                    companyName: 'Wikipedia',
                    url: wikipediaURL!,
                    icon: AssetPNG.wikipediaIcon,
                  ),
                if (cfaURL?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 4),
                  CompanyWithIcon(
                    companyName: 'CFA',
                    url: cfaURL!,
                    icon: AssetPNG.cfaIcon,
                  ),
                ],
                if (vcaHospitalURL?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 4),
                  CompanyWithIcon(
                    companyName: 'VCA',
                    url: vcaHospitalURL!,
                    icon: AssetPNG.vcaIcon,
                  ),
                ],
                if (vetStreetURL?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 4),
                  CompanyWithIcon(
                    companyName: 'VetStreet',
                    url: vetStreetURL!,
                    icon: AssetPNG.vetStreetIcon,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
