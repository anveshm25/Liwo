import 'package:flutter/material.dart';
import 'package:liwo_mobile/constatns/constants.dart';
import 'package:liwo_mobile/network/api_response.dart';
import 'package:liwo_mobile/screens/cart/model/cart_query_response_model.dart';
import 'package:liwo_mobile/screens/cart/repository/cart_repository.dart';
import 'package:liwo_mobile/utils/shared_preference.dart';

class CartController extends ChangeNotifier {
  final CartRepository _cartRepository = CartRepository();
  ApiResponse<CartQueryResponseModel> cartResponse =
      ApiResponse<CartQueryResponseModel>(status: Status.none);

  CartController() {
    // _initCart();
  }

  _initCart() async {
    String? cartId =
        await SharedPreferencesUtils().getStringValuesSF(cartIdPrefKey);
    if (cartId != null) {
      cartResponse = await _cartRepository.fetchCart(cartId: cartId);
    }
    notifyListeners();
  }

  fetchCart() async {
    cartResponse = ApiResponse<CartQueryResponseModel>(status: Status.loading);
    notifyListeners();
    cartResponse = await _cartRepository.fetchCart();
    notifyListeners();
  }
}
