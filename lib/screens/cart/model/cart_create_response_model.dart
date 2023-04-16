// To parse this JSON data, do
//
//     final cartCreateResponse = cartCreateResponseFromJson(jsonString);

import 'dart:convert';

CartCreateResponse cartCreateResponseFromJson(String str) =>
    CartCreateResponse.fromJson(json.decode(str));

String cartCreateResponseToJson(CartCreateResponse data) =>
    json.encode(data.toJson());

class CartCreateResponse {
  CartCreateResponse({
    this.cartCreate,
  });

  CartCreate? cartCreate;

  CartCreateResponse copyWith({
    CartCreate? cartCreate,
  }) =>
      CartCreateResponse(
        cartCreate: cartCreate ?? this.cartCreate,
      );

  factory CartCreateResponse.fromJson(Map<String, dynamic> json) =>
      CartCreateResponse(
        cartCreate: json["cartCreate"] == null
            ? null
            : CartCreate.fromJson(json["cartCreate"]),
      );

  Map<String, dynamic> toJson() => {
        "cartCreate": cartCreate?.toJson(),
      };
}

class CartCreate {
  CartCreate({
    this.cart,
  });

  Cart? cart;

  CartCreate copyWith({
    Cart? cart,
  }) =>
      CartCreate(
        cart: cart ?? this.cart,
      );

  factory CartCreate.fromJson(Map<String, dynamic> json) => CartCreate(
        cart: json["cart"] == null ? null : Cart.fromJson(json["cart"]),
      );

  Map<String, dynamic> toJson() => {
        "cart": cart?.toJson(),
      };
}

class Cart {
  Cart({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.discountAllocations,
    this.discountCodes,
    this.lines,
    this.buyerIdentity,
    this.attributes,
    this.cost,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? discountAllocations;
  List<dynamic>? discountCodes;
  Lines? lines;
  BuyerIdentity? buyerIdentity;
  List<Attribute>? attributes;
  Cost? cost;

  Cart copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<dynamic>? discountAllocations,
    List<dynamic>? discountCodes,
    Lines? lines,
    BuyerIdentity? buyerIdentity,
    List<Attribute>? attributes,
    Cost? cost,
  }) =>
      Cart(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        discountAllocations: discountAllocations ?? this.discountAllocations,
        discountCodes: discountCodes ?? this.discountCodes,
        lines: lines ?? this.lines,
        buyerIdentity: buyerIdentity ?? this.buyerIdentity,
        attributes: attributes ?? this.attributes,
        cost: cost ?? this.cost,
      );

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        discountAllocations: json["discountAllocations"] == null
            ? []
            : List<dynamic>.from(json["discountAllocations"]!.map((x) => x)),
        discountCodes: json["discountCodes"] == null
            ? []
            : List<dynamic>.from(json["discountCodes"]!.map((x) => x)),
        lines: json["lines"] == null ? null : Lines.fromJson(json["lines"]),
        buyerIdentity: json["buyerIdentity"] == null
            ? null
            : BuyerIdentity.fromJson(json["buyerIdentity"]),
        attributes: json["attributes"] == null
            ? []
            : List<Attribute>.from(
                json["attributes"]!.map((x) => Attribute.fromJson(x))),
        cost: json["cost"] == null ? null : Cost.fromJson(json["cost"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "discountAllocations": discountAllocations == null
            ? []
            : List<dynamic>.from(discountAllocations!.map((x) => x)),
        "discountCodes": discountCodes == null
            ? []
            : List<dynamic>.from(discountCodes!.map((x) => x)),
        "lines": lines?.toJson(),
        "buyerIdentity": buyerIdentity?.toJson(),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "cost": cost?.toJson(),
      };
}

class Attribute {
  Attribute({
    this.key,
    this.value,
  });

  String? key;
  String? value;

