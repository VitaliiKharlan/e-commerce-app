import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/repository/auth_repository.dart';
import '../../features/auth/repository/i_auth_repository.dart';
import '../logger/i_logger_service.dart';
import '../logger/logger_service.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  /// Logger
  sl.registerLazySingleton<ILoggerService>(() => LoggerService());

  /// Dio client
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://fakestoreapi.com',
        headers: {'Content-Type': 'application/json'},
      ),
    ),
  );

  /// Repository
  sl.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(sl<Dio>(), sl<ILoggerService>()),
  );
}
