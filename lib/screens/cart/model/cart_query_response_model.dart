// To parse this JSON data, do
//
//     final cartQueryResponseModel = cartQueryResponseModelFromJson(jsonString);

import 'dart:convert';

CartQueryResponseModel cartQueryResponseModelFromJson(String str) =>
    CartQueryResponseModel.fromJson(json.decode(str));

String cartQueryResponseModelToJson(CartQueryResponseModel data) =>
    json.encode(data.toJson());

class CartQueryResponseModel {
  CartQueryResponseModel({
    this.cart,
  });

  Cart? cart;

  CartQueryResponseModel copyWith({
    Cart? cart,
  }) =>
      CartQueryResponseModel(
        cart: cart ?? this.cart,
      );

  factory CartQueryResponseModel.fromJson(Map<String, dynamic> json) =>
      CartQueryResponseModel(
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
    this.checkoutUrl,
    this.totalQuantity,
    this.lines,
    this.attributes,
    this.cost,
    this.buyerIdentity,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? checkoutUrl;
  int? totalQuantity;
  Lines? lines;
  List<Attribute>? attributes;
  CartCost? cost;
  BuyerIdentity? buyerIdentity;

  Cart copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? checkoutUrl,
    int? totalQuantity,
    Lines? lines,
    List<Attribute>? attributes,
    CartCost? cost,
    BuyerIdentity? buyerIdentity,
  }) =>
      Cart(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        checkoutUrl: checkoutUrl ?? this.checkoutUrl,
        totalQuantity: totalQuantity ?? this.totalQuantity,
        lines: lines ?? this.lines,
        attributes: attributes ?? this.attributes,
        cost: cost ?? this.cost,
        buyerIdentity: buyerIdentity ?? this.buyerIdentity,
      );

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        checkoutUrl: json["checkoutUrl"],
        totalQuantity: json["totalQuantity"],
        lines: json["lines"] == null ? null : Lines.fromJson(json["lines"]),
        attributes: json["attributes"] == null
            ? []
            : List<Attribute>.from(
                json["attributes"]!.map((x) => Attribute.fromJson(x))),
        cost: json["cost"] == null ? null : CartCost.fromJson(json["cost"]),
        buyerIdentity: json["buyerIdentity"] == null
            ? null
            : BuyerIdentity.fromJson(json["buyerIdentity"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "checkoutUrl": checkoutUrl,
        "totalQuantity": totalQuantity,
        "lines": lines?.toJson(),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "cost": cost?.toJson(),
        "buyerIdentity": buyerIdentity?.toJson(),
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
    this.email,
    this.phone,
    this.customer,
    this.countryCode,
  });

  dynamic email;
  dynamic phone;
  Customer? customer;
  dynamic countryCode;

  BuyerIdentity copyWith({
    dynamic email,
    dynamic phone,
    Customer? customer,
    dynamic countryCode,
  }) =>
      BuyerIdentity(
        email: email ?? this.email,
        phone: phone ?? this.phone,
        customer: customer ?? this.customer,
        countryCode: countryCode ?? this.countryCode,
      );

  factory BuyerIdentity.fromJson(Map<String, dynamic> json) => BuyerIdentity(
        email: json["email"],
        phone: json["phone"],
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        countryCode: json["countryCode"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "customer": customer?.toJson(),
        "countryCode": countryCode,
      };
}

class Customer {
  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.defaultAddress,
  });

  String? id;
  dynamic firstName;
  dynamic lastName;
  dynamic defaultAddress;

  Customer copyWith({
    String? id,
    dynamic firstName,
    dynamic lastName,
    dynamic defaultAddress,
  }) =>
      Customer(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        defaultAddress: defaultAddress ?? this.defaultAddress,
      );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        defaultAddress: json["defaultAddress"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "defaultAddress": defaultAddress,
      };
}

class CartCost {
  CartCost({
    this.totalAmount,
    this.subtotalAmount,
    this.totalTaxAmount,
    this.totalDutyAmount,
  });

  TotalAmount? totalAmount;
  TotalAmount? subtotalAmount;
  dynamic totalTaxAmount;
  dynamic totalDutyAmount;

  CartCost copyWith({
    TotalAmount? totalAmount,
    TotalAmount? subtotalAmount,
    dynamic totalTaxAmount,
    dynamic totalDutyAmount,
  }) =>
      CartCost(
        totalAmount: totalAmount ?? this.totalAmount,
        subtotalAmount: subtotalAmount ?? this.subtotalAmount,
        totalTaxAmount: totalTaxAmount ?? this.totalTaxAmount,
        totalDutyAmount: totalDutyAmount ?? this.totalDutyAmount,
      );

