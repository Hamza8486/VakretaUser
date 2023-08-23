// To parse this JSON data, do
//
//     final removeproductModel = removeproductModelFromJson(jsonString);

import 'dart:convert';

RemoveproductModel removeproductModelFromJson(String str) => RemoveproductModel.fromJson(json.decode(str));

String removeproductModelToJson(RemoveproductModel data) => json.encode(data.toJson());

class RemoveproductModel {
  RemoveproductModel({
    this.error,
    this.success,
  });

  String? error;
  String? success;

  factory RemoveproductModel.fromJson(Map<String, dynamic> json) => RemoveproductModel(
    error: json["error"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "success": success ,
  };
}
