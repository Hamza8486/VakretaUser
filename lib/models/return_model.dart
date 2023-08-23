

// To parse this JSON data, do
//
//     final returnModel = returnModelFromJson(jsonString);

import 'dart:convert';

ReturnModel returnModelFromJson(String str) => ReturnModel.fromJson(json.decode(str));

String returnModelToJson(ReturnModel data) => json.encode(data.toJson());


class ReturnModel {
  String? paymentCode;
  String? orderId;
  String? productId;
  String? dateOrdered;
  var firstname;
  var lastname;
  var email;
  var telephone;
  String? product;
  String? model;
  int? quantity;
  bool? opened;
  String? returnReasonId;
  List<ReturnReasons>? returnReasons;
  String? comment;
  String? captcha;
  String? textAgree;
  bool? agree;

  ReturnModel(
      {this.paymentCode,
        this.orderId,
        this.productId,
        this.dateOrdered,
        this.firstname,
        this.lastname,
        this.email,
        this.telephone,
        this.product,
        this.model,
        this.quantity,
        this.opened,
        this.returnReasonId,
        this.returnReasons,
        this.comment,
        this.captcha,
        this.textAgree,
        this.agree});

  ReturnModel.fromJson(Map<String, dynamic> json) {
    paymentCode = json['payment_code'];
    orderId = json['order_id'];
    productId = json['product_id'];
    dateOrdered = json['date_ordered'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    telephone = json['telephone'];
    product = json['product'];
    model = json['model'];
    quantity = json['quantity'];
    opened = json['opened'];
    returnReasonId = json['return_reason_id'];
    if (json['return_reasons'] != null) {
      returnReasons = <ReturnReasons>[];
      json['return_reasons'].forEach((v) {
        returnReasons!.add(new ReturnReasons.fromJson(v));
      });
    }
    comment = json['comment'];
    captcha = json['captcha'];
    textAgree = json['text_agree'];
    agree = json['agree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_code'] = this.paymentCode;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['date_ordered'] = this.dateOrdered;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['product'] = this.product;
    data['model'] = this.model;
    data['quantity'] = this.quantity;
    data['opened'] = this.opened;
    data['return_reason_id'] = this.returnReasonId;
    if (this.returnReasons != null) {
      data['return_reasons'] =
          this.returnReasons!.map((v) => v.toJson()).toList();
    }
    data['comment'] = this.comment;
    data['captcha'] = this.captcha;
    data['text_agree'] = this.textAgree;
    data['agree'] = this.agree;
    return data;
  }
}

class ReturnReasons {
  String? returnReasonId;
  String? name;

  ReturnReasons({this.returnReasonId, this.name});

  ReturnReasons.fromJson(Map<String, dynamic> json) {
    returnReasonId = json['return_reason_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['return_reason_id'] = this.returnReasonId;
    data['name'] = this.name;
    return data;
  }
}
