// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotpasswordModelFromJson(String str) =>
    ForgotPasswordModel.fromJson(json.decode(str));

String forgotpasswordModelToJson(ForgotPasswordModel data) =>
    json.encode(data.toJson());

class ForgotPasswordModel {
  ForgotPasswordModel({
    this.success,
    this.otp,
  });

  String? success;
  String? otp;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        success: json["success"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "otp": otp,
      };
}
