import 'package:cat_breeds/core/domain.dart';
import 'package:json_annotation/json_annotation.dart';
import 'weight.dart';

part 'cat_breed_model.g.dart';

@JsonSerializable()
class CatBreedInfo {
  @JsonKey(name: 'weight')
  final Weight? weight;

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'cfa_url')
  final String? cfaUrl;

  @JsonKey(name: 'vetstreet_url')
  final String? vetstreetUrl;

  @JsonKey(name: 'vcahospitals_url')
  final String? vcahospitalsUrl;

  @JsonKey(name: 'temperament')
  final String? temperament;

  @JsonKey(name: 'origin')
  final String? origin;

  @JsonKey(name: 'country_codes')
  final String? countryCodes;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'life_span')
  final String? lifeSpan;

  @JsonKey(name: 'indoor')
  final int? indoor;

  @JsonKey(name: 'lap')
  final int? lap;

  @JsonKey(name: 'alt_names')
  final String? altNames;

  @JsonKey(name: 'adaptability')
  final int? adaptability;

  @JsonKey(name: 'affection_level')
  final int? affectionLevel;

  @JsonKey(name: 'child_friendly')
  final int? childFriendly;

  @JsonKey(name: 'dog_friendly')
  final int? dogFriendly;

  @JsonKey(name: 'energy_level')
  final int? energyLevel;

  @JsonKey(name: 'grooming')
  final int? grooming;

  @JsonKey(name: 'health_issues')
  final int? healthIssues;

  @JsonKey(name: 'intelligence')
  final int? intelligence;

  @JsonKey(name: 'shedding_level')
  final int? sheddingLevel;

  @JsonKey(name: 'social_needs')
  final int? socialNeeds;

  @JsonKey(name: 'stranger_friendly')
  final int? strangerFriendly;

  @JsonKey(name: 'vocalisation')
  final int? vocalisation;

  @JsonKey(name: 'experimental')
  final int? experimental;

  @JsonKey(name: 'hairless')
  final int? hairless;

  @JsonKey(name: 'natural')
  final int? natural;

  @JsonKey(name: 'rare')
  final int? rare;

  @JsonKey(name: 'rex')
  final int? rex;

  @JsonKey(name: 'suppressed_tail')
  final int? suppressedTail;

  @JsonKey(name: 'short_legs')
  final int? shortLegs;

  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;

  @JsonKey(name: 'hypoallergenic')
  final int? hypoallergenic;

  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;

  const CatBreedInfo({
    this.weight,
    this.id,
    this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
  });

  factory CatBreedInfo.fromJson(Map<String, dynamic> json) =>
      _$CatBreedInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CatBreedInfoToJson(this);

  /// parser to UI usable entity
  CatBreed toCatBreed() {
    return CatBreed(
        description: description ?? '',
        breedImageId: referenceImageId ?? '',
        breedName: name ?? '',
        location: origin ?? '',
        intelligence: intelligence ?? 0,
        cfaURL: cfaUrl,
        vcaHospitalURL: vcahospitalsUrl,
        wikipediaURL: wikipediaUrl,
        vetStreetURL: vetstreetUrl,
        weight: weight);
  }
}
