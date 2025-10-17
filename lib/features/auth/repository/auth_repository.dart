import 'package:dio/dio.dart';

import '../../../core/logger/i_logger_service.dart';
import 'i_auth_repository.dart';

class AuthRepository implements IAuthRepository{
  final Dio _dio;
  final ILoggerService _logger;

  AuthRepository(this._dio, this._logger);

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
    final response = await _dio.post(
      '/auth/login',
      data: {'username': username, 'password': password},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    _logger.log(
      'Login successful: ${response.data}',
      logLevel: LogLevel.info,
    );
    return response.data;
  } on DioException catch (e,s) {
      _logger.log(
        'Authorization error: ${e.response?.statusCode ?? e.message}',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.error,
      );
      throw Exception('Authorization error: ${e.response?.statusCode ?? e.message}');
    }
  }
}