import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:liwo_mobile/config/routes/app_router.dart';
import 'package:liwo_mobile/screens/cart/controller/cart_controller.dart';
import 'package:liwo_mobile/screens/products/controller/product_listing_controller.dart';
import 'package:liwo_mobile/screens/register/controller/register_user_controller.dart';
import 'package:liwo_mobile/utils/shared_preference.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils().init();
  Stripe.publishableKey =
      "pk_test_51MxmZ4SGOJaEG2RvOZ1XhtNGTTMLPIGfhg2tjKi6sQ0FYpdjRHPQyy6LgHUBFipxHGsMa4rT7KV7nezJ4Go6HAXg00ajMcTzkm";
  Stripe.merchantIdentifier = 'any string works';
  await Stripe.instance.applySettings();
  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductListingController>(
            create: (_) => ProductListingController()),
        ChangeNotifierProvider<RegisterUserController>(
            create: (_) => RegisterUserController()),
        ChangeNotifierProvider<CartController>(create: (_) => CartController()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        title: 'Flutter Demo',
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
