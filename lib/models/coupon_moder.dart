class Coupons {
  int? total;
  int? success;
  List<CouponList>? couponList = [];

  Coupons({this.total, this.success, this.couponList});

  Coupons.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    success = json['success'];
    if (json['coupon_list'] != null) {
      json['coupon_list'].forEach((v) {
        couponList?.add(new CouponList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['success'] = this.success;
    if (this.couponList != null) {
      data['coupon_list'] = this.couponList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CouponList {
  String? sellerId;
  String? couponId;
  String? name;
  String? code;
  String? type;
  String? discount;
  String? logged;
  String? shipping;
  String? total;
  String? dateStart;
  String? dateEnd;
  String? usesTotal;
  String? usesCustomer;
  String? status;
  String? dateAdded;

  CouponList(
      {this.sellerId,
      this.couponId,
      this.name,
      this.code,
      this.type,
      this.discount,
      this.logged,
      this.shipping,
      this.total,
      this.dateStart,
      this.dateEnd,
      this.usesTotal,
      this.usesCustomer,
      this.status,
      this.dateAdded});

  CouponList.fromJson(Map<String, dynamic> json) {
    sellerId = json['seller_id'];
    couponId = json['coupon_id'];
    name = json['name'];
    code = json['code'];
    type = json['type'];
    discount = json['discount'];
    logged = json['logged'];
    shipping = json['shipping'];
    total = json['total'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    usesTotal = json['uses_total'];
    usesCustomer = json['uses_customer'];
    status = json['status'];
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seller_id'] = this.sellerId;
    data['coupon_id'] = this.couponId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['type'] = this.type;
    data['discount'] = this.discount;
    data['logged'] = this.logged;
    data['shipping'] = this.shipping;
    data['total'] = this.total;
    data['date_start'] = this.dateStart;
    data['date_end'] = this.dateEnd;
    data['uses_total'] = this.usesTotal;
    data['uses_customer'] = this.usesCustomer;
    data['status'] = this.status;
    data['date_added'] = this.dateAdded;
    return data;
  }
}
