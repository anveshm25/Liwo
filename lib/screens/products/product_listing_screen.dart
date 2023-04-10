import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liwo_mobile/config/routes/app_route_constants.dart';
import 'package:liwo_mobile/screens/products/controller/product_listing_controller.dart';
import 'package:liwo_mobile/screens/products/models/product_list_data.dart';
import 'package:provider/provider.dart';

import '../../network/api_response.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  @override
  initState() {
    super.initState();
    context.read<ProductListingController>().getProduct();
    context.read<ProductListingController>().getProduct();
    context.read<ProductListingController>().getProduct();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () =>
                {GoRouter.of(context).pushNamed(AppRouteConstants.login)},
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          )
        ],
      ),
      backgroundColor: MyTheme.backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Row(
              children: const [
                Text("Trending produts",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Spacer(),
              ],
            ),
            Consumer<ProductListingController>(
                builder: (_, value, __) =>
                    value.productListResponse.status == Status.loading
                        ? const Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              ProductsEdge product = value.productListResponse
                                      .data?.products?.edges?[index] ??
                                  ProductsEdge();
                              return courseCard(
                                  courseImage: product.node?.images?.edges
                                      ?.first.node?.originalSrc,
                                  courseInfo: product.node?.title ?? '',
                                  courseName: product.node?.title ?? '',
                                  coursePrice: product.node?.priceRange
                                          ?.maxVariantPrice?.amount ??
                                      '');
                            },
                            itemCount: value.productListResponse.data?.products
                                    ?.edges?.length ??
                                0,
                          ))
          ],
        ),
      ),
    );
  }

  Widget courseCard(
      {required String? courseImage,
      required String courseName,
      required String courseInfo,
      required String coursePrice}) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => CourseScreen(
        //             courseName: courseName,
        //             courseImage: courseImage,
        //             courseInfo: courseInfo,
        //             coursePrice: coursePrice,
        //           )),
        // );
      },
      child: Card(
          color: MyTheme.courseCardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: MediaQuery.of(context).size.width < 400 ? 3 : 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: courseImage != null
                        ? Image(
                            image: NetworkImage(courseImage),
                          )
                        : const SizedBox(),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(courseName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(courseInfo,
                            maxLines: 2,
                            style:
                                TextStyle(fontSize: 12, color: MyTheme.grey)),
                        MyTheme.smallVerticalPadding,
                        Text(
                          coursePrice,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}

class MyTheme {
  static Color get backgroundColor => const Color(0xFFF7F7F7);
  static Color get grey => const Color(0xFF999999);
  static Color get catalogueCardColor =>
      const Color(0xFFBAE5D4).withOpacity(0.5);
  static Color get catalogueButtonColor => const Color(0xFF29335C);
  static Color get courseCardColor => const Color(0xFFEDF1F1);
  static Color get progressColor => const Color(0xFF36F1CD);

  static Padding get largeVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 32.0));

  static Padding get mediumVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 16.0));

  static Padding get smallVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 8.0));

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blueGrey,
      ).copyWith(
        cardTheme: const CardTheme(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                catalogueButtonColor), // Button color
            foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white), // Text and icon color
          ),
        ),
      );
}
