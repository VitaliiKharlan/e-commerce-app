import 'package:auto_route/auto_route.dart';

import '../../features/auth/view/login_screen.dart';
import '../../features/auth/view/welcome_screen.dart';
import '../../features/cart/view/cart_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/main/view/main_screen.dart';
import '../../features/wishlist/view/wishlist_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: WelcomeRoute.page, path: '/', initial: true),
      AutoRoute(page: LoginRoute.page, path: '/login'),
      AutoRoute(
        page: MainRoute.page,
        path: '/main',

        children: [
          AutoRoute(page: HomeRoute.page, path: 'home'),
          AutoRoute(page: WishlistRoute.page, path: 'wishlist'),
          AutoRoute(page: CartRoute.page, path: 'cart'),
        ],
      ),
    ];
  }
}
