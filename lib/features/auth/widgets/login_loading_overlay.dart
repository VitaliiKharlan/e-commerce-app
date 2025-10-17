import 'package:flutter/material.dart';

class LoginLoadingOverlay extends StatelessWidget {
  const LoginLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(80),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}