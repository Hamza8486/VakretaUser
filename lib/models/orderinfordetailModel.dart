// To parse this JSON data, do
//
//     final orderInfoDetailModel = orderInfoDetailModelFromJson(jsonString);

import 'dart:convert';

OrderInfoDetailModel orderInfoDetailModelFromJson(String str) => OrderInfoDetailModel.fromJson(json.decode(str));

String orderInfoDetailModelToJson(OrderInfoDetailModel data) => json.encode(data.toJson());

class OrderInfoDetailModel {
  OrderInfoDetailModel({
    this.textSellerLabel,
    this.textSellerLabelStatus,
    this.sellerDetails,
    this.sellerGst,
    this.invoiceNo,
    this.orderId,
    this.dateAdded,
    this.paymentAddress,
    this.paymentMethod,
    this.shippingAddress,
    this.shippingMethod,
    this.products,
    this.sellerOrderStatusId,
    this.totals,
    this.comment,
    this.columnService,
    this.columnCode,
    this.columnLink,
    this.textCourier,
    this.columnDeliveryDate,
    this.columnShippedQuantity,
    this.orderShipmentData,
  });

  String? textSellerLabel;
  String? textSellerLabelStatus;
  SellerDetails? sellerDetails;
  String? sellerGst;
  String? invoiceNo;
  int? orderId;
  String? dateAdded;
  String? paymentAddress;
  String? paymentMethod;
  String? shippingAddress;
  String? shippingMethod;
  List<Product>? products;
  String? sellerOrderStatusId;
  List<Total>? totals;
  String? comment;
  String? columnService;
  String? columnCode;
  String? columnLink;
  String? textCourier;
  String? columnDeliveryDate;
  String? columnShippedQuantity;
  List<dynamic>? orderShipmentData;

