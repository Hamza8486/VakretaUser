// To parse this JSON data, do
//
//     final sellerModel = sellerModelFromJson(jsonString);

import 'dart:convert';

List<SellerModel> sellerModelFromJson(String str) => List<SellerModel>.from(json.decode(str).map((x) => SellerModel.fromJson(x)));

String sellerModelToJson(List<SellerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class SellerModel {
  String? productName;
  String? productId;
  String? isMaster;
  String? thumb;
  String? popup;
  String? price;
  String? priceNum;
  String? storeName;
  String? sellerId;
  String? sellerRating;
  String? sellerCount;
  String? shippingText;
  String? paymentText;

  SellerModel(
      {this.productName,
        this.productId,
        this.isMaster,
        this.thumb,
        this.popup,
        this.price,
        this.priceNum,
        this.storeName,
        this.sellerId,
        this.sellerRating,
        this.sellerCount,
        this.shippingText,
        this.paymentText});

  SellerModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productId = json['product_id'];
    isMaster = json['is_master'];
    thumb = json['thumb'];
    popup = json['popup'];
    price = json['price'];
    priceNum = json['price_num'];
    storeName = json['store_name'];
    sellerId = json['seller_id'];
    sellerRating = json['seller_rating'];
    sellerCount = json['seller_count'];
    shippingText = json['shipping_text'];
    paymentText = json['payment_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['product_id'] = this.productId;
    data['is_master'] = this.isMaster;
    data['thumb'] = this.thumb;
    data['popup'] = this.popup;
    data['price'] = this.price;
    data['price_num'] = this.priceNum;
    data['store_name'] = this.storeName;
    data['seller_id'] = this.sellerId;
    data['seller_rating'] = this.sellerRating;
    data['seller_count'] = this.sellerCount;
    data['shipping_text'] = this.shippingText;
    data['payment_text'] = this.paymentText;
    return data;
  }
}