  factory CartCost.fromJson(Map<String, dynamic> json) => CartCost(
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

  EdgeNode? node;

  Edge copyWith({
    EdgeNode? node,
  }) =>
      Edge(
        node: node ?? this.node,
      );

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
        node: json["node"] == null ? null : EdgeNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class EdgeNode {
  EdgeNode({
    this.id,
    this.cost,
    this.quantity,
    this.merchandise,
    this.attributes,
  });

  String? id;
  NodeCost? cost;
  int? quantity;
  Merchandise? merchandise;
  List<dynamic>? attributes;

  EdgeNode copyWith({
    String? id,
    NodeCost? cost,
    int? quantity,
    Merchandise? merchandise,
    List<dynamic>? attributes,
  }) =>
      EdgeNode(
        id: id ?? this.id,
        cost: cost ?? this.cost,
        quantity: quantity ?? this.quantity,
        merchandise: merchandise ?? this.merchandise,
        attributes: attributes ?? this.attributes,
      );

  factory EdgeNode.fromJson(Map<String, dynamic> json) => EdgeNode(
        id: json["id"],
        cost: json["cost"] == null ? null : NodeCost.fromJson(json["cost"]),
        quantity: json["quantity"],
        merchandise: json["merchandise"] == null
            ? null
            : Merchandise.fromJson(json["merchandise"]),
        attributes: json["attributes"] == null
            ? []
            : List<dynamic>.from(json["attributes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cost": cost?.toJson(),
        "quantity": quantity,
        "merchandise": merchandise?.toJson(),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x)),
      };
}

class NodeCost {
  NodeCost({
    this.compareAtAmountPerQuantity,
  });

  dynamic compareAtAmountPerQuantity;

  NodeCost copyWith({
    dynamic compareAtAmountPerQuantity,
  }) =>
      NodeCost(
        compareAtAmountPerQuantity:
            compareAtAmountPerQuantity ?? this.compareAtAmountPerQuantity,
      );

  factory NodeCost.fromJson(Map<String, dynamic> json) => NodeCost(
        compareAtAmountPerQuantity: json["compareAtAmountPerQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "compareAtAmountPerQuantity": compareAtAmountPerQuantity,
      };
}

class Merchandise {
  Merchandise({
    this.product,
    this.currentlyNotInStock,
    this.quantityAvailable,
    this.weight,
    this.title,
    this.unitPrice,
    this.id,
  });

  Product? product;
  bool? currentlyNotInStock;
  int? quantityAvailable;
  int? weight;
  String? title;
  dynamic unitPrice;
  String? id;

  Merchandise copyWith({
    Product? product,
    bool? currentlyNotInStock,
    int? quantityAvailable,
    int? weight,
    String? title,
    dynamic unitPrice,
    String? id,
  }) =>
      Merchandise(
        product: product ?? this.product,
        currentlyNotInStock: currentlyNotInStock ?? this.currentlyNotInStock,
        quantityAvailable: quantityAvailable ?? this.quantityAvailable,
        weight: weight ?? this.weight,
        title: title ?? this.title,
        unitPrice: unitPrice ?? this.unitPrice,
        id: id ?? this.id,
      );

  factory Merchandise.fromJson(Map<String, dynamic> json) => Merchandise(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        currentlyNotInStock: json["currentlyNotInStock"],
        quantityAvailable: json["quantityAvailable"],
        weight: json["weight"],
        title: json["title"],
        unitPrice: json["unitPrice"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "currentlyNotInStock": currentlyNotInStock,
        "quantityAvailable": quantityAvailable,
        "weight": weight,
        "title": title,
        "unitPrice": unitPrice,
        "id": id,
      };
}

class Product {
  Product({
    this.id,
    this.title,
    this.productType,
    this.images,
  });

  String? id;
  String? title;
  String? productType;
  Images? images;

  Product copyWith({
    String? id,
    String? title,
    String? productType,
    Images? images,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        productType: productType ?? this.productType,
        images: images ?? this.images,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        productType: json["productType"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "productType": productType,
        "images": images?.toJson(),
      };
}

class Images {
  Images({
    this.nodes,
  });

  List<NodeElement>? nodes;

  Images copyWith({
    List<NodeElement>? nodes,
  }) =>
      Images(
        nodes: nodes ?? this.nodes,
      );

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        nodes: json["nodes"] == null
            ? []
            : List<NodeElement>.from(
                json["nodes"]!.map((x) => NodeElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodes": nodes == null
            ? []
            : List<dynamic>.from(nodes!.map((x) => x.toJson())),
      };
}

class NodeElement {
  NodeElement({
    this.url,
    this.id,
  });

  String? url;
  String? id;

  NodeElement copyWith({
    String? url,
    String? id,
  }) =>
      NodeElement(
        url: url ?? this.url,
        id: id ?? this.id,
      );

  factory NodeElement.fromJson(Map<String, dynamic> json) => NodeElement(
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
      };
}
