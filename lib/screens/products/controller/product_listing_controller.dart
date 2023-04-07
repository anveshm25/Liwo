import 'package:flutter/material.dart';
import 'package:liwo_mobile/network/api_response.dart';
import 'package:liwo_mobile/screens/products/respository/product_respository.dart';

import '../models/product_list_data.dart';

class ProductListingController extends ChangeNotifier {
  final ProductRespository _respository = ProductRespository();

  ApiResponse<ProductData> productListResponse =
      ApiResponse<ProductData>(status: true);

  getProduct() async {
    productListResponse = await _respository.fetchProducts();
    notifyListeners();
  }
}
