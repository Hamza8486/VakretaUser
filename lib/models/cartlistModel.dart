// To parse this JSON data, do
//
//     final cartlistModel = cartlistModelFromJson(jsonString);

import 'dart:convert';

CartlistModel cartlistModelFromJson(String str) => CartlistModel.fromJson(json.decode(str));

String cartlistModelToJson(CartlistModel data) => json.encode(data.toJson());

class CartlistModel {
  CartlistModel({
    this.products,
  });

  List<Product>? products;

  factory CartlistModel.fromJson(Map<String, dynamic> json) => CartlistModel(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.cartId,
    this.productId,
    this.thumb,
    this.name,
    this.model,
    required this.option,
    this.recurring,
    this.quantity,
    this.stock,
    this.reward,
    this.stockQty,
    this.price,
    this.total,
    this.href,
  });

  String? cartId;
  String? productId;
  String? thumb;
  String? name;
  String? model;
  String? stockQty;
  List<dynamic> option;
  String? recurring;
  String? quantity;
  bool? stock;
  String? reward;
  String? price;
  String? total;
  String? href;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    cartId: json["cart_id"],
    productId: json["product_id"],
    thumb: json["thumb"],
    name: json["name"],
    model: json["model"],
    option: List<dynamic>.from(json["option"].map((x) => x)),
    recurring: json["recurring"],
    quantity: json["quantity"],
    stock: json["stock"],
    reward: json["reward"],
    price: json["price"],
    stockQty : json['stock_qty'],
    total: json["total"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "product_id": productId,
    "thumb": thumb,
    "name": name,

    "model": model,
    "option": List<dynamic>.from(option.map((x) => x)),
    "recurring": recurring,
    "quantity": quantity,
    "stock": stock,
    'stock_qty': this.stockQty,
    "reward": reward,
    "price": price,
    "total": total,
    "href": href,
  };
}
