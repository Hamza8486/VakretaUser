
// To parse this JSON data, do
//
//     final paymentModelAll = paymentModelAllFromJson(jsonString);

import 'dart:convert';

PaymentModelAll paymentModelAllFromJson(String str) => PaymentModelAll.fromJson(json.decode(str));

String paymentModelAllToJson(PaymentModelAll data) => json.encode(data.toJson());


class PaymentModelAll {
  bool? message;
  List<PaymentMethods>? paymentMethods;

  PaymentModelAll({this.message, this.paymentMethods});

  PaymentModelAll.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['Payment Methods'] != null) {
      paymentMethods = <PaymentMethods>[];
      json['Payment Methods'].forEach((v) {
        paymentMethods!.add(new PaymentMethods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.paymentMethods != null) {
      data['Payment Methods'] =
          this.paymentMethods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentMethods {
  String? code;
  String? title;
  String? terms;
  String? sortOrder;

  PaymentMethods(
      { this.code, this.title, this.terms, this.sortOrder});

  PaymentMethods.fromJson(Map<String, dynamic> json) {

    code = json['code'];
    title = json['title'];
    terms = json['terms'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['code'] = this.code;
    data['title'] = this.title;
    data['terms'] = this.terms;
    data['sort_order'] = this.sortOrder;
    return data;
  }
}
