// ignore_for_file: public_member_api_docs, sort_constructors_first
class CatBreed {
  final String breedName;
  final String countryCodeOrigin;
  final int intelligence;

  final String description;

  String? breedImage;
  final String breedImageId;

  CatBreed({
    required this.breedName,
    required this.description,
    this.breedImage,
    required this.countryCodeOrigin,
    required this.intelligence,
    required this.breedImageId,
  });
}
