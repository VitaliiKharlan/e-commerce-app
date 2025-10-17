import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/features/auth/bloc/auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../core/router/router.dart';
import '../bloc/auth_state.dart';

import '../widgets/login_button_widget.dart';
import '../widgets/login_loading_overlay.dart';
import '../widgets/login_password_field_widget.dart';
import '../widgets/login_username_field_widget.dart';
import '../widgets/login_welcome_header.dart';

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
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.sp),
          onPressed: () => context.router.pop(),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  const LoginWelcomeHeaderWidget(),
                  SizedBox(height: 48.h),
                  LoginUsernameFieldWidget(controller: usernameController),
                  SizedBox(height: 16.h),
                  LoginPasswordFieldWidget(
                    controller: passwordController,
                    isPasswordVisible: _isPasswordVisible,
                    onToggleVisibility:
                        () => setState(
                          () => _isPasswordVisible = !_isPasswordVisible,
                        ),
                  ),
                  SizedBox(height: 32.h),
                  LoginButtonWidget(
                    usernameController: usernameController,
                    passwordController: passwordController,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                state.when(
                  initial: () {},
                  loading: () {},
                  success:
                      (token) {
                        context.router.replace(const MainRoute());
                      },
                  failure:
                      (error) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('❌ Error: $error'),
                          backgroundColor: Colors.red,
                        ),
                      ),
                );
              },
              builder:
                  (context, state) => state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const LoginLoadingOverlay(),
                    success: (_) => const SizedBox.shrink(),
                    failure: (_) => const SizedBox.shrink(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
