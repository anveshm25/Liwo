// To parse this JSON data, do
//
//     final productData = productDataFromJson(jsonString);

import 'dart:convert';

ProductData productDataFromJson(String str) =>
    ProductData.fromJson(json.decode(str));

String productDataToJson(ProductData data) => json.encode(data.toJson());

class ProductData {
  ProductData({
    this.products,
  });

  Products? products;

  ProductData copyWith({
    Products? products,
  }) =>
      ProductData(
        products: products ?? this.products,
      );

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        products: json["products"] == null
            ? null
            : Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "products": products?.toJson(),
      };
}

class Products {
  Products({
    this.edges,
  });

  List<ProductsEdge>? edges;

  Products copyWith({
    List<ProductsEdge>? edges,
  }) =>
      Products(
        edges: edges ?? this.edges,
      );

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        edges: json["edges"] == null
            ? []
            : List<ProductsEdge>.from(
                json["edges"]!.map((x) => ProductsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? []
            : List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ProductsEdge {
  ProductsEdge({
    this.node,
  });

  PurpleNode? node;

  ProductsEdge copyWith({
    PurpleNode? node,
  }) =>
      ProductsEdge(
        node: node ?? this.node,
      );

  factory ProductsEdge.fromJson(Map<String, dynamic> json) => ProductsEdge(
        node: json["node"] == null ? null : PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class PurpleNode {
  PurpleNode({
    this.id,
    this.title,
    this.description,
    this.media,
    this.images,
    this.priceRange,
    this.compareAtPriceRange,
  });

  String? id;
  String? title;
  String? description;
  Media? media;
  Images? images;
  PriceRange? priceRange;
  PriceRange? compareAtPriceRange;

  PurpleNode copyWith({
    String? id,
    String? title,
    String? description,
    Media? media,
    Images? images,
    PriceRange? priceRange,
    PriceRange? compareAtPriceRange,
  }) =>
      PurpleNode(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        media: media ?? this.media,
        images: images ?? this.images,
        priceRange: priceRange ?? this.priceRange,
        compareAtPriceRange: compareAtPriceRange ?? this.compareAtPriceRange,
      );

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        media: json["media"] == null ? null : Media.fromJson(json["media"]),
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        priceRange: json["priceRange"] == null
            ? null
            : PriceRange.fromJson(json["priceRange"]),
        compareAtPriceRange: json["compareAtPriceRange"] == null
            ? null
            : PriceRange.fromJson(json["compareAtPriceRange"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "media": media?.toJson(),
        "images": images?.toJson(),
        "priceRange": priceRange?.toJson(),
        "compareAtPriceRange": compareAtPriceRange?.toJson(),
      };
}

class PriceRange {
  PriceRange({
    this.minVariantPrice,
    this.maxVariantPrice,
  });

  VariantPrice? minVariantPrice;
  VariantPrice? maxVariantPrice;

  PriceRange copyWith({
    VariantPrice? minVariantPrice,
    VariantPrice? maxVariantPrice,
  }) =>
      PriceRange(
        minVariantPrice: minVariantPrice ?? this.minVariantPrice,
        maxVariantPrice: maxVariantPrice ?? this.maxVariantPrice,
      );

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        minVariantPrice: json["minVariantPrice"] == null
            ? null
            : VariantPrice.fromJson(json["minVariantPrice"]),
        maxVariantPrice: json["maxVariantPrice"] == null
            ? null
            : VariantPrice.fromJson(json["maxVariantPrice"]),
      );

  Map<String, dynamic> toJson() => {
        "minVariantPrice": minVariantPrice?.toJson(),
        "maxVariantPrice": maxVariantPrice?.toJson(),
      };
}

class VariantPrice {
  VariantPrice({
    this.amount,
    this.currencyCode,
  });

  String? amount;
  CurrencyCode? currencyCode;

  VariantPrice copyWith({
    String? amount,
    CurrencyCode? currencyCode,
  }) =>
      VariantPrice(
        amount: amount ?? this.amount,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  factory VariantPrice.fromJson(Map<String, dynamic> json) => VariantPrice(
        amount: json["amount"],
        currencyCode: currencyCodeValues.map[json["currencyCode"]]!,
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCodeValues.reverse[currencyCode],
      };
}

// ignore: constant_identifier_names
enum CurrencyCode { INR }

final currencyCodeValues = EnumValues({"INR": CurrencyCode.INR});

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

  FluffyNode? node;

  ImagesEdge copyWith({
    FluffyNode? node,
  }) =>
      ImagesEdge(
        node: node ?? this.node,
      );

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
        node: json["node"] == null ? null : FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    this.originalSrc,
  });

  String? originalSrc;

  FluffyNode copyWith({
    String? originalSrc,
  }) =>
      FluffyNode(
        originalSrc: originalSrc ?? this.originalSrc,
      );

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        originalSrc: json["originalSrc"],
      );

  Map<String, dynamic> toJson() => {
        "originalSrc": originalSrc,
      };
}

class Media {
  Media({
    this.edges,
  });

  List<MediaEdge>? edges;

  Media copyWith({
    List<MediaEdge>? edges,
  }) =>
      Media(
        edges: edges ?? this.edges,
      );

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        edges: json["edges"] == null
            ? []
            : List<MediaEdge>.from(
                json["edges"]!.map((x) => MediaEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? []
            : List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class MediaEdge {
  MediaEdge({
    this.node,
  });

  TentacledNode? node;

  MediaEdge copyWith({
    TentacledNode? node,
  }) =>
      MediaEdge(
        node: node ?? this.node,
      );

  factory MediaEdge.fromJson(Map<String, dynamic> json) => MediaEdge(
        node:
            json["node"] == null ? null : TentacledNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class TentacledNode {
  TentacledNode({
    this.alt,
    this.mediaContentType,
  });

  String? alt;
  MediaContentType? mediaContentType;

  TentacledNode copyWith({
    String? alt,
    MediaContentType? mediaContentType,
  }) =>
      TentacledNode(
        alt: alt ?? this.alt,
        mediaContentType: mediaContentType ?? this.mediaContentType,
      );

  factory TentacledNode.fromJson(Map<String, dynamic> json) => TentacledNode(
        alt: json["alt"],
        mediaContentType: mediaContentTypeValues.map[json["mediaContentType"]]!,
      );

  Map<String, dynamic> toJson() => {
        "alt": alt,
        "mediaContentType": mediaContentTypeValues.reverse[mediaContentType],
      };
}

// ignore: constant_identifier_names
enum MediaContentType { IMAGE }

final mediaContentTypeValues = EnumValues({"IMAGE": MediaContentType.IMAGE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
