

import 'dart:convert';

PinCodeModel pinCodeModelFromJson(String str) => PinCodeModel.fromJson(json.decode(str));

String pinCodeModelToJson(PinCodeModel data) => json.encode(data.toJson());





class PinCodeModel {
  int? statusCode;
  String? message;
  PinModelData? data;

  PinCodeModel({this.statusCode, this.message, this.data});

  PinCodeModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new PinModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PinModelData {
  String? region;
  String? city;
  String? zone;
  String? mapping;

  PinModelData({this.region, this.city, this.zone, this.mapping});

  PinModelData.fromJson(Map<String, dynamic> json) {
    region = json['region'];
    city = json['city'];
    zone = json['zone'];
    mapping = json['mapping'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region'] = this.region;
    data['city'] = this.city;
    data['zone'] = this.zone;
    data['mapping'] = this.mapping;
    return data;
  }
}
