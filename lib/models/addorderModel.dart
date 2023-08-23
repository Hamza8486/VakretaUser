// To parse this JSON data, do
//
//     final addorderModel = addorderModelFromJson(jsonString);

import 'dart:convert';

AddorderModel addorderModelFromJson(String str) => AddorderModel.fromJson(json.decode(str));

String addorderModelToJson(AddorderModel data) => json.encode(data.toJson());

class AddorderModel {
  AddorderModel({
    this.error,
    this.success,
  });

  String? error;
  String? success;

  factory AddorderModel.fromJson(Map<String, dynamic> json) => AddorderModel(
    error: json["error"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "success": success,
  };
}
