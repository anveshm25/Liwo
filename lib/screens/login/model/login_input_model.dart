import 'package:flutter/widgets.dart';

class LoginInputModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordConroller = TextEditingController();

  Map<String, dynamic> toJson() {
    return {'email': emailController.text, 'password': passwordConroller.text};
  }

  void clear() {
    emailController.text = '';
    passwordConroller.text = '';
  }

  void dispose() {
    emailController.dispose();
    passwordConroller.dispose();
  }
}
