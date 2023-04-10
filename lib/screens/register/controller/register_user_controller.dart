import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:liwo_mobile/screens/register/model/customer_create_input.dart';
import 'package:liwo_mobile/screens/register/repository/register_respository.dart';

import '../../../network/api_response.dart';
import '../model/register_user_response_model.dart';

class RegisterUserController extends ChangeNotifier {
  ApiResponse<RegisterUserResponse> apiResponse =
      ApiResponse<RegisterUserResponse>(status: Status.none);
  final RegisterRepository _registerRepository = RegisterRepository();
  final CustomerCreateInput customerInfo = CustomerCreateInput();

  Future signUpUser({required VoidCallback onResponse}) async {
    apiResponse.status = Status.loading;
    notifyListeners();
    apiResponse = await _registerRepository
        .registerUser(variables: {"input": customerInfo.toJson()});
    onResponse.call();
    notifyListeners();
  }
}
