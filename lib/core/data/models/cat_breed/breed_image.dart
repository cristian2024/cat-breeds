// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'breed_image.g.dart';

@JsonSerializable()
class BreedImage {
  final String id;
  final String url;

  BreedImage({
    required this.id,
    required this.url,
  });

  factory BreedImage.fromJson(Map<String, dynamic> json) =>
      _$BreedImageFromJson(json);

  Map<String, dynamic> toJson() => _$BreedImageToJson(this);
}
