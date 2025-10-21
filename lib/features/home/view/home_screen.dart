import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/theme/app_svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../product/bloc/product_bloc.dart';
import '../../product/bloc/product_event.dart';
import '../../product/bloc/product_state.dart';
import '../widgets/product_cart_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductBloc>().add(const LoadProductsEvent());
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      final bloc = context.read<ProductBloc>();
      bloc.state.maybeWhen(
        loaded: (products, hasMore) {
          if (hasMore) bloc.add(const LoadMoreProductsEvent());
        },
        orElse: () {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
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

              //
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      loaded:
                          (products, hasMore) => ListView.builder(
                            controller: _scrollController,
                            itemCount:
                                hasMore ? products.length + 1 : products.length,
                            itemBuilder: (context, index) {
                              if (index >= products.length) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final product = products[index];
                              return ProductCartWidget(
                                imageUrl: product.image,
                                title: product.title,
                                artist: product.category,
                                rating: product.rating.rate,
                                price: '\$${product.price.toStringAsFixed(2)}',
                                isFavorite: false,
                              );
                            },
                          ),
                      error:
                          (message) => Center(child: Text('Error: $message')),
                    );
                  },
                ),
              ),

              // SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
