// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.success,
    this.error,
  });

  String? success;
  String? error;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    success: json["success"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error" : error,
  };
}
