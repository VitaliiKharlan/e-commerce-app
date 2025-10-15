import 'package:auto_route/auto_route.dart';

import '../features/welcome/view/welcome_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: WelcomeRoute.page, path: '/', initial: true),
      // AutoRoute(page: HomeRoute.page, path: '/home'),
      // AutoRoute(page: CartRoute.page, path: '/cart'),
      // AutoRoute(page: Wishlist.page, path: '/wish_list'),
    ];
  }
}
