import 'package:cat_breeds/core/domain.dart';
import 'package:cat_breeds/core/data.dart';

class CatsRepositoryApi extends CatsRepository {
  final CatBreedsSource _source;

  CatsRepositoryApi(this._source);

  ///obtains the list of breeds of [page] with the specified [limit]
  @override
  Future<BreedPagination> getBreeds({
    int page = 1,
    int limit = 10,
  }) async {
    //TODO(Cristian) - Error validation
    //the breeds api start their search at page ==0
    final breeds = await _source.getBreeds(page - 1, limit);
    return BreedPagination(
      breeds: breeds,
      nextPage: page + 1,
    );
  }

  @override
  Future<List<CatBreedInfo>> searchBreeds({required String word}) {
    return _source.searchBreeds(word);
  }

  ///Obtains a single breed cat info referenced by its [breedId]
  @override
  Future<CatBreedInfo> getBreed(String breedId) async {
    return _source.getBreed(breedId);
  }

  ///Obtains the image associated to a breed by its [imageId]
  @override
  Future<BreedImage> getBreedImage(String imageId) {
    return _source.getImage(imageId);
  }
}
