// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    this.countries,
  });

  List<Country> ?countries;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
  };
}

class Country {
  Country({
    this.countryId,
    this.name,
    this.isoCode2,
    this.isoCode3,
    this.addressFormat,
    this.postcodeRequired,
    this.status,
  });

  String? countryId;
  String? name;
  String? isoCode2;
  String? isoCode3;
  String? addressFormat;
  String? postcodeRequired;
  String? status;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    countryId: json["country_id"],
    name: json["name"],
    isoCode2: json["iso_code_2"],
    isoCode3: json["iso_code_3"],
    addressFormat: json["address_format"],
    postcodeRequired: json["postcode_required"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "country_id": countryId,
    "name": name,
    "iso_code_2": isoCode2,
    "iso_code_3": isoCode3,
    "address_format": addressFormat,
    "postcode_required": postcodeRequired,
    "status": status,
  };
}
