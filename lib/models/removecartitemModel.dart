// To parse this JSON data, do
//
//     final removecartitemModel = removecartitemModelFromJson(jsonString);

import 'dart:convert';

RemovecartitemModel removecartitemModelFromJson(String str) => RemovecartitemModel.fromJson(json.decode(str));

String removecartitemModelToJson(RemovecartitemModel data) => json.encode(data.toJson());

class RemovecartitemModel {
  RemovecartitemModel({
    this.success,
    this.error,
  });

  String? success;
  String? error;

  factory RemovecartitemModel.fromJson(Map<String, dynamic> json) => RemovecartitemModel(
    success: json["success"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error": error,

  };
}
