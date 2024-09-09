import 'package:cat_breeds/core/data.dart';

class CatBreed {
  final String breedName;
  final String countryCodeOrigin;
  final int intelligence;
  final String description;

  final Weight? weight;

  final String breedImageId;

  //urls
  final String? wikipediaURL;
  final String? vcaHospitalURL;
  final String? vetStreetURL;
  final String? cfaURL;

  bool get hasUrls {
    return wikipediaURL != null &&
        vcaHospitalURL != null &&
        vetStreetURL != null &&
        cfaURL != null;
  }

  const CatBreed({
    required this.breedName,
    required this.countryCodeOrigin,
    required this.intelligence,
    required this.description,
    required this.wikipediaURL,
    required this.vcaHospitalURL,
    required this.vetStreetURL,
    required this.cfaURL,
    required this.breedImageId,
    this.weight,
  });
}
