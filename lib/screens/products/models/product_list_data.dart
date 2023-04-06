class ProductData {
  Products? products;

  ProductData({this.products});

  ProductData.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ? Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.toJson();
    }
    return data;
  }
}

class Products {
  List<Edges>? edges;

  Products({this.edges});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['edges'] != null) {
      edges = <Edges>[];
      json['edges'].forEach((v) {
        edges!.add(Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (edges != null) {
      data['edges'] = edges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Edges {
  Node? node;

  Edges({this.node});

  Edges.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? Node.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (node != null) {
      data['node'] = node!.toJson();
    }
    return data;
  }
}

class Node {
  String? id;
  String? title;
  String? description;
  Products? media;
  PriceRange? priceRange;
  PriceRange? compareAtPriceRange;

  Node(
      {this.id,
      this.title,
      this.description,
      this.media,
      this.priceRange,
      this.compareAtPriceRange});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    media = json['media'] != null ? Products.fromJson(json['media']) : null;
    priceRange = json['priceRange'] != null
        ? PriceRange.fromJson(json['priceRange'])
        : null;
    compareAtPriceRange = json['compareAtPriceRange'] != null
        ? PriceRange.fromJson(json['compareAtPriceRange'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    if (priceRange != null) {
      data['priceRange'] = priceRange!.toJson();
    }
    if (compareAtPriceRange != null) {
      data['compareAtPriceRange'] = compareAtPriceRange!.toJson();
    }
    return data;
  }
}

class MediaNode {
  String? alt;
  String? mediaContentType;

  MediaNode({this.alt, this.mediaContentType});

  MediaNode.fromJson(Map<String, dynamic> json) {
    alt = json['alt'];
    mediaContentType = json['mediaContentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alt'] = alt;
    data['mediaContentType'] = mediaContentType;
    return data;
  }
}

class PriceRange {
  MinVariantPrice? minVariantPrice;
  MinVariantPrice? maxVariantPrice;

  PriceRange({this.minVariantPrice, this.maxVariantPrice});

  PriceRange.fromJson(Map<String, dynamic> json) {
    minVariantPrice = json['minVariantPrice'] != null
        ? MinVariantPrice.fromJson(json['minVariantPrice'])
        : null;
    maxVariantPrice = json['maxVariantPrice'] != null
        ? MinVariantPrice.fromJson(json['maxVariantPrice'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (minVariantPrice != null) {
      data['minVariantPrice'] = minVariantPrice!.toJson();
    }
    if (maxVariantPrice != null) {
      data['maxVariantPrice'] = maxVariantPrice!.toJson();
    }
    return data;
  }
}

class MinVariantPrice {
  String? amount;
  String? currencyCode;

  MinVariantPrice({this.amount, this.currencyCode});

  MinVariantPrice.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currencyCode'] = currencyCode;
    return data;
  }
}
