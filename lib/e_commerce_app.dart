import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('E-Commerce App'))),
        body: Center(
          child: Text(
            'Get Started \nE-Commerce App',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
