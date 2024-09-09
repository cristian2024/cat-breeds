import 'package:cat_breeds/core/data.dart';

class CatBreed {
  final String breedName;
  final String location;
  final int intelligence;
  final String description;
  final String lifeSpan;

  final Weight? weight;

  final String breedImageId;

  //urls
  final String? wikipediaURL;
  final String? vcaHospitalURL;
  final String? vetStreetURL;
  final String? cfaURL;

  final List<String> temperaments;

  bool get hasUrls {
    return wikipediaURL != null ||
        vcaHospitalURL != null ||
        vetStreetURL != null ||
        cfaURL != null;
  }

  const CatBreed({
    required this.breedName,
    required this.location,
    required this.intelligence,
    required this.description,
    required this.wikipediaURL,
    required this.vcaHospitalURL,
    required this.vetStreetURL,
    required this.cfaURL,
    required this.breedImageId,
    required this.temperaments,
    required this.lifeSpan,
    this.weight,
  });
}
