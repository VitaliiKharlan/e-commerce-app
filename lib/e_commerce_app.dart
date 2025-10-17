import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/locator.dart';
import 'core/logger/i_logger_service.dart';
import 'core/router/router.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/repository/i_auth_repository.dart';


class ECommerceApp extends StatelessWidget {
  final _router = AppRouter();

  ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(sl<IAuthRepository>(), sl<ILoggerService>()),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'E-Commerce App',
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }
}
