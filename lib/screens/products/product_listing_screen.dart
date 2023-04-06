import 'package:flutter/material.dart';
import 'package:liwo_mobile/screens/products/controller/product_listing_controller.dart';
import 'package:provider/provider.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {

  @override
  initState(){
    super.initState();
    context.read<ProductListingController>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