  Attribute copyWith({
    String? key,
    String? value,
  }) =>
      Attribute(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class BuyerIdentity {
  BuyerIdentity({
    this.deliveryAddressPreferences,
  });

  List<DeliveryAddressPreference>? deliveryAddressPreferences;

  BuyerIdentity copyWith({
    List<DeliveryAddressPreference>? deliveryAddressPreferences,
  }) =>
      BuyerIdentity(
        deliveryAddressPreferences:
            deliveryAddressPreferences ?? this.deliveryAddressPreferences,
      );

  factory BuyerIdentity.fromJson(Map<String, dynamic> json) => BuyerIdentity(
        deliveryAddressPreferences: json["deliveryAddressPreferences"] == null
            ? []
            : List<DeliveryAddressPreference>.from(
                json["deliveryAddressPreferences"]!
                    .map((x) => DeliveryAddressPreference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "deliveryAddressPreferences": deliveryAddressPreferences == null
            ? []
            : List<dynamic>.from(
                deliveryAddressPreferences!.map((x) => x.toJson())),
      };
}

class DeliveryAddressPreference {
  DeliveryAddressPreference({
    this.typename,
  });

  String? typename;

  DeliveryAddressPreference copyWith({
    String? typename,
  }) =>
      DeliveryAddressPreference(
        typename: typename ?? this.typename,
      );

  factory DeliveryAddressPreference.fromJson(Map<String, dynamic> json) =>
      DeliveryAddressPreference(
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
      };
}

class Cost {
  Cost({
    this.totalAmount,
    this.subtotalAmount,
    this.totalTaxAmount,
    this.totalDutyAmount,
  });

  TotalAmount? totalAmount;
  TotalAmount? subtotalAmount;
  dynamic totalTaxAmount;
  dynamic totalDutyAmount;

  Cost copyWith({
    TotalAmount? totalAmount,
    TotalAmount? subtotalAmount,
    dynamic totalTaxAmount,
    dynamic totalDutyAmount,
  }) =>
      Cost(
        totalAmount: totalAmount ?? this.totalAmount,
        subtotalAmount: subtotalAmount ?? this.subtotalAmount,
        totalTaxAmount: totalTaxAmount ?? this.totalTaxAmount,
        totalDutyAmount: totalDutyAmount ?? this.totalDutyAmount,
      );

  factory Cost.fromJson(Map<String, dynamic> json) => Cost(
        totalAmount: json["totalAmount"] == null
            ? null
            : TotalAmount.fromJson(json["totalAmount"]),
        subtotalAmount: json["subtotalAmount"] == null
            ? null
            : TotalAmount.fromJson(json["subtotalAmount"]),
        totalTaxAmount: json["totalTaxAmount"],
        totalDutyAmount: json["totalDutyAmount"],
      );

  Map<String, dynamic> toJson() => {
        "totalAmount": totalAmount?.toJson(),
        "subtotalAmount": subtotalAmount?.toJson(),
        "totalTaxAmount": totalTaxAmount,
        "totalDutyAmount": totalDutyAmount,
      };
}

class TotalAmount {
  TotalAmount({
    this.amount,
    this.currencyCode,
  });

  String? amount;
  String? currencyCode;

  TotalAmount copyWith({
    String? amount,
    String? currencyCode,
  }) =>
      TotalAmount(
        amount: amount ?? this.amount,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  factory TotalAmount.fromJson(Map<String, dynamic> json) => TotalAmount(
        amount: json["amount"],
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCode,
      };
}

class Lines {
  Lines({
    this.edges,
  });

  List<Edge>? edges;

  Lines copyWith({
    List<Edge>? edges,
  }) =>
      Lines(
        edges: edges ?? this.edges,
      );

  factory Lines.fromJson(Map<String, dynamic> json) => Lines(
        edges: json["edges"] == null
            ? []
            : List<Edge>.from(json["edges"]!.map((x) => Edge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? []
            : List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class Edge {
  Edge({
    this.node,
  });

  Node? node;

  Edge copyWith({
    Node? node,
  }) =>
      Edge(
        node: node ?? this.node,
      );

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
        node: json["node"] == null ? null : Node.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class Node {
  Node({
    this.id,
    this.merchandise,
  });

  String? id;
  Merchandise? merchandise;

  Node copyWith({
    String? id,
    Merchandise? merchandise,
  }) =>
      Node(
        id: id ?? this.id,
        merchandise: merchandise ?? this.merchandise,
      );

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        merchandise: json["merchandise"] == null
            ? null
            : Merchandise.fromJson(json["merchandise"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "merchandise": merchandise?.toJson(),
      };
}

class Merchandise {
  Merchandise({
    this.id,
  });

  String? id;

  Merchandise copyWith({
    String? id,
  }) =>
      Merchandise(
        id: id ?? this.id,
      );

  factory Merchandise.fromJson(Map<String, dynamic> json) => Merchandise(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
