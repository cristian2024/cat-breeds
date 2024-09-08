part of 'config_injection.dart';

T read<T extends Object>() {
  return _instance.get();
}
