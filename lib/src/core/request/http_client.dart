import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/core/auth/data/dto/token_dto.dart';
import 'package:sfu/src/core/error/auth_exception.dart';

/// Публичный Dio-клиент — без заголовка Authorization.
/// Используется для эндпоинтов аутентификации: sign-in, sign-up, refresh.
Dio buildPublicClient() {
  final baseUrl = dotenv.env['API_BASE_URL'] ?? '';

  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
}

/// Авторизованный Dio-клиент — добавляет заголовок `Authorization: Bearer <token>`
/// перед каждым запросом, читая актуальный access-токен из [AuthLocalDataSource].
///
/// Используется для всех защищённых эндпоинтов.
Dio buildAuthorizedClient(AuthLocalDataSource localDataSource, Dio publicClient, GlobalKey<NavigatorState> navigatorKey,) {
  final baseUrl = dotenv.env['API_BASE_URL'] ?? '';

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(_AuthInterceptor(localDataSource, publicClient, navigatorKey));
  return dio;
}

/// Интерцептор, добавляющий Bearer-токен к каждому запросу.
/// Если access-токен отсутствует — бросает [UnauthorizedException].
class _AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _localDataSource;
  final Dio _publicClient;
  final GlobalKey<NavigatorState> _navigatorKey;

  _AuthInterceptor(this._localDataSource, this._publicClient, this._navigatorKey);

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final token = await _localDataSource.getAccessToken();

    if (token == null) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.badResponse,
          error: const UnauthorizedException(),
        ),
        true,
      );
    }

    options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final refreshToken = await _localDataSource.getRefreshToken();

    if (refreshToken == null) {
      await _localDataSource.clear();
      _redirectToSignIn();

      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          type: DioExceptionType.badResponse,
          error: const UnauthorizedException(),
        ),
      );
    }

    try {
      final response = await _publicClient.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );

      final newToken = TokenDTO.fromJson(response.data!);
      await _localDataSource.cacheAccessToken(newToken.access);
      await _localDataSource.cacheRefreshToken(newToken.refresh);

      err.requestOptions.headers['Authorization'] = 'Bearer ${newToken.access}';

      final retryResponse = await _publicClient.fetch(err.requestOptions);
      return handler.resolve(retryResponse);

    } on DioException {
      await _localDataSource.clear();
      _redirectToSignIn();
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          type: DioExceptionType.badResponse,
          error: const UnauthorizedException(),
        ),
      );
    }
  }

  void _redirectToSignIn() {
    _navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/signIn',
          (route) => false,
    );
  }
}
