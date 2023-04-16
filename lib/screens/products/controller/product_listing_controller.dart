import 'package:flutter/material.dart';
import 'package:liwo_mobile/network/api_response.dart';
import 'package:liwo_mobile/screens/cart/repository/cart_repository.dart';
import 'package:liwo_mobile/screens/products/respository/product_respository.dart';
import 'package:liwo_mobile/utils/shared_preference.dart';

import '../../../constatns/constants.dart';
import '../../cart/model/cart_create_response_model.dart';
import '../models/product_list_data.dart';

class ProductListingController extends ChangeNotifier {
  final ProductRepository _respository = ProductRepository();
  final CartRepository _cartRespository = CartRepository();

  ApiResponse<ProductData> productListResponse =
      ApiResponse<ProductData>(status: Status.loading);

  ApiResponse<CartCreateResponse>? cartResponse =
      ApiResponse<CartCreateResponse>(status: Status.none);
  getProduct() async {
    productListResponse = await _respository.fetchProducts();
    notifyListeners();
  }

  addProductToCart(String productId, {required VoidCallback callback}) async {
    cartResponse?.status = Status.loading;
    notifyListeners();
    cartResponse = await _cartRespository.addProductInCart(productId);
    if (cartResponse?.status == Status.success) {
      await SharedPreferencesUtils().addStringToSF(
          key: cartIdPrefKey, value: cartResponse?.data?.cartCreate?.cart?.id);
      callback.call();
    }
    notifyListeners();
  }
}
