// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.error,
    this.customerId,
  });

  String? error;
  String? customerId;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    error: json["error"],
    customerId: json["customer_id"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "customerId": customerId,
  };
}
