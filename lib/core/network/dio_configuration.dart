import 'package:cat_breeds/core.dart' show HeaderInterceptor;
import 'package:dio/dio.dart';


///creates the basic Dio client for the Cat Breeds api
Dio createDioClient() {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ),
  );
  dio.interceptors.add(HeaderInterceptor());
  return dio;
}
