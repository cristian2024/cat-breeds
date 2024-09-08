import 'package:cat_breeds/core.dart' show EnvironmentConfig;
import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor {
  /// The Retrofit implementation does not automatically add the global headers.
  /// This interceptor ensures that the required headers are included in every request.

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'x-api-key': EnvironmentConfig().envData.breedsApiKey,
      Headers.contentTypeHeader: 'application/json'
    });

    super.onRequest(options, handler);
  }
}
