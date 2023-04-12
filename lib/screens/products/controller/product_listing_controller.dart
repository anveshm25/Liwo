import 'package:flutter/material.dart';
import 'package:liwo_mobile/network/api_response.dart';
import 'package:liwo_mobile/screens/products/respository/product_respository.dart';

import '../models/product_list_data.dart';

class ProductListingController extends ChangeNotifier {
  final ProductRepository _respository = ProductRepository();

  ApiResponse<ProductData> productListResponse =
      ApiResponse<ProductData>(status: Status.loading);

  getProduct() async {
    productListResponse = await _respository.fetchProducts();
    notifyListeners();
  }
}
