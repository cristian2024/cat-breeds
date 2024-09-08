import 'package:cat_breeds/core.dart' show EnvironmentConfig;
import 'package:dio/dio.dart';

Dio createDioClient() {
  return Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
      headers: {
        'x-api-key': EnvironmentConfig().envData.breedsApiKey,
        Headers.contentTypeHeader: 'application/json'
      },
    ),
  );
}
