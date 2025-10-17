import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/features/auth/bloc/auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/locator.dart';
import '../../../core/logger/i_logger_service.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../repository/i_auth_repository.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController(
    text: 'johnd',
  );
  final TextEditingController passwordController = TextEditingController(
    text: 'm38rmF\$',
  );

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(sl<IAuthRepository>(), sl<ILoggerService>()),
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text('E-Commerce App'))),
        body: Center(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return state.when(
                initial:
                    () => ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      LoginRequestedEvent(
                        usernameController.text,
                        passwordController.text,
                      ),
                    );
                  },
                  child: const Text('Perform Login'),
                ),
                loading: () => const CircularProgressIndicator(),
                success:
                    (token) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Login Successful!'),
                    Text('Token: $token'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          LoginRequestedEvent(
                            usernameController.text,
                            passwordController.text,
                          ),
                        );
                      },
                      child: const Text('Perform Login Again'),
                    ),
                  ],
                ),
                failure:
                    (error) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          LoginRequestedEvent(
                            usernameController.text,
                            passwordController.text,
                          ),
                        );
                      },
                      child: const Text('Perform Login'),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Error: $error',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
