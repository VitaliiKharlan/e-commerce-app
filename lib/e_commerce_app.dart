import 'package:e_commerce_app/router/router.dart';
import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  final _router = AppRouter();
  ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      routerConfig: _router.config(),
    );
  }
}


