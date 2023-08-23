// To parse this JSON data, do
//
//     final sellerratingModel = sellerratingModelFromJson(jsonString);

import 'dart:convert';

SellerratingModel sellerratingModelFromJson(String str) => SellerratingModel.fromJson(json.decode(str));

String sellerratingModelToJson(SellerratingModel data) => json.encode(data.toJson());

class SellerratingModel {
  SellerratingModel({
    this.success,
    this.error,
  });

  String? success;
  String? error;

  factory SellerratingModel.fromJson(Map<String, dynamic> json) => SellerratingModel(
    success: json["success"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error": error,
  };
}
