// To parse this JSON data, do
//
//     final carttotalModel = carttotalModelFromJson(jsonString);

import 'dart:convert';

CarttotalModel carttotalModelFromJson(String str) => CarttotalModel.fromJson(json.decode(str));

String carttotalModelToJson(CarttotalModel data) => json.encode(data.toJson());

class CarttotalModel {
  CarttotalModel({
    this.totals,
  });

  List<Total>? totals;

  factory CarttotalModel.fromJson(Map<String, dynamic> json) => CarttotalModel(
    totals: List<Total>.from(json["totals"].map((x) => Total.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totals": List<dynamic>.from(totals!.map((x) => x.toJson())),
  };
}

class Total {
  Total({
    this.title,
    this.text,
  });

  String? title;
  String? text;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
    title: json["title"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "text": text,
  };
}
