import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logger/i_logger_service.dart';
import '../../auth/repository/i_auth_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  final ILoggerService _logger;

  AuthBloc(this._authRepository, this._logger)
    : super(const AuthState.initial()) {
    on<LoginRequestedEvent>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final result = await _authRepository.login(
          event.username,
          event.password,
        );
        final token = result['token'] as String;
        _logger.log(
          'User logged in with token: $token',
          logLevel: LogLevel.info,
        );
        emit(AuthState.success(token: token));
      } catch (e, s) {
        _logger.log(
          'Login failed: $e',
          error: e,
          stackTrace: s,
          logLevel: LogLevel.error,
        );
        emit(AuthState.failure(error: e.toString()));
      }
    });
  }
}
