import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final String assetPath;
  final bool isActive;
  final VoidCallback onTap;

  const CustomBottomNavigationBarItem({
    super.key,
    required this.assetPath,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 32.w,
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: SvgPicture.asset(
          assetPath,
          height: 20.h,
          width: 20.w,
          colorFilter: ColorFilter.mode(
            isActive ? Color(0xFF000000) : Color(0xFFCBCBD4),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
