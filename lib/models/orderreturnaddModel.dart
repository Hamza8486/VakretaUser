// To parse this JSON data, do
//
//     final orderreturnaddModel = orderreturnaddModelFromJson(jsonString);

import 'dart:convert';

OrderreturnaddModel orderreturnaddModelFromJson(String str) => OrderreturnaddModel.fromJson(json.decode(str));

String orderreturnaddModelToJson(OrderreturnaddModel data) => json.encode(data.toJson());

class OrderreturnaddModel {
  OrderreturnaddModel({
    this.paymentCode,
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
    this.agree,
  });

  String? paymentCode;
  String? orderId;
  String? productId;
  DateTime? dateOrdered;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? product;
  String? model;
  int? quantity;
  bool? opened;
  String? returnReasonId;
  List<ReturnReason>? returnReasons;
  String? comment;
  String? captcha;
  String? textAgree;
  bool? agree;

  factory OrderreturnaddModel.fromJson(Map<String, dynamic> json) => OrderreturnaddModel(
    paymentCode: json["payment_code"],
    orderId: json["order_id"],
    productId: json["product_id"],
    dateOrdered: DateTime.parse(json["date_ordered"]),
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    telephone: json["telephone"],
    product: json["product"],
    model: json["model"],
    quantity: json["quantity"],
    opened: json["opened"],
    returnReasonId: json["return_reason_id"],
    returnReasons: List<ReturnReason>.from(json["return_reasons"].map((x) => ReturnReason.fromJson(x))),
    comment: json["comment"],
    captcha: json["captcha"],
    textAgree: json["text_agree"],
    agree: json["agree"],
  );

  Map<String, dynamic> toJson() => {
    "payment_code": paymentCode,
    "order_id": orderId,
    "product_id": productId,
    "date_ordered": "${dateOrdered!.year.toString().padLeft(4, '0')}-${dateOrdered!.month.toString().padLeft(2, '0')}-${dateOrdered!.day.toString().padLeft(2, '0')}",
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "telephone": telephone,
    "product": product,
    "model": model,
    "quantity": quantity,
    "opened": opened,
    "return_reason_id": returnReasonId,
    "return_reasons": List<dynamic>.from(returnReasons!.map((x) => x.toJson())),
    "comment": comment,
    "captcha": captcha,
    "text_agree": textAgree,
    "agree": agree,
  };
}
class ReturnReason {
  ReturnReason({
    this.returnReasonId,
    this.name,
  });

  String? returnReasonId;
  String? name;

  factory ReturnReason.fromJson(Map<String, dynamic> json) => ReturnReason(
    returnReasonId: json["return_reason_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "return_reason_id": returnReasonId,
    "name": name,
  };
}
