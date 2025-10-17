import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWelcomeHeaderWidget extends StatelessWidget {
  const LoginWelcomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE91E63), width: 2.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        'Welcome back! Glad to see you, Again!',
        style: GoogleFonts.urbanist(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
  }
}