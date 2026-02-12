import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> cacheToken(String token) {
    // TODO: implement cacheToken
    throw UnimplementedError();
  }

  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<String> getCachedToken() {
    // TODO: implement getCachedToken
    throw UnimplementedError();
  }
}