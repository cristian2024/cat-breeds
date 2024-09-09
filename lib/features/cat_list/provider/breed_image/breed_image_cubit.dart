import 'package:cat_breeds/core/data.dart';
import 'package:cat_breeds/core/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'breed_image_state.dart';

class BreedImageCubit extends Cubit<BreedImageState> {
  BreedImageCubit(this._repository) : super(const BreedImageState());

  final CatsRepository _repository;

  void obtainImage(String imageId) async {
    try {
      if (state.imagesById.containsKey(imageId)) {
        //if the image is already loaded, it is not necessary to load it again
        return;
      }
      final BreedImage(:id, :url) = await _repository.getBreedImage(imageId);
      final images = {...state.imagesById, id: url};
      emit(state.copyWith(imagesById: images));
    } catch (_) {}
  }
}
