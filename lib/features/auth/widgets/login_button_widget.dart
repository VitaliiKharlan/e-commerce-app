
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class LoginButtonWidget extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginButtonWidget({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
        ),
        onPressed: () {
          context.read<AuthBloc>().add(
            LoginRequestedEvent(
              usernameController.text,
              passwordController.text,
            ),
          );
          // context.router.replace(const MainRoute());
        },
        child: Text(
          'Login',
          style: GoogleFonts.urbanist(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}