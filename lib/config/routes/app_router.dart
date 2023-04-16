import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../screens/login/controller/login_controller.dart';
import '../../screens/products/product_listing_screen.dart';
import '../../screens/register/registration_screen.dart';
import '../../screens/cart/cart_screen.dart';
import '../../screens/login/login_screen.dart';
import 'app_route_constants.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: AppRouteConstants.productListingRouteName,
      path: '/',
      pageBuilder: (context, state) {
        return const MaterialPage(child: ProductListingScreen());
      },
      builder: (context, GoRouterState state) => const ProductListingScreen(),
    ),
    GoRoute(
      name: AppRouteConstants.login,
      path: '/login',
      pageBuilder: (context, state) {
        return MaterialPage(
            child: ChangeNotifierProvider(
                create: (_) => LoginController(), child: const Login()));
      },
    ),
    GoRoute(
      name: AppRouteConstants.signUp,
      path: '/register',
      pageBuilder: (context, state) {
        return const MaterialPage(child: RegistrationScreen());
      },
    ),
    GoRoute(
      name: AppRouteConstants.cartScreen,
      path: '/cartScreen',
      pageBuilder: (context, state) {
        return const MaterialPage(child: CartScreen());
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: Scaffold());
  },
);
