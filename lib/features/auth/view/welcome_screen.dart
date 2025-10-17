import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/theme/app_images.dart';
import 'package:e_commerce_app/core/theme/app_svg_icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/router/router.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.backgroundWelcomeScreen, fit: BoxFit.cover),

          SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 448.h),
                  SvgPicture.asset(
                    AppSvgIcons.branding,
                    height: 58.h,
                    width: 58.w,
                  ),
                  SizedBox(height: 18.h),

                  Text(
                    'Fake Store',
                    style: GoogleFonts.urbanist(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF252425),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: Size.fromHeight(48.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                        onPressed: () {
                          context.router.replace(LoginRoute());
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.urbanist(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFF8F7FA),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
