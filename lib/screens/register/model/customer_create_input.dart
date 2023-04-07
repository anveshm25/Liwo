import 'package:flutter/material.dart';

class CustomerCreateInput {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  Map<String, dynamic> toJson() {
    return {
      "email": emailController.text,
      // "firstName": firstNameController.text,
      "password": passwordController.text,
      // "lastName": lastNameController.text
    };
  }

  disposeControllers() {
    emailController.dispose();
    firstNameController.dispose();
    passwordController.dispose();
    lastNameController.dispose();
  }

  clearControllers() {
    emailController.clear();
    firstNameController.clear();
    passwordController.clear();
    lastNameController.clear();
  }
}
