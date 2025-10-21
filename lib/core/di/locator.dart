import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/repository/auth_repository.dart';
import '../../features/auth/repository/i_auth_repository.dart';
import '../../features/product/bloc/product_bloc.dart';
import '../../features/product/data_sources/i_product_remote_data_sources.dart';
import '../../features/product/data_sources/product_remote_data_sources.dart';
import '../../features/product/repository/i_product_repository.dart';
import '../../features/product/repository/product_repository.dart';
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
  sl.registerLazySingleton<IProductRemoteDataSource>(
        () => ProductRemoteDataSource(sl<Dio>()),
  );
  sl.registerLazySingleton<IProductRepository>(
        () => ProductRepository(sl<IProductRemoteDataSource>()),
  );

  /// Bloc
  sl.registerFactory<ProductBloc>(
        () => ProductBloc(sl<IProductRepository>(), sl<ILoggerService>()),
  );
}
