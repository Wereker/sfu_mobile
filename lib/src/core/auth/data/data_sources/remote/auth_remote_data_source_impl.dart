import 'package:dio/dio.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:sfu/src/core/auth/data/dto/auth_user_data.dart';
import 'package:sfu/src/core/auth/data/dto/token_dto.dart';
import 'package:sfu/src/core/error/auth_exception.dart';
import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  /// Публичный клиент — без заголовка Authorization.
  final Dio _publicClient;

  /// Авторизованный клиент — автоматически добавляет Bearer-токен.
  final Dio _authorizedClient;

  const AuthRemoteDataSourceImpl({
    required Dio publicClient,
    required Dio authorizedClient,
  })  : _publicClient = publicClient,
        _authorizedClient = authorizedClient;

  /// Авторизация по логину и паролю.
  ///
  /// Бросает:
  /// - [InvalidCredentialsException] — при 401 (неверный логин/пароль).
  /// - [NetworkException] / [TimeoutException] / [ServerException] — прочие сетевые ошибки.
  @override
  Future<TokenDTO> signIn(String email, String password) =>
      ExceptionHandler.handle(() async {
        final response = await _publicClient.post<Map<String, dynamic>>(
          '/auth/login',
          data: FormData.fromMap({
            'grant_type': 'password',
            'username': email,
            'password': password,
            'scope': '',
            'client_id': '',
            'client_secret': '',
          }),
          options: Options(
            contentType: 'application/x-www-form-urlencoded',
          ),
        );
        return _parseToken(response);
      });

  /// Регистрация нового пользователя.
  ///
  /// Бросает:
  /// - [ConflictException] — при 409 (пользователь уже существует).
  /// - [ValidationException] — при 422 (невалидные данные).
  @override
  Future<TokenDTO> signUp(
    String email,
    String password,
    String name,
    String group,
    String subgroup,
    String role,
  ) =>
      ExceptionHandler.handle(() async {
        final response = await _publicClient.post<Map<String, dynamic>>(
          '/auth/sign-up',
          data: {
            'email': email,
            'password': password,
            'name': name,
            'group': group,
            'subgroup': subgroup,
            'role': role,
          },
        );

        return _parseToken(response);
      });

  /// Сброс пароля для авторизованного пользователя.
  ///
  /// Бросает:
  /// - [UnauthorizedException] — если access-токен отсутствует или истёк.
  @override
  Future<void> resetPassword(String newPassword) =>
      ExceptionHandler.handle(() async {
        await _authorizedClient.post<void>(
          '/auth/reset-password',
          data: {'password': newPassword},
        );
      });

  /// Обновление токенов по refresh-токену.
  ///
  /// Бросает:
  /// - [UnauthorizedException] — при 401 (refresh-токен истёк или невалиден).
  @override
  Future<TokenDTO> refreshToken(String token) =>
      ExceptionHandler.handle(() async {
        final response = await _publicClient.post<Map<String, dynamic>>(
          '/auth/refresh',
          data: {'refresh_token': token},
        );

        return _parseToken(response);
      });

  /// Получение метаданных пользователя по UID.
  ///
  /// Бросает:
  /// - [NotFoundException] — при 404 (пользователь не найден).
  /// - [UnauthorizedException] — если токен отсутствует или истёк.
  @override
  Future<AuthMetadataDTO> getUserData(String uid) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient.get<Map<String, dynamic>>(
          '/users/$uid',
        );

        final data = response.data;
        if (data == null) {
          throw const ParseException(details: 'getUserData: response body is null');
        }

        return AuthMetadataDTO.fromJson(data);
      });

  // ---------------------------------------------------------------------------
  // Вспомогательные методы
  // ---------------------------------------------------------------------------

  TokenDTO _parseToken(Response<Map<String, dynamic>> response) {
    final data = response.data;
    if (data == null) {
      throw const ParseException(details: '_parseToken: response body is null');
    }
    return TokenDTO.fromJson(data);
  }
}
