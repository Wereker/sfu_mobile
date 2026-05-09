import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/core/error/auth_exception.dart';
import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/network_exception.dart';

abstract class ExceptionHandler {
  /// Оборачивает любой вызов, перехватывает нативные исключения
  /// и бросает доменные AppException
  static Future<T> handle<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on AppException {
      rethrow;
    } on DioException catch (e) {
      throw _fromDio(e);
    } on SocketException {
      throw const NetworkException();
    } on FormatException catch (e) {
      throw ParseException(details: e.message);
    } on Exception catch (e) {
      throw ServerException(details: e.toString());
    }
  }

  static AppException _fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutException();
      case DioExceptionType.connectionError:
        return const NetworkException();
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        if (code == 401) return const UnauthorizedException();
        if (code == 403) return const ForbiddenException();
        if (code == 404) return const NotFoundException();
        if (code == 409) return const ConflictException();
        return ServerException(statusCode: code);
      default:
        return ServerException(details: e.message);
    }
  }
}