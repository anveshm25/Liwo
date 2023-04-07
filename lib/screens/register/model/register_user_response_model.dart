// To parse this JSON data, do
//
//     final registerUserResponse = registerUserResponseFromJson(jsonString);

import 'dart:convert';

RegisterUserResponse registerUserResponseFromJson(String str) =>
    RegisterUserResponse.fromJson(json.decode(str));

String registerUserResponseToJson(RegisterUserResponse data) =>
    json.encode(data.toJson());

class RegisterUserResponse {
  RegisterUserResponse({
    this.customerCreate,
  });

  CustomerCreate? customerCreate;

  RegisterUserResponse copyWith({
    CustomerCreate? customerCreate,
  }) =>
      RegisterUserResponse(
        customerCreate: customerCreate ?? this.customerCreate,
      );

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) =>
      RegisterUserResponse(
        customerCreate: json["customerCreate"] == null
            ? null
            : CustomerCreate.fromJson(json["customerCreate"]),
      );

  Map<String, dynamic> toJson() => {
        "customerCreate": customerCreate?.toJson(),
      };
}

class CustomerCreate {
  CustomerCreate({
    this.customerUserErrors,
    this.customer,
  });

  List<CustomerUserError>? customerUserErrors;
  Customer? customer;

  CustomerCreate copyWith({
    List<CustomerUserError>? customerUserErrors,
    Customer? customer,
  }) =>
      CustomerCreate(
        customerUserErrors: customerUserErrors ?? this.customerUserErrors,
        customer: customer ?? this.customer,
      );

  factory CustomerCreate.fromJson(Map<String, dynamic> json) => CustomerCreate(
        customerUserErrors: json["customerUserErrors"] == null
            ? []
            : List<CustomerUserError>.from(json["customerUserErrors"]!
                .map((x) => CustomerUserError.fromJson(x))),
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "customerUserErrors": customerUserErrors == null
            ? []
            : List<dynamic>.from(customerUserErrors!.map((x) => x.toJson())),
        "customer": customer?.toJson(),
      };
}

class Customer {
  Customer({
    this.id,
  });

  String? id;

  Customer copyWith({
    String? id,
  }) =>
      Customer(
        id: id ?? this.id,
      );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class CustomerUserError {
  CustomerUserError({
    this.code,
    this.field,
    this.message,
  });

  String? code;
  List<String>? field;
  String? message;

  CustomerUserError copyWith({
    String? code,
    List<String>? field,
    String? message,
  }) =>
      CustomerUserError(
        code: code ?? this.code,
        field: field ?? this.field,
        message: message ?? this.message,
      );

  factory CustomerUserError.fromJson(Map<String, dynamic> json) =>
      CustomerUserError(
        code: json["code"],
        field: json["field"] == null
            ? []
            : List<String>.from(json["field"]!.map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "field": field == null ? [] : List<dynamic>.from(field!.map((x) => x)),
        "message": message,
      };
}
