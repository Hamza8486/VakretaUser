class SearchModel {
  var imageWidth;
  var imageHeight;
  var productTotal;
  List<Products>? products;
  Filter? filter;

  SearchModel(
      {this.imageWidth,
        this.imageHeight,
        this.productTotal,
        this.products,
        this.filter});

  SearchModel.fromJson(Map<String, dynamic> json) {
    imageWidth = json['image_width'];
    imageHeight = json['image_height'];
    productTotal = json['product_total'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    filter =
    json['filter'] != null ? new Filter.fromJson(json['filter']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_width'] = this.imageWidth;
    data['image_height'] = this.imageHeight;
    data['product_total'] = this.productTotal;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.filter != null) {
      data['filter'] = this.filter!.toJson();
    }
    return data;
  }
}

class Products {
  var quantity;
  bool? priceValue;
  String? productId;
  String? name;
  String? thumb;
  var price;
  var special;
  var discount;
  String? href;

  Products(
      {this.quantity,
        this.priceValue,
        this.productId,
        this.name,
        this.thumb,
        this.price,
        this.special,
        this.discount,
        this.href});

  Products.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    priceValue = json['price_value'];
    productId = json['product_id'];
    name = json['name'];
    thumb = json['thumb'];
    price = json['price'];
    special = json['special'];
    discount = json['discount'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['price_value'] = this.priceValue;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['thumb'] = this.thumb;
    data['price'] = this.price;
    data['special'] = this.special;
    data['discount'] = this.discount;
    data['href'] = this.href;
    return data;
  }
}

class Filter {
  List<M>? m;
  List<F4>? f4;
  List<F4>? f5;

  Filter({this.m, this.f4, this.f5});

  Filter.fromJson(Map<String, dynamic> json) {
    if (json['m'] != null) {
      m = <M>[];
      json['m'].forEach((v) {
        m!.add(new M.fromJson(v));
      });
    }
    if (json['f4'] != null) {
      f4 = <F4>[];
      json['f4'].forEach((v) {
        f4!.add(new F4.fromJson(v));
      });
    }
    if (json['f5'] != null) {
      f5 = <F4>[];
      json['f5'].forEach((v) {
        f5!.add(new F4.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.m != null) {
      data['m'] = this.m!.map((v) => v.toJson()).toList();
    }
    if (this.f4 != null) {
      data['f4'] = this.f4!.map((v) => v.toJson()).toList();
    }
    if (this.f5 != null) {
      data['f5'] = this.f5!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class M {
  String? id;
  String? value;
  String? image;
  String? total;
  bool? checked;
  String? image2x;

  M({this.id, this.value, this.image, this.total, this.checked, this.image2x});

  M.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    image = json['image'];
    total = json['total'];
    checked = json['checked'];
    image2x = json['image2x'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['image'] = this.image;
    data['total'] = this.total;
    data['checked'] = this.checked;
    data['image2x'] = this.image2x;
    return data;
  }
}

class F4 {
  String? id;
  String? value;
  String? total;
  bool? checked;

  F4({this.id, this.value, this.total, this.checked});

  F4.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    total = json['total'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['total'] = this.total;
    data['checked'] = this.checked;
    return data;
  }
}
