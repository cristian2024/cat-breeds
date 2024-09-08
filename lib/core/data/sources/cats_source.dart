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

  @GET("v1/breeds/search")
  Future<List<CatBreedInfo>> searchBreeds(
    @Query("q") String word,
  );

  @GET("v1/breeds/{breed}")
  Future<CatBreedInfo> getBreed(
    @Path("breed") String breed,
  );

  /// the [attach_image] query parameter does not work
  /// thus, the image must be searched separately
  @GET("v1/images/{image_id}")
  Future<BreedImage> getImage(
    @Path("image_id") String imageId,
  );
}
