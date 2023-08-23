class SugestApiResponse {
  String? status;
  List<Response>? response = [];

  SugestApiResponse({
    this.status,
    this.response,
  });

  SugestApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      json['response'].forEach((v) {
        response?.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.response != null) {
      data['response'] = this.response?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Response {
  int? quantity;
  bool? priceValue;
  String? productId;
  String? name;
  String? thumb;
  String? thumb2;
  String? price;
  dynamic special;
  String? href;
  bool? viewMore;

  Response(
      {this.quantity,
      this.priceValue,
      this.productId,
      this.name,
      this.thumb,
      this.thumb2,
      this.price,
      this.special,
      this.href,
      this.viewMore});

  Response.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    priceValue = json['price_value'];
    productId = json['product_id'];
    name = json['name'];
    thumb = json['thumb'];
    thumb2 = json['thumb2'];
    price = json['price'];
    special = json['special'];
    href = json['href'];
    viewMore = json['view_more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['price_value'] = this.priceValue;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['thumb'] = this.thumb;
    data['thumb2'] = this.thumb2;
    data['price'] = this.price;
    data['special'] = this.special;
    data['href'] = this.href;
    data['view_more'] = this.viewMore;
    return data;
  }
}
