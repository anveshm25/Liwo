// To parse this JSON data, do
//
//     final productQueryResponseMode = productQueryResponseModeFromJson(jsonString);

import 'dart:convert';

ProductQueryResponseModel productQueryResponseModeFromJson(String str) =>
    ProductQueryResponseModel.fromJson(json.decode(str));

String productQueryResponseModeToJson(ProductQueryResponseModel data) =>
    json.encode(data.toJson());

class ProductQueryResponseModel {
  ProductQueryResponseModel({
    this.product,
  });

  Product? product;

  String? getfirstVariantId() {
    return product?.variants?.edges?.first.node?.id;
  }

  ProductQueryResponseModel copyWith({
    Product? product,
  }) =>
      ProductQueryResponseModel(
        product: product ?? this.product,
      );

  factory ProductQueryResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductQueryResponseModel(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.title,
    this.handle,
    this.description,
    this.priceRange,
    this.images,
    this.variants,
  });

  String? id;
  String? title;
  String? handle;
  String? description;
  PriceRange? priceRange;
  Images? images;
  Variants? variants;

  Product copyWith({
    String? id,
    String? title,
    String? handle,
    String? description,
    PriceRange? priceRange,
    Images? images,
    Variants? variants,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        handle: handle ?? this.handle,
        description: description ?? this.description,
        priceRange: priceRange ?? this.priceRange,
        images: images ?? this.images,
        variants: variants ?? this.variants,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        handle: json["handle"],
        description: json["description"],
        priceRange: json["priceRange"] == null
            ? null
            : PriceRange.fromJson(json["priceRange"]),
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        variants: json["variants"] == null
            ? null
            : Variants.fromJson(json["variants"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "handle": handle,
        "description": description,
        "priceRange": priceRange?.toJson(),
        "images": images?.toJson(),
        "variants": variants?.toJson(),
      };
}

class Images {
  Images({
    this.edges,
  });

  List<ImagesEdge>? edges;

  Images copyWith({
    List<ImagesEdge>? edges,
  }) =>
      Images(
        edges: edges ?? this.edges,
      );

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        edges: json["edges"] == null
            ? []
            : List<ImagesEdge>.from(
                json["edges"]!.map((x) => ImagesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? []
            : List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ImagesEdge {
  ImagesEdge({
    this.node,
  });

  PurpleNode? node;

  ImagesEdge copyWith({
    PurpleNode? node,
  }) =>
      ImagesEdge(
        node: node ?? this.node,
      );

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
        node: json["node"] == null ? null : PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class PurpleNode {
  PurpleNode({
    this.originalSrc,
    this.id,
  });

  String? originalSrc;
  String? id;

  PurpleNode copyWith({
    String? originalSrc,
    String? id,
  }) =>
      PurpleNode(
        originalSrc: originalSrc ?? this.originalSrc,
        id: id ?? this.id,
      );

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        originalSrc: json["originalSrc"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "originalSrc": originalSrc,
        "id": id,
      };
}

class PriceRange {
  PriceRange({
    this.minVariantPrice,
    this.maxVariantPrice,
  });

  Price? minVariantPrice;
  Price? maxVariantPrice;

  PriceRange copyWith({
    Price? minVariantPrice,
    Price? maxVariantPrice,
  }) =>
      PriceRange(
        minVariantPrice: minVariantPrice ?? this.minVariantPrice,
        maxVariantPrice: maxVariantPrice ?? this.maxVariantPrice,
      );

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        minVariantPrice: json["minVariantPrice"] == null
            ? null
            : Price.fromJson(json["minVariantPrice"]),
        maxVariantPrice: json["maxVariantPrice"] == null
            ? null
            : Price.fromJson(json["maxVariantPrice"]),
      );

  Map<String, dynamic> toJson() => {
        "minVariantPrice": minVariantPrice?.toJson(),
        "maxVariantPrice": maxVariantPrice?.toJson(),
      };
}

class Price {
  Price({
    this.amount,
    this.currencyCode,
  });

  String? amount;
  String? currencyCode;

  Price copyWith({
    String? amount,
    String? currencyCode,
  }) =>
      Price(
        amount: amount ?? this.amount,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"],
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCode,
      };
}

class Variants {
  Variants({
    this.edges,
  });

  List<VariantsEdge>? edges;

  Variants copyWith({
    List<VariantsEdge>? edges,
  }) =>
      Variants(
        edges: edges ?? this.edges,
      );

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
        edges: json["edges"] == null
            ? []
            : List<VariantsEdge>.from(
                json["edges"]!.map((x) => VariantsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? []
            : List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class VariantsEdge {
  VariantsEdge({
    this.node,
  });

  FluffyNode? node;

  VariantsEdge copyWith({
    FluffyNode? node,
  }) =>
      VariantsEdge(
        node: node ?? this.node,
      );

  factory VariantsEdge.fromJson(Map<String, dynamic> json) => VariantsEdge(
        node: json["node"] == null ? null : FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    this.id,
    this.title,
    this.price,
    this.image,
    this.sku,
    this.currentlyNotInStock,
    this.barcode,
    this.availableForSale,
    this.quantityAvailable,
    this.weight,
    this.weightUnit,
    this.requiresShipping,
    this.selectedOptions,
  });

  String? id;
  String? title;
  Price? price;
  Image? image;
  String? sku;
  bool? currentlyNotInStock;
  String? barcode;
  bool? availableForSale;
  int? quantityAvailable;
  int? weight;
  String? weightUnit;
  bool? requiresShipping;
  List<SelectedOption>? selectedOptions;

  FluffyNode copyWith({
    String? id,
    String? title,
    Price? price,
    Image? image,
    String? sku,
    bool? currentlyNotInStock,
    String? barcode,
    bool? availableForSale,
    int? quantityAvailable,
    int? weight,
    String? weightUnit,
    bool? requiresShipping,
    List<SelectedOption>? selectedOptions,
  }) =>
      FluffyNode(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        image: image ?? this.image,
        sku: sku ?? this.sku,
        currentlyNotInStock: currentlyNotInStock ?? this.currentlyNotInStock,
        barcode: barcode ?? this.barcode,
        availableForSale: availableForSale ?? this.availableForSale,
        quantityAvailable: quantityAvailable ?? this.quantityAvailable,
        weight: weight ?? this.weight,
        weightUnit: weightUnit ?? this.weightUnit,
        requiresShipping: requiresShipping ?? this.requiresShipping,
        selectedOptions: selectedOptions ?? this.selectedOptions,
      );

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        id: json["id"],
        title: json["title"],
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        sku: json["sku"],
        currentlyNotInStock: json["currentlyNotInStock"],
        barcode: json["barcode"],
        availableForSale: json["availableForSale"],
        quantityAvailable: json["quantityAvailable"],
        weight: json["weight"],
        weightUnit: json["weightUnit"],
        requiresShipping: json["requiresShipping"],
        selectedOptions: json["selectedOptions"] == null
            ? []
            : List<SelectedOption>.from(json["selectedOptions"]!
                .map((x) => SelectedOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price?.toJson(),
        "image": image?.toJson(),
        "sku": sku,
        "currentlyNotInStock": currentlyNotInStock,
        "barcode": barcode,
        "availableForSale": availableForSale,
        "quantityAvailable": quantityAvailable,
        "weight": weight,
        "weightUnit": weightUnit,
        "requiresShipping": requiresShipping,
        "selectedOptions": selectedOptions == null
            ? []
            : List<dynamic>.from(selectedOptions!.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    this.url,
    this.altText,
    this.id,
  });

  String? url;
  dynamic altText;
  String? id;

  Image copyWith({
    String? url,
    dynamic altText,
    String? id,
  }) =>
      Image(
        url: url ?? this.url,
        altText: altText ?? this.altText,
        id: id ?? this.id,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        altText: json["altText"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "altText": altText,
        "id": id,
      };
}

class SelectedOption {
  SelectedOption({
    this.name,
    this.value,
  });

  String? name;
  String? value;

  SelectedOption copyWith({
    String? name,
    String? value,
  }) =>
      SelectedOption(
        name: name ?? this.name,
        value: value ?? this.value,
      );

  factory SelectedOption.fromJson(Map<String, dynamic> json) => SelectedOption(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
