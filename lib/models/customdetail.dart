// To parse this JSON data, do
//
//     final customerDetailModel = customerDetailModelFromJson(jsonString);

import 'dart:convert';

CustomerDetailModel customerDetailModelFromJson(String str) => CustomerDetailModel.fromJson(json.decode(str));

String customerDetailModelToJson(CustomerDetailModel data) => json.encode(data.toJson());

class CustomerDetailModel {
  CustomerDetailModel({
    this.firstname,
    this.lastname,
    this.phone,
    this.email,
  });

  String? firstname;
  String? lastname;
  String? phone;
  String? email;

  factory CustomerDetailModel.fromJson(Map<String, dynamic> json) => CustomerDetailModel(
    firstname: json["firstname"],
    lastname: json["lastname"],
    phone: json["phone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "phone": phone,
    "email": email,
  };
}
