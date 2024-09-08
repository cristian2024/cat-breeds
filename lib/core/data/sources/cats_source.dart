import 'package:cat_breeds/core/data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cats_source.g.dart';


@RestApi(baseUrl: "https://api.thecatapi.com/")
abstract class CatBreedsSource {
  factory CatBreedsSource(
    Dio dio, {
    String baseUrl,
  }) = _CatBreedsSource;

  @GET("v1/breeds")
  Future<List<CatBreedInfo>> getBreeds(
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @GET("v1/breeds/:breed")
  Future<CatBreedInfo> getBreed(
    @Path("breed") String breed,
  );
}
