// To parse this JSON data, do
//
//     final phoneModel = phoneModelFromJson(jsonString);

import 'dart:convert';

PhoneModel phoneModelFromJson(String str) => PhoneModel.fromJson(json.decode(str));

String phoneModelToJson(PhoneModel data) => json.encode(data.toJson());



class PhoneModel {
  String? success;
  String? otp;

  PhoneModel({this.success, this.otp});

  PhoneModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['otp'] = this.otp;
    return data;
  }
}
