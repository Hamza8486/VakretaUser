import 'Categories.dart';
import 'Products.dart';
import 'Filter.dart';

class TopCategoryModel {
  TopCategoryModel({
      this.categoryName,
      this.thumb,
      this.description,
      this.categories,
      this.productTotal,
      this.products,
      this.imageWidth,
      this.imageHeight,
      this.dummyImage,
      this.sort,
      this.order,
      this.limit,
      this.filter,});

  TopCategoryModel.fromJson(dynamic json) {
    categoryName = json['category_name'];
    thumb = json['thumb'];
    description = json['description'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    productTotal = json['product_total'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    imageWidth = json['image_width'].toString();
    imageHeight = json['image_height'].toString();
    dummyImage = json['dummy_image'];
    sort = json['sort'];
    order = json['order'];
    limit = json['limit'];
    filter =
    json['filter'] != null ? new Filter.fromJson(json['filter']) : null;
  }
  String? categoryName;
  String? thumb;
  String? description;
  List<Categories>? categories;
  String? productTotal;
  List<Products>? products;
  String? imageWidth;
  String? imageHeight;
  String? dummyImage;
  String? sort;
  String? order;
  String? limit;
  Filter? filter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_name'] = categoryName;
    map['thumb'] = thumb;
    map['description'] = description;
    if (categories != null) {
      map['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    map['product_total'] = productTotal;
    if (products != null) {
      map['products'] = products!.map((v) => v.toJson()).toList();
    }
    map['image_width'] = imageWidth;
    map['image_height'] = imageHeight;
    map['dummy_image'] = dummyImage;
    map['sort'] = sort;
    map['order'] = order;
    map['limit'] = limit;
    if (this.filter != null) {
      map['filter'] = this.filter!.toJson();
    }
    return map;
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


