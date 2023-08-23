// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.firstname,
    this.lastname,
    this.email,
    this.telephone,
    this.password,
    this.confirm,
    this.success,
    this.warning,
  });

  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? password;
  String? confirm;
  int? success;
  String? warning;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    telephone: json["telephone"],
    password: json["password"],
    confirm: json["confirm"],
    success: json["success"],
    warning: json["warning"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "telephone": telephone,
    "password": password,
    "confirm": confirm,
    "success": success,
    "warning": warning,
  };
}