  factory OrderInfoDetailModel.fromJson(Map<String, dynamic> json) => OrderInfoDetailModel(
        textSellerLabel: json["text_seller_label"],
        textSellerLabelStatus: json["text_seller_label_status"],
        sellerDetails: SellerDetails.fromJson(json["seller_details"]),
        sellerGst: json["seller_gst"],
        invoiceNo: json["invoice_no"],
        orderId: json["order_id"],
        dateAdded: json["date_added"],
        paymentAddress: json["payment_address"],
        paymentMethod: json["payment_method"],
        shippingAddress: json["shipping_address"],
        shippingMethod: json["shipping_method"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        sellerOrderStatusId: json["seller_order_status_id"],
        totals: List<Total>.from(json["totals"].map((x) => Total.fromJson(x))),
        comment: json["comment"],
        columnService: json["column_service"],
        columnCode: json["column_code"],
        columnLink: json["column_link"],
        textCourier: json["text_courier"],
        columnDeliveryDate: json["column_delivery_date"],
        columnShippedQuantity: json["column_shipped_quantity"],
        orderShipmentData: List<dynamic>.from(json["order_shipment_data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "text_seller_label": textSellerLabel,
        "text_seller_label_status": textSellerLabelStatus,
        "seller_details": sellerDetails!.toJson(),
        "seller_gst": sellerGst,
        "invoice_no": invoiceNo,
        "order_id": orderId,
        "date_added": dateAdded,
        "payment_address": paymentAddress,
        "payment_method": paymentMethod,
        "shipping_address": shippingAddress,
        "shipping_method": shippingMethod,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "seller_order_status_id": sellerOrderStatusId,
        "totals": List<dynamic>.from(totals!.map((x) => x.toJson())),
        "comment": comment,
        "column_service": columnService,
        "column_code": columnCode,
        "column_link": columnLink,
        "text_courier": textCourier,
        "column_delivery_date": columnDeliveryDate,
        "column_shipped_quantity": columnShippedQuantity,
        "order_shipment_data": List<dynamic>.from(orderShipmentData!.map((x) => x)),
      };
}

class Product {
  Product({
    this.productId,
    this.isReview,
    this.name,
    this.model,
    this.hsn,
    this.option,
    this.quantity,
    this.price,
    this.total,
    this.reorder,
    this.productReturn,
    this.returnStatus,
    this.returnpolicyStatus,
    this.taxDetails,
    this.totalPrice,
    this.srn,
    this.gstin,
    this.deliveryAddress,
    this.deliveraddresslon,
    this.deliveraddresslat,
    this.adminOrderStatusId,
    this.sellerStoreName,
    this.sellerId,
    this.sellerStoreId,
    this.sellerOrderStatus,
    this.classes,
  });

  String? productId;
  int? isReview;
  String? name;
  String? model;
  String? hsn;
  List<dynamic>? option;
  String? quantity;
  String? price;
  String? total;
  String? reorder;
  String? productReturn;
  String? returnStatus;
  int? returnpolicyStatus;
  List<TaxDetail>? taxDetails;
  String? totalPrice;
  int? srn;
  Map<String, String>? gstin;
  String? deliveryAddress;
  String? deliveraddresslon;
  String? deliveraddresslat;
  String? adminOrderStatusId;
  String? sellerStoreName;
  String? sellerId;
  String? sellerStoreId;
  SellerOrderStatus? sellerOrderStatus;
  List<String>? classes;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        isReview: json["is_review"],
        name: json["name"],
        model: json["model"],
        hsn: json["hsn"],
        option: List<dynamic>.from(json["option"].map((x) => x)),
        quantity: json["quantity"],
        price: json["price"],
        total: json["total"],
        reorder: json["reorder"],
        productReturn: json["return"],
        returnStatus: json["return_status"],
        returnpolicyStatus: json["returnpolicy_status"],
        taxDetails: List<TaxDetail>.from(json["tax_details"].map((x) => TaxDetail.fromJson(x))),
        totalPrice: json["total_price"],
        srn: json["srn"],
        gstin: Map.from(json["gstin"]).map((k, v) => MapEntry<String, String>(k, v)),
        deliveryAddress: json["delivery_address"],
        deliveraddresslon: json["deliveraddresslon"],
        deliveraddresslat: json["deliveraddresslat"],
        adminOrderStatusId: json["admin_order_status_id"],
        sellerStoreName: json["seller_store_name"],
        sellerId: json["seller_id"],
        sellerStoreId: json["seller_store_id"],
        sellerOrderStatus: SellerOrderStatus.fromJson(json["seller_order_status"]),
        classes: List<String>.from(json["classes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "is_review": isReview,
        "name": name,
        "model": model,
        "hsn": hsn,
        "option": List<dynamic>.from(option!.map((x) => x)),
        "quantity": quantity,
        "price": price,
        "total": total,
        "reorder": reorder,
        "return": productReturn,
        "return_status": returnStatus,
        "returnpolicy_status": returnpolicyStatus,
        "tax_details": List<dynamic>.from(taxDetails!.map((x) => x.toJson())),
        "total_price": totalPrice,
        "srn": srn,
        "gstin": Map.from(gstin!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "delivery_address": deliveryAddress,
        "deliveraddresslon": deliveraddresslon,
        "deliveraddresslat": deliveraddresslat,
        "admin_order_status_id": adminOrderStatusId,
        "seller_store_name": sellerStoreName,
        "seller_id": sellerId,
        "seller_store_id": sellerStoreId,
        "seller_order_status": sellerOrderStatus!.toJson(),
        "classes": List<dynamic>.from(classes!.map((x) => x)),
      };
}

class SellerOrderStatus {
  SellerOrderStatus({
    this.createdAt,
    this.status,
    this.comment,
    this.notify,
    this.orderStatusId,
  });

  DateTime? createdAt;
  String? status;
  String? comment;
  String? notify;
  String? orderStatusId;

  factory SellerOrderStatus.fromJson(Map<String, dynamic> json) => SellerOrderStatus(
        createdAt: DateTime.parse(json["created_at"]),
        status: json["status"],
        comment: json["comment"],
        notify: json["notify"],
        orderStatusId: json["order_status_id"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt!.toIso8601String(),
        "status": status,
        "comment": comment,
        "notify": notify,
        "order_status_id": orderStatusId,
      };
}

class TaxDetail {
  TaxDetail({
    this.name,
    this.rate,
    this.rateType,
    this.amount,
  });

  String? name;
  int? rate;
  dynamic rateType;
  double? amount;

  factory TaxDetail.fromJson(Map<String, dynamic> json) => TaxDetail(
        name: json["name"],
        rate: json["rate"],
        rateType: json["rate_type"],
        amount: json["amount"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rate": rate,
        "rate_type": rateType,
        "amount": amount,
      };
}

class SellerDetails {
  SellerDetails({
    this.id,
    this.sellerId,
    this.storeName,
    this.storeLogo,
    this.storeEmail,
    this.storePhone,
    this.storeBanner,
    this.document,
    this.storeDescription,
    this.storeAddress,
    this.storeCity,
    this.storeCountry,
    this.storeState,
    this.storeZipcode,
    this.storeArea,
    this.storeShippingPolicy,
    this.storeReturnPolicy,
    this.storeMetaKeywords,
    this.storeMetaDescriptions,
    this.storeBankDetails,
    this.storeTin,
    this.storeShippingType,
    this.storeShippingOrderType,
    this.storeShippingCharge,
    this.storeLiveChatEnable,
    this.storeLiveChatCode,
    this.storeStatus,
    this.storeCommission,
    this.isRemoved,
    this.storeCreatedAt,
    this.storeUpdatedAt,
    this.sellerPaypalId,
    this.storeImage,
    this.storeVideo,
    this.googleMap,
    this.googleMapLink,
    this.storeTimings,
    this.multiStoreId,
    this.vacation,
    this.sortOrder,
    this.isReview,
  });

  String? id;
  String? sellerId;
  String? storeName;
  String? storeLogo;
  String? storeEmail;
  String? storePhone;
  String? storeBanner;
  String? document;
  String? storeDescription;
  String? storeAddress;
  String? storeCity;
  String? storeCountry;
  String? storeState;
  String? storeZipcode;
  String? storeArea;
  String? storeShippingPolicy;
  String? storeReturnPolicy;
  String? storeMetaKeywords;
  String? storeMetaDescriptions;
  String? storeBankDetails;
  String? storeTin;
  String? storeShippingType;
  String? storeShippingOrderType;
  String? storeShippingCharge;
  String? storeLiveChatEnable;
  String? storeLiveChatCode;
  String? storeStatus;
  dynamic storeCommission;
  String? isRemoved;
  DateTime? storeCreatedAt;
  DateTime? storeUpdatedAt;
  String? sellerPaypalId;
  String? storeImage;
  String? storeVideo;
  String? googleMap;
  String? googleMapLink;
  String? storeTimings;
  String? multiStoreId;
  String? vacation;
  String? sortOrder;
  int? isReview;

  factory SellerDetails.fromJson(Map<String, dynamic> json) => SellerDetails(
        id: json["id"],
        sellerId: json["seller_id"],
        storeName: json["store_name"],
        storeLogo: json["store_logo"],
        storeEmail: json["store_email"],
        storePhone: json["store_phone"],
        storeBanner: json["store_banner"],
        document: json["document"],
        storeDescription: json["store_description"],
        storeAddress: json["store_address"],
        storeCity: json["store_city"],
        storeCountry: json["store_country"],
        storeState: json["store_state"],
        storeZipcode: json["store_zipcode"],
        storeArea: json["store_area"],
        storeShippingPolicy: json["store_shipping_policy"],
        storeReturnPolicy: json["store_return_policy"],
        storeMetaKeywords: json["store_meta_keywords"],
        storeMetaDescriptions: json["store_meta_descriptions"],
        storeBankDetails: json["store_bank_details"],
        storeTin: json["store_tin"],
        storeShippingType: json["store_shipping_type"],
        storeShippingOrderType: json["store_shipping_order_type"],
        storeShippingCharge: json["store_shipping_charge"],
        storeLiveChatEnable: json["store_live_chat_enable"],
        storeLiveChatCode: json["store_live_chat_code"],
        storeStatus: json["store_status"],
        storeCommission: json["store_commission"],
        isRemoved: json["is_removed"],
        storeCreatedAt: DateTime.parse(json["store_created_at"]),
        storeUpdatedAt: DateTime.parse(json["store_updated_at"]),
        sellerPaypalId: json["seller_paypal_id"],
        storeImage: json["store_image"],
        storeVideo: json["store_video"],
        googleMap: json["google_map"],
        googleMapLink: json["google_map_link"],
        storeTimings: json["store_timings"],
        multiStoreId: json["multi_store_id"],
        vacation: json["vacation"],
        sortOrder: json["sort_order"],
        isReview: json["is_review"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seller_id": sellerId,
        "store_name": storeName,
        "store_logo": storeLogo,
        "store_email": storeEmail,
        "store_phone": storePhone,
        "store_banner": storeBanner,
        "document": document,
        "store_description": storeDescription,
        "store_address": storeAddress,
        "store_city": storeCity,
        "store_country": storeCountry,
        "store_state": storeState,
        "store_zipcode": storeZipcode,
        "store_area": storeArea,
        "store_shipping_policy": storeShippingPolicy,
        "store_return_policy": storeReturnPolicy,
        "store_meta_keywords": storeMetaKeywords,
        "store_meta_descriptions": storeMetaDescriptions,
        "store_bank_details": storeBankDetails,
        "store_tin": storeTin,
        "store_shipping_type": storeShippingType,
        "store_shipping_order_type": storeShippingOrderType,
        "store_shipping_charge": storeShippingCharge,
        "store_live_chat_enable": storeLiveChatEnable,
        "store_live_chat_code": storeLiveChatCode,
        "store_status": storeStatus,
        "store_commission": storeCommission,
        "is_removed": isRemoved,
        "store_created_at": "${storeCreatedAt!.year.toString().padLeft(4, '0')}-${storeCreatedAt!.month.toString().padLeft(2, '0')}-${storeCreatedAt!.day.toString().padLeft(2, '0')}",
        "store_updated_at": "${storeUpdatedAt!.year.toString().padLeft(4, '0')}-${storeUpdatedAt!.month.toString().padLeft(2, '0')}-${storeUpdatedAt!.day.toString().padLeft(2, '0')}",
        "seller_paypal_id": sellerPaypalId,
        "store_image": storeImage,
        "store_video": storeVideo,
        "google_map": googleMap,
        "google_map_link": googleMapLink,
        "store_timings": storeTimings,
        "multi_store_id": multiStoreId,
        "vacation": vacation,
        "sort_order": sortOrder,
        "is_review": isReview,
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
