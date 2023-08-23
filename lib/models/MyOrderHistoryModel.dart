



class MyOrderHistoryModel {
  String? orderId;
  String? paymentCode;
  String? name;
  List<Status>? status;
  String? dateAdded;
  int? products;
  String? total;
  String? view;

  MyOrderHistoryModel({this.orderId, this.name, this.paymentCode,this.status, this.dateAdded, this.products, this.total, this.view});

  MyOrderHistoryModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    name = json['name'];
    paymentCode = json['payment_code'];
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) { status!.add(Status.fromJson(v)); });
    }
    dateAdded = json['date_added'];
    products = json['products'];
    total = json['total'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['name'] = this.name;
    data['payment_code'] = this.paymentCode;
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }
    data['date_added'] = this.dateAdded;
    data['products'] = this.products;
    data['total'] = this.total;
    data['view'] = this.view;
    return data;
  }
}

class Status {
  String? orderStatus;
  String? statusId;
  String? sellerId;
  String? sellerTotal;
  String? totalShipping;
  String? sellerName;
  String? storeId;
  String? storeCountry;
  String? storeState;
  String? storeCountryName;
  String? storeStateName;
  String? storeGstin;
  var orderTotal;
  String? orderTotalShow;
  List<Product>? product;
  List<TotalsInfo>? totalsInfo;

  Status({this.orderStatus, this.statusId,
  this.totalsInfo,

    this.sellerId, this.sellerTotal, this.totalShipping, this.sellerName, this.storeId, this.storeCountry, this.storeState, this.storeCountryName, this.storeStateName, this.storeGstin, this.orderTotal, this.orderTotalShow, this.product});

  Status.fromJson(Map<String, dynamic> json) {
    orderStatus = json['order_status'];
    statusId = json['status_id'];
    sellerId = json['seller_id'];
    sellerTotal = json['seller_total'];
    totalShipping = json['total_shipping'];
    sellerName = json['seller_name'];
    storeId = json['store_id'];
    storeCountry = json['store_country'];
    storeState = json['store_state'];

    storeCountryName = json['store_country_name'];
    storeStateName = json['store_state_name'];
    storeGstin = json['store_gstin'];
    orderTotal = json['order_total'];
    orderTotalShow = json['order_total_show'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) { product!.add(new Product.fromJson(v)); });
    }
    if (json['totals_info'] != null) {
      totalsInfo = <TotalsInfo>[];
      json['totals_info'].forEach((v) {totalsInfo!.add(new TotalsInfo.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_status'] = this.orderStatus;
    data['status_id'] = this.statusId;
    data['seller_id'] = this.sellerId;

    data['seller_total'] = this.sellerTotal;
    data['total_shipping'] = this.totalShipping;
    data['seller_name'] = this.sellerName;
    data['store_id'] = this.storeId;
    data['store_country'] = this.storeCountry;
    data['store_state'] = this.storeState;
    data['store_country_name'] = this.storeCountryName;
    data['store_state_name'] = this.storeStateName;
    data['store_gstin'] = this.storeGstin;
    data['order_total'] = this.orderTotal;
    data['order_total_show'] = this.orderTotalShow;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    if (this.totalsInfo != null) {
      data['totals_info'] = this.totalsInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? productId;
  String? price;
  Returns? returns;
  String? priceWithTax;
  String? tax;
  String? quantity;
  String? productName;
  String? storeName;
  String? thumb;
  String? href;
  String? hsn;
  List<TaxDetails>? taxDetails;
  String? status;
  int? isTraking;
  int? isCancel;
  int? isReturn;
  int? isReturnTraking;
  int? isProductReview;
  int? isSellerReview;
  String? invoice;

  Product({this.productId, this.price, this.returns, this.priceWithTax, this.tax, this.quantity, this.productName, this.storeName, this.thumb, this.href, this.hsn, this.taxDetails, this.status, this.isTraking, this.isCancel, this.isReturn, this.isReturnTraking, this.isProductReview, this.isSellerReview, this.invoice});

Product.fromJson(Map<String, dynamic> json) {
productId = json['product_id'];
price = json['price'];
returns = json['return'] != null ? Returns(quantity: json['quantity'],returnStatusId:json['return_status_id'] ,status:json['status'],) : null;
priceWithTax = json['price_with_tax'];
tax = json['tax'];
quantity = json['quantity'];
productName = json['product_name'];
storeName = json['store_name'];
thumb = json['thumb'];
href = json['href'];
hsn = json['hsn'];
if (json['tax_details'] != null) {
taxDetails = <TaxDetails>[];
json['tax_details'].forEach((v) { taxDetails!.add( TaxDetails.fromJson(v)); });
}
status = json['status'];
isTraking = json['is_traking'];
isCancel = json['is_cancel'];
isReturn = json['is_return'];
isReturnTraking = json['is_return_traking'];
isProductReview = json['is_product_review'];
isSellerReview = json['is_seller_review'];
invoice = json['invoice'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['product_id'] = this.productId;
  data['price'] = this.price;
  if (this.returns != null) {
    data['return'] = this.returns!.toJson();
  }
  data['price_with_tax'] = this.priceWithTax;
  data['tax'] = this.tax;
  data['quantity'] = this.quantity;
  data['product_name'] = this.productName;
  data['store_name'] = this.storeName;
  data['thumb'] = this.thumb;
  data['href'] = this.href;
  data['hsn'] = this.hsn;
  if (this.taxDetails != null) {
  data['tax_details'] = this.taxDetails!.map((v) => v.toJson()).toList();
  }
  data['status'] = this.status;
  data['is_traking'] = this.isTraking;
  data['is_cancel'] = this.isCancel;
  data['is_return'] = this.isReturn;
  data['is_return_traking'] = this.isReturnTraking;
  data['is_product_review'] = this.isProductReview;
  data['is_seller_review'] = this.isSellerReview;
  data['invoice'] = this.invoice;
  return data;
}
}

class Returns {
  String? quantity;
  String? returnStatusId;
  String? status;

  Returns({this.quantity, this.returnStatusId, this.status});

  Returns.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    returnStatusId = json['return_status_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['return_status_id'] = this.returnStatusId;
    data['status'] = this.status;
    return data;
  }
}

class TaxDetails {
  String? taxRateId;
  double? taxAmount;
  String? name;
  String? rate;

  TaxDetails({this.taxRateId, this.taxAmount, this.name, this.rate});

  TaxDetails.fromJson(Map<String, dynamic> json) {
    taxRateId = json['tax_rate_id'];
    taxAmount = json['tax_amount'];
    name = json['name'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tax_rate_id'] = this.taxRateId;
    data['tax_amount'] = this.taxAmount;
    data['name'] = this.name;
    data['rate'] = this.rate;
    return data;
  }
}
class TotalsInfo {
  String? orderTotalId;
  String? orderId;
  String? sellerId;
  String? code;
  String? title;
  String? value;
  String? sortOrder;

  TotalsInfo({this.orderTotalId, this.orderId, this.sellerId, this.code, this.title, this.value, this.sortOrder});

  TotalsInfo.fromJson(Map<String, dynamic> json) {
    orderTotalId = json['order_total_id'];
    orderId = json['order_id'];
    sellerId = json['seller_id'];
    code = json['code'];
    title = json['title'];
    value = json['value'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_total_id'] = this.orderTotalId;
    data['order_id'] = this.orderId;
    data['seller_id'] = this.sellerId;
    data['code'] = this.code;
    data['title'] = this.title;
    data['value'] = this.value;
    data['sort_order'] = this.sortOrder;
    return data;
  }
}