import 'package:flutter/material.dart';
import 'package:liwo_mobile/config/routes/app_router.dart';
import 'package:liwo_mobile/screens/products/controller/product_listing_controller.dart';
import 'package:liwo_mobile/screens/register/controller/register_user_controller.dart';
import 'package:liwo_mobile/utils/shared_preference.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils().init();
  runApp(const MyApp());
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
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: AppRouter.getRouter().routeInformationParser,
        routerDelegate: AppRouter.getRouter().routerDelegate,
        title: 'Flutter Demo',
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
