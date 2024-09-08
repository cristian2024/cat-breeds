// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'breed_image_cubit.dart';

class BreedImageState extends Equatable {
  const BreedImageState({
    this.imagesById = const {},
  });

  final Map<String, String> imagesById;
  

  @override
  List<Object> get props => [imagesById];

  BreedImageState copyWith({
    Map<String, String>? imagesById,
  }) {
    return BreedImageState(
      imagesById: imagesById ?? this.imagesById,
    );
  }
}
