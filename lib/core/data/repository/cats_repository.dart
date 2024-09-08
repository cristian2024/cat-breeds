import 'package:cat_breeds/core/domain.dart';
import 'package:cat_breeds/core/data.dart';

class CatsRepositoryApi extends CatsRepository {
  final CatBreedsSource _source;

  CatsRepositoryApi(this._source);

  ///obtains the list of breeds of [page] with the specified [limit]
  @override
  Future<BreedPagination> getBreeds({
    int page = 1,
    int? limit,
  }) async {
    //TODO(Cristian) - Error validation
    final breeds = await _source.getBreeds(page, limit);
    return BreedPagination(
      breeds: breeds,
      nextPage: page + 1,
    );
  }

  ///Obtains a single breed cat info referenced by its [breedId]
  @override
  Future<CatBreedInfo> getBreed(String breedId) async {
    return _source.getBreed(breedId);
  }
}
