// To parse this JSON data, do
//
//     final deleteaddressModel = deleteaddressModelFromJson(jsonString);

import 'dart:convert';

DeleteaddressModel deleteaddressModelFromJson(String str) => DeleteaddressModel.fromJson(json.decode(str));

String deleteaddressModelToJson(DeleteaddressModel data) => json.encode(data.toJson());

class DeleteaddressModel {
  DeleteaddressModel({
    this.success,
    this.error,
  });

  bool? success;
  bool? error;

  factory DeleteaddressModel.fromJson(Map<String, dynamic> json) => DeleteaddressModel(
    success: json["success"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error": error,
  };
}
