import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liwo_mobile/screens/products/product_listing_screen.dart';
import 'package:liwo_mobile/screens/register/registration_screen.dart';

import '../../screens/login/login_screen.dart';
import 'app_route_constants.dart';

class AppRouter {
  static GoRouter getRouter() {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: AppRouteConstants.productListingRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ProductListingScreen());
          },
        ),
        GoRoute(
          name: AppRouteConstants.login,
          path: '/login',
          pageBuilder: (context, state) {
            return const MaterialPage(child: Login());
          },
        ),
        GoRoute(
          name: AppRouteConstants.signUp,
          path: '/register',
          pageBuilder: (context, state) {
            return const MaterialPage(child: RegistrationScreen());
          },
        )
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: Scaffold());
      },
    );
    return router;
  }
}