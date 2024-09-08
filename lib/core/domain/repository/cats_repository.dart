import 'package:cat_breeds/core/data.dart';

abstract class CatsRepository {
  ///obtains the list of breeds of [page] with the specified [limit]
  Future<BreedPagination> getBreeds({
    int page = 1,
    int limit=10,
  });

  ///Obtains a single breed cat info referenced by its [breedId]
  Future<CatBreedInfo> getBreed(String breedId);
}
