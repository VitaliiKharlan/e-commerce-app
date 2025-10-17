import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/theme/app_svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/product_cart_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, \nUsername',
                    style: GoogleFonts.urbanist(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF252425),
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          SvgPicture.asset(
                            AppSvgIcons.logoutBackground,
                            height: 32.h,
                            width: 32.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                              top: 3,
                              right: 2,
                              bottom: 5,
                            ),
                            child: SvgPicture.asset(
                              AppSvgIcons.logout,
                              height: 24.h,
                              width: 24.w,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        'Log out',
                        style: GoogleFonts.urbanist(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF3A3A3A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 32.h),

              Text(
                'Fake Store',
                style: GoogleFonts.urbanist(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF252425),
                ),
              ),

              SizedBox(height: 22.h),

              Column(
                children: [
                  ProductCartWidget(
                    imageUrl:
                        'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=200&h=200&fit=crop',
                    title: '"Awaken, My Love!"',
                    artist: 'Childish Gambino',
                    rating: 4.25,
                    price: '\$19.99',
                    isFavorite: true,
                  ),

                  ProductCartWidget(
                    imageUrl:
                        'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=200&h=200&fit=crop',
                    title: 'Dark Lane Tapes',
                    artist: 'Drake',
                    rating: 4.25,
                    price: '\$32.99',
                    isFavorite: false,
                  ),

                  ProductCartWidget(
                    imageUrl:
                        'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=200&h=200&fit=crop',
                    title: '4 Your Eyez Only',
                    artist: 'JCole',
                    rating: 4.25,
                    price: '\$28.99',
                    isFavorite: false,
                  ),

                  ProductCartWidget(
                    imageUrl:
                        'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=200&h=200&fit=crop',
                    title: '4 Your Eyez Only',
                    artist: 'JCole',
                    rating: 4.25,
                    price: '\$28.99',
                    isFavorite: false,
                  ),

                  ProductCartWidget(
                    imageUrl:
                        'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=200&h=200&fit=crop',
                    title: '4 Your Eyez Only',
                    artist: 'JCole',
                    rating: 4.25,
                    price: '\$28.99',
                    isFavorite: false,
                  ),
                ],
              ),
              SizedBox(height: 100.h), // Space for bottom navigation
            ],
          ),
        ),
      ),
    );
  }
}
