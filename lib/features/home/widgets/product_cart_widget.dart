import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCartWidget extends StatelessWidget {
  const ProductCartWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
    required this.rating,
    required this.price,
    required this.isFavorite,
  });

  final String imageUrl;
  final String title;
  final String artist;
  final double rating;
  final String price;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.h,
      width: 342.w,
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: const Color(0xFF000000).withAlpha(20),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 21.w, top: 25.h, right: 21.w, bottom: 26.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Image.network(
                imageUrl,
                height: 70.h,
                width: 70.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: const Icon(Icons.music_note),
                  );
                },
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.urbanist(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF000000),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                        
                            SizedBox(height: 2.h),
                        
                            Text(
                              artist,
                              style: GoogleFonts.urbanist(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF000000).withAlpha(120),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color:
                            isFavorite
                                ? const Color(0xFFE53E3E)
                                : const Color(0xFF888888),
                        size: 20.sp,
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16.sp,
                          color: const Color(0xFF000000),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          rating.toString(),
                          style: GoogleFonts.urbanist(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF303539),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    price,
                    style: GoogleFonts.urbanist(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF000000).withAlpha(170),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Favorite button
        ],
      ),
    );
  }
}
