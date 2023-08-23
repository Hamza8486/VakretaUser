// To parse this JSON data, do
//
//     final orderreturnsaveModel = orderreturnsaveModelFromJson(jsonString);

import 'dart:convert';

OrderreturnsaveModel orderreturnsaveModelFromJson(String str) => OrderreturnsaveModel.fromJson(json.decode(str));

String orderreturnsaveModelToJson(OrderreturnsaveModel data) => json.encode(data.toJson());

class OrderreturnsaveModel {
  OrderreturnsaveModel({
    this.error,
  });

  Error? error;

  factory OrderreturnsaveModel.fromJson(Map<String, dynamic> json) => OrderreturnsaveModel(
    error: Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error!.toJson(),
  };
}

class Error {
  Error({
    this.warning,
  });

  String? warning;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    warning: json["warning"],
  );

  Map<String, dynamic> toJson() => {
    "warning": warning,
  };
}
