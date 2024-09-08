class _Configuration {
  static const String breedsApiKey = String.fromEnvironment('breeds_api_key');
  static const String breedsApiUrl = String.fromEnvironment('breeds_api_url');
  static const String breedsImageBase = String.fromEnvironment('breed_image_base');
}

///environment configuration singleton
///all the important and sensible information required for the project
///is stored within this item
class EnvironmentConfig {
  static final _singleton = EnvironmentConfig._internal(
    EnvData(
      _Configuration.breedsApiKey,
      _Configuration.breedsApiUrl,
      _Configuration.breedsImageBase,
    ),
  );

  factory EnvironmentConfig() {
    return _singleton;
  }

  EnvironmentConfig._internal(this.envData);

  final EnvData envData;
}

class EnvData {
  final String breedsApiKey;
  final String breedsApiUrl;
  final String breedsImageBase;

  EnvData(
    this.breedsApiKey,
    this.breedsApiUrl,
    this.breedsImageBase
  );
}
