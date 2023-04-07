import 'dart:convert';

import '../../register/model/register_user_response_model.dart';

CreateCursomerAccessTokenResponseModel
    createCursomerAccessTokenResponseModelFromJson(String str) =>
        CreateCursomerAccessTokenResponseModel.fromJson(json.decode(str));

String createCursomerAccessTokenResponseModelToJson(
        CreateCursomerAccessTokenResponseModel data) =>
    json.encode(data.toJson());

class CreateCursomerAccessTokenResponseModel {
  CreateCursomerAccessTokenResponseModel({
    this.customerAccessTokenCreate,
  });

  CustomerAccessTokenCreate? customerAccessTokenCreate;

  CreateCursomerAccessTokenResponseModel copyWith({
    CustomerAccessTokenCreate? customerAccessTokenCreate,
  }) =>
      CreateCursomerAccessTokenResponseModel(
        customerAccessTokenCreate:
            customerAccessTokenCreate ?? this.customerAccessTokenCreate,
      );

  factory CreateCursomerAccessTokenResponseModel.fromJson(
          Map<String, dynamic> json) =>
      CreateCursomerAccessTokenResponseModel(
        customerAccessTokenCreate: json["customerAccessTokenCreate"] == null
            ? null
            : CustomerAccessTokenCreate.fromJson(
                json["customerAccessTokenCreate"]),
      );

  Map<String, dynamic> toJson() => {
        "customerAccessTokenCreate": customerAccessTokenCreate?.toJson(),
      };
}

class CustomerAccessTokenCreate {
  CustomerAccessTokenCreate({
    this.customerAccessToken,
    this.customerUserErrors,
  });

  CustomerAccessToken? customerAccessToken;
  List<CustomerUserError>? customerUserErrors;

  CustomerAccessTokenCreate copyWith({
    CustomerAccessToken? customerAccessToken,
    List<CustomerUserError>? customerUserErrors,
  }) =>
      CustomerAccessTokenCreate(
        customerAccessToken: customerAccessToken ?? this.customerAccessToken,
        customerUserErrors: customerUserErrors ?? this.customerUserErrors,
      );

  factory CustomerAccessTokenCreate.fromJson(Map<String, dynamic> json) =>
      CustomerAccessTokenCreate(
        customerAccessToken: json["customerAccessToken"] == null
            ? null
            : CustomerAccessToken.fromJson(json["customerAccessToken"]),
        customerUserErrors: json["customerUserErrors"] == null
            ? []
            : List<CustomerUserError>.from(json["customerUserErrors"]!
                .map((x) => CustomerUserError.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customerAccessToken": customerAccessToken?.toJson(),
        "customerUserErrors": customerUserErrors == null
            ? []
            : List<dynamic>.from(customerUserErrors!.map((x) => x.toJson())),
      };
}

class CustomerAccessToken {
  CustomerAccessToken({
    this.accessToken,
    this.expiresAt,
  });

  String? accessToken;
  DateTime? expiresAt;

  CustomerAccessToken copyWith({
    String? accessToken,
    DateTime? expiresAt,
  }) =>
      CustomerAccessToken(
        accessToken: accessToken ?? this.accessToken,
        expiresAt: expiresAt ?? this.expiresAt,
      );

  factory CustomerAccessToken.fromJson(Map<String, dynamic> json) =>
      CustomerAccessToken(
        accessToken: json["accessToken"],
        expiresAt: json["expiresAt"] == null
            ? null
            : DateTime.parse(json["expiresAt"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "expiresAt": expiresAt?.toIso8601String(),
      };
}
