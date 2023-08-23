// To parse this JSON data, do
//
//     final wishlistModel = wishlistModelFromJson(jsonString);

import 'dart:convert';

WishlistModel wishlistModelFromJson(String str) => WishlistModel.fromJson(json.decode(str));

String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

class WishlistModel {
  WishlistModel({
    this.products,
  });

  List<Product>? products;

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.productId,
    this.quantity,
    this.category,
    this.thumb,
    this.name,
    this.description,
    this.price,
    this.special,
    this.tax,
    this.minimum,
    this.rating,
    this.href,
    this.options,
  });

  String? productId;
  String? quantity;
  dynamic category;
  dynamic thumb;
  String? name;
  String? description;
  String? price;
  var special;
  bool? tax;
  dynamic minimum;
  int? rating;
  String? href;
  List<Option>? options;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    quantity: json["quantity"],
    category: json["category"],
    thumb: json["thumb"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    special: json["special"],
    tax: json["tax"],
    minimum: json["minimum"],
    rating: json["rating"],
    href: json["href"],
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    // options: List<dynamic>.from(json["options"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "category": category,
    "thumb": thumb,
    "name": name,
    "description": description,
    "price": price,
    "special": special,
    "tax": tax,
    "minimum": minimum,
    "rating": rating,
    "href": href,
    "options": List<dynamic>.from(options!.map((x) => x.toJson())),
  };
}

class Option {
  Option({
    this.productIdss,
    this.productOptionId,
    this.productOptionValue,
    // this.optionId,
    this.name,
    // this.type,
    // this.value,
    // this.required,
  });

  String? productIdss;
  String? productOptionId;
  List<ProductOptionValue>? productOptionValue;
  // String? optionId;
  String? name;
  // String? type;
  // String? value;
  // String? required;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    productIdss: json["product_idss"],
    productOptionId: json["product_option_id"],
    productOptionValue: List<ProductOptionValue>.from(json["product_option_value"].map((x) => ProductOptionValue.fromJson(x))),
    // optionId: json["option_id"],
    name: json["name"],
    // type: json["type"],
    // value: json["value"],
    // required: json["required"],
  );

  Map<String, dynamic> toJson() => {
    "product_idss": productIdss,
    "product_option_id": productOptionId,
    "product_option_value": List<dynamic>.from(productOptionValue!.map((x) => x.toJson())),
    // "option_id": optionId,
    "name": name,
    // "type": type,
    // "value": value,
    // "required": required,
  };
}

class ProductOptionValue {
  ProductOptionValue({
    this.productOptionValueId,
    this.optionValueId,
    this.name,
    // this.image,
    // this.price,
    // this.special,
    // this.pricePrefix,
  });

  String? productOptionValueId;
  String? optionValueId;
  String? name;
  // String? image;
  // String? price;
  // String? special;
  // String? pricePrefix;

  factory ProductOptionValue.fromJson(Map<String, dynamic> json) => ProductOptionValue(
    productOptionValueId: json["product_option_value_id"],
    optionValueId: json["option_value_id"],
    name: json["name"],
    // image: json["image"],
    // price: json["price"],
    // special: json["special"],
    // pricePrefix: json["price_prefix"],
  );

  Map<String, dynamic> toJson() => {
    "product_option_value_id": productOptionValueId,
    "option_value_id": optionValueId,
    "name": name,
    // "image": image,
    // "price": price,
    // "special": special,
    // "price_prefix": pricePrefix,
  };
}
