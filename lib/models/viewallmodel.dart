// To parse this JSON data, do
//
//     final viewallmodel = viewallmodelFromJson(jsonString);

import 'dart:convert';

List<Viewallmodel> viewallmodelFromJson(String str) => List<Viewallmodel>.from(json.decode(str).map((x) => Viewallmodel.fromJson(x)));

String viewallmodelToJson(List<Viewallmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Viewallmodel {
  Viewallmodel({
    this.quantity,
    this.priceValue,
    this.productId,
    this.name,
    this.thumb,
    this.thumb2,
    this.price,
    this.special,
    this.href,
  });

  int? quantity;
  bool? priceValue;
  String? productId;
  String? name;
  String? thumb;
  String? thumb2;
  String? price;
  dynamic special;
  String? href;

  factory Viewallmodel.fromJson(Map<String, dynamic> json) => Viewallmodel(
    quantity: json["quantity"],
    priceValue: json["price_value"],
    productId: json["product_id"],
    name: json["name"],
    thumb: json["thumb"],
    thumb2: json["thumb2"],
    price: json["price"],
    special: json["special"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "price_value": priceValue,
    "product_id": productId,
    "name": name,
    "thumb": thumb,
    "thumb2": thumb2,
    "price": price,
    "special": special,
    "href": href,
  };
}
