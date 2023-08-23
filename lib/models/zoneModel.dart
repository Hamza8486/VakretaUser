// To parse this JSON data, do
//
//     final zoneModel = zoneModelFromJson(jsonString);

import 'dart:convert';

ZoneModel zoneModelFromJson(String str) => ZoneModel.fromJson(json.decode(str));

String zoneModelToJson(ZoneModel data) => json.encode(data.toJson());

class ZoneModel {
  ZoneModel({
    this.countryId,
    this.name,
    this.isoCode2,
    this.isoCode3,
    this.addressFormat,
    this.postcodeRequired,
    this.zone,
    this.status,
  });

  String? countryId;
  String? name;
  String? isoCode2;
  String? isoCode3;
  String? addressFormat;
  String? postcodeRequired;
  List<Zone>? zone;
  String? status;

  factory ZoneModel.fromJson(Map<String, dynamic> json) => ZoneModel(
    countryId: json["country_id"],
    name: json["name"],
    isoCode2: json["iso_code_2"],
    isoCode3: json["iso_code_3"],
    addressFormat: json["address_format"],
    postcodeRequired: json["postcode_required"],
    zone: List<Zone>.from(json["zone"].map((x) => Zone.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "country_id": countryId,
    "name": name,
    "iso_code_2": isoCode2,
    "iso_code_3": isoCode3,
    "address_format": addressFormat,
    "postcode_required": postcodeRequired,
    "zone": List<dynamic>.from(zone!.map((x) => x.toJson())),
    "status": status,
  };
}

class Zone {
  Zone({
    this.zoneId,
    this.countryId,
    this.name,
    this.code,
    this.status,
  });

  String? zoneId;
  String? countryId;
  String? name;
  String? code;
  String? status;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
    zoneId: json["zone_id"],
    countryId: json["country_id"],
    name: json["name"],
    code: json["code"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "zone_id": zoneId,
    "country_id": countryId,
    "name": name,
    "code": code,
    "status": status,
  };
}
