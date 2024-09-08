import 'package:cat_breeds/core.dart' show CatBreedsSource, createDioClient;
import 'package:get_it/get_it.dart';

part 'reader_injector.dart';

GetIt _instance = GetIt.asNewInstance();

void configInjection() {
  _setupSourcesAndOthers();
  _setupRepositories();
}

void _setupSourcesAndOthers() {
  final dio = createDioClient();
  _instance.registerSingleton<CatBreedsSource>(CatBreedsSource(dio));
}

void _setupRepositories() {
  //this repository needs [CatBreedsSource] already on the injector
  _instance.registerSingleton(read());
}
