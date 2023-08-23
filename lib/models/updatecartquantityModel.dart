// To parse this JSON data, do
//
//     final updatecartquantityModel = updatecartquantityModelFromJson(jsonString);

import 'dart:convert';

UpdatecartquantityModel updatecartquantityModelFromJson(String str) => UpdatecartquantityModel.fromJson(json.decode(str));

String updatecartquantityModelToJson(UpdatecartquantityModel data) => json.encode(data.toJson());

class UpdatecartquantityModel {
  UpdatecartquantityModel({
    this.success,
    this.error,
  });

  String? success;
  String? error;

  factory UpdatecartquantityModel.fromJson(Map<String, dynamic> json) => UpdatecartquantityModel(
    success: json["success"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error": error,
  };
}
