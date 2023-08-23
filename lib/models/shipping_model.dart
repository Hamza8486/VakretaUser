
// To parse this JSON data, do
//
//     final getShippingMethod = getShippingMethodFromJson(jsonString);

import 'dart:convert';

List<GetShippingMethod> getShippingMethodFromJson(String str) => List<GetShippingMethod>.from(json.decode(str).map((x) => GetShippingMethod.fromJson(x)));

String getShippingMethodToJson(List<GetShippingMethod> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class GetShippingMethod {
  String? title;
  String? code;
  int? cost;
  String? sortOrder;
  bool? error;

  GetShippingMethod(
      {this.title, this.code, this.cost, this.sortOrder, this.error});

  GetShippingMethod.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
    cost = json['cost'];
    sortOrder = json['sort_order'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['code'] = this.code;
    data['cost'] = this.cost;
    data['sort_order'] = this.sortOrder;
    data['error'] = this.error;
    return data;
  }
}
