// To parse this JSON data, do
//
//     final orderlistModel = orderlistModelFromJson(jsonString);

import 'dart:convert';

List<OrderlistModel> orderlistModelFromJson(String str) => List<OrderlistModel>.from(json.decode(str).map((x) => OrderlistModel.fromJson(x)));

String orderlistModelToJson(List<OrderlistModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderlistModel {
  OrderlistModel({
    this.orderId,
    this.name,
    this.status,
    this.dateAdded,
    this.products,
    this.total,
    this.view,
  });

  String? orderId;
  String? name;
  Map<String, Status>? status;
  String? dateAdded;
  int? products;
  String? total;
  String? view;

  factory OrderlistModel.fromJson(Map<String, dynamic> json) => OrderlistModel(
    orderId: json["order_id"],
    name: json["name"],
    status: Map.from(json["status"]).map((k, v) => MapEntry<String, Status>(k, Status.fromJson(v))),
    // status: Status.fromJson(json["status"]),
    dateAdded: json["date_added"],
    products: json["products"],
    total: json["total"],
    view: json["view"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "name": name,
    "status": Map.from(status!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    // "status": status!.toJson(),
    "date_added": dateAdded,
    "products": products,
    "total": total,
    "view": view,
  };
}


class Status {
  Status({
     this.orderStatus,
     this.statusId,
     this.sellerId,
     this.sellerTotal,
     this.totalShipping,
     this.sellerTrackOrderLink,
     this.sellerCancelLink,
     this.sellerName,
     this.storeId,
     this.storeCountry,
     this.storeState,
     this.storeCountryName,
     this.storeStateName,
     this.storeGstin,
     this.orderTotal,
     this.orderTotalShow,
     this.product,
  });

  String? orderStatus;
  String? statusId;
  String? sellerId;
   String? sellerTotal;
   String? totalShipping;
   String? sellerTrackOrderLink;
   String? sellerCancelLink;
   String? sellerName;
   String? storeId;
   String? storeCountry;
   String? storeState;
   String? storeCountryName;
   String? storeStateName;
   String? storeGstin;
   int? orderTotal;
   String? orderTotalShow;
   List<Product>? product;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
     orderStatus: json["order_status"],
     statusId: json["status_id"],
     sellerId: json["seller_id"],
     sellerTotal: json["seller_total"],
     totalShipping: json["total_shipping"],
     sellerTrackOrderLink: json["seller_trackOrder_link"],
     sellerCancelLink: json["seller_cancel_link"],
     sellerName: json["seller_name"],
     storeId: json["store_id"],
     storeCountry: json["store_country"],
     storeState: json["store_state"],
     storeCountryName: json["store_country_name"],
     storeStateName: json["store_state_name"],
     storeGstin: json["store_gstin"],
     orderTotal: json["order_total"],
     orderTotalShow: json["order_total_show"],
     product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order_status": orderStatus,
    "status_id": statusId,
     "seller_id": sellerId,
     "seller_total": sellerTotal,
     "total_shipping": totalShipping,
     "seller_trackOrder_link": sellerTrackOrderLink,
     "seller_cancel_link": sellerCancelLink,
     "seller_name": sellerName,
     "store_id": storeId,
     "store_country": storeCountry,
     "store_state": storeState,
     "store_country_name": storeCountryName,
     "store_state_name": storeStateName,
     "store_gstin": storeGstin,
     "order_total": orderTotal,
     "order_total_show": orderTotalShow,
     "product": List<dynamic>.from(product!.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.productId,
    this.price,
    // this.productReturn,
    // this.priceWithTax,
    // this.tax,
     this.quantity,
    this.productName,
    // this.storeName,
     this.thumb,
    // this.href,
    // this.hsn,
    // this.taxDetails,
  });

  String? productId;
   dynamic price;
  // List<dynamic>? productReturn;
  // dynamic priceWithTax;
  // dynamic tax;
   dynamic quantity;
  dynamic productName;
  // dynamic storeName;
  dynamic thumb;
  // dynamic href;
  // dynamic hsn;
  // dynamic taxDetails;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    price: json["price"],
    // productReturn: List<dynamic>.from(json["return"].map((x) => x)),
    // priceWithTax: json["price_with_tax"],
    // tax: json["tax"],
     quantity: json["quantity"],
    productName: json["product_name"],
    // storeName: json["store_name"],
     thumb: json["thumb"],
    // href: json["href"],
    // hsn: json["hsn"],
    // taxDetails: json["tax_details"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
     "price": price,
    // "return": List<dynamic>.from(productReturn!.map((x) => x)),
    // "price_with_tax": priceWithTax,
    // "tax": tax,
    "quantity": quantity,
    "product_name": productName,
    // "store_name": storeName,
     "thumb": thumb,
    // "href": href,
    // "hsn": hsn,
    // "tax_details": taxDetails,
  };
}
