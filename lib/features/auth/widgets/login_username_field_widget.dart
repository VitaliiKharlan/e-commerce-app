import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginUsernameFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const LoginUsernameFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.urbanist(
        fontSize: 16.sp,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: 'Enter your username',
        hintStyle: GoogleFonts.urbanist(
          fontSize: 16.sp,
          color: Colors.grey[500],
        ),
        filled: true,
        fillColor: const Color(0xFFF7F8F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
      ),
    );
  }
}