import 'package:flutter/material.dart';
import 'package:liwo_mobile/constatns/constants.dart';
import 'package:liwo_mobile/network/api_response.dart';
import 'package:liwo_mobile/screens/login/model/create_customer_access_token_response_model.dart';
import 'package:liwo_mobile/screens/login/model/login_input_model.dart';
import 'package:liwo_mobile/screens/login/repository/login_repository.dart';
import 'package:liwo_mobile/utils/shared_preference.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository _repository = LoginRepository();
  final LoginInputModel loginInputModel = LoginInputModel();
  ApiResponse<CreateCursomerAccessTokenResponseModel> apiResponse =
      ApiResponse<CreateCursomerAccessTokenResponseModel>(status: false);

  login({required Function(bool) callback}) async {
    apiResponse.status = true;
    notifyListeners();
    apiResponse = await _repository
        .createAccessToken(variables: {'input': loginInputModel.toJson()});

    ///Storing the AccessToken, AccessTokenExpiryTime and Email in memory.
    String? accessToken = apiResponse
        .data?.customerAccessTokenCreate?.customerAccessToken?.accessToken;
    await Future.wait([
      SharedPreferencesUtils().addStringToSF(
          key: email, value: loginInputModel.emailController.text),
      SharedPreferencesUtils().addStringToSF(
          key: customerAccessToken,
          value: apiResponse.data?.customerAccessTokenCreate
              ?.customerAccessToken?.accessToken),
      SharedPreferencesUtils().addIntToSF(
          key: customerAccessTokenExpiry,
          value: apiResponse.data?.customerAccessTokenCreate
              ?.customerAccessToken?.expiresAt?.millisecondsSinceEpoch)
    ]);
    callback.call(accessToken != null && accessToken != "");
    notifyListeners();
  }
}
