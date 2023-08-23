// To parse this JSON data, do
//
//     final addtowishlistModel = addtowishlistModelFromJson(jsonString);

import 'dart:convert';

AddtowishlistModel addtowishlistModelFromJson(String str) => AddtowishlistModel.fromJson(json.decode(str));

String addtowishlistModelToJson(AddtowishlistModel data) => json.encode(data.toJson());

class AddtowishlistModel {
  AddtowishlistModel({
    this.success,
    this.error,
  });

  String? success;
  String? error;

  factory AddtowishlistModel.fromJson(Map<String, dynamic> json) => AddtowishlistModel(
    success: json["success"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error": error,
  };
}
