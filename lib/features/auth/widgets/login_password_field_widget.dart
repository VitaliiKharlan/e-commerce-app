import 'package:e_commerce_app/core/theme/app_svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPasswordFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isPasswordVisible;
  final VoidCallback onToggleVisibility;

  const LoginPasswordFieldWidget({
    super.key,
    required this.controller,
    required this.isPasswordVisible,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: !isPasswordVisible,
      style: GoogleFonts.urbanist(fontSize: 16.sp, color: Colors.black),
      decoration: InputDecoration(
        hintText: controller.text.isEmpty ? 'Enter your password' : null,
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
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        suffixIcon: IconButton(
          icon:
              isPasswordVisible
                  ? Icon(
                    Icons.visibility_off,
                    color: Colors.grey[500],
                    size: 20.sp,
                  )
                  : SvgPicture.asset(
                    AppSvgIcons.invisible,
                    colorFilter: ColorFilter.mode(
                      Colors.grey[500]!,
                      BlendMode.srcIn,
                    ),
                    width: 20.w,
                    height: 20.h,
                  ),
          onPressed: onToggleVisibility,
        ),
      ),
    );
  }
}
