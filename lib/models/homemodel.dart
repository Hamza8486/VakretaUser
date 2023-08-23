// To parse this JSON data, do
//
//     final homeScreenModel = homeScreenModelFromJson(jsonString);

import 'dart:convert';

HomeScreenModel homeScreenModelFromJson(String str) => HomeScreenModel.fromJson(json.decode(str));

String homeScreenModelToJson(HomeScreenModel data) => json.encode(data.toJson());



class HomeScreenModel {
  List<Silder>? silder;
  List<ProductCaterory>? products;
  List<TopCategory>?topCategory;
  List<BannerModel>? banner;

  HomeScreenModel({this.silder, this.products, this.banner,this.topCategory});

  HomeScreenModel.fromJson(Map<String, dynamic> json) {
    if (json['silder'] != null) {
      silder = <Silder>[];
      json['silder'].forEach((v) {
        silder!.add(Silder.fromJson(v));
      });
    }
    if (json['top_categories'] != null) {
      topCategory = <TopCategory>[];
      json['top_categories'].forEach((v) {
        topCategory!.add(TopCategory.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <ProductCaterory>[];
      json['products'].forEach((v) {
        products!.add(ProductCaterory.fromJson(v));
      });
    }
    if (json['banner'] != null) {
      banner = <BannerModel>[];
      json['banner'].forEach((v) {
        banner!.add(BannerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.silder != null) {
      data['silder'] = this.silder!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.banner != null) {
      data['banner'] = this.banner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Silder {
  String? title;
  String? preset;
  String? layout;
  String? sort;
  String? column;
  List<Data>? data;

  Silder(
      {this.title,
        this.preset,
        this.layout,
        this.sort,
        this.column,
        this.data});

  Silder.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    preset = json['preset'];
    layout = json['layout'];
    sort = json['sort'];
    column = json['column'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['preset'] = this.preset;
    data['layout'] = this.layout;
    data['sort'] = this.sort;
    data['column'] = this.column;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerModel {
  String? title;
  String? preset;
  String? layout;
  String? sort;
  String? column;
  List<Data>? data;

  BannerModel(
      {this.title,
        this.preset,
        this.layout,
        this.sort,
        this.column,
        this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    preset = json['preset'];
    layout = json['layout'];
    sort = json['sort'];
    column = json['column'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['preset'] = this.preset;
    data['layout'] = this.layout;
    data['sort'] = this.sort;
    data['column'] = this.column;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? image;
  String? linkType;
  String? link;

  Data({this.name, this.image, this.linkType, this.link});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    linkType = json['link_type'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['link_type'] = this.linkType;
    data['link'] = this.link;
    return data;
  }
}
class ProductCaterory {
  String? title;
  String? preset;
  String? layout;
  String? sort;
  String? column;
  List<ProductInfo>? data;

  ProductCaterory(
      {this.title,
        this.preset,
        this.layout,
        this.sort,
        this.column,
        this.data});

  ProductCaterory.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    preset = json['preset'];
    layout = json['layout'];
    sort = json['sort'];
    column = json['column'];
    if (json['data'] != null) {
      data = <ProductInfo>[];
      json['data'].forEach((v) {
        data!.add(new ProductInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['preset'] = this.preset;
    data['layout'] = this.layout;
    data['sort'] = this.sort;
    data['column'] = this.column;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class ProductInfo {
  var productId;
  String? name;
  var quantity;
  String? stockStatus;
  String? thumb;
  String? secondThumb;
  var priceValue;
  String? description;
  var price;
  var special;
  var discount;
  var tax;
  String? minimum;
  var rating;
  var dateEnd;
  String? href;

  ProductInfo(
      {this.productId,
        this.name,
        this.quantity,
        this.stockStatus,
        this.thumb,
        this.discount,
        this.secondThumb,
        this.priceValue,
        this.description,
        this.price,
        this.special,
        this.tax,
        this.minimum,
        this.rating,
        this.dateEnd,
        this.href});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    quantity = json['quantity'];
    stockStatus = json['stock_status'];
    thumb = json['thumb'];
    secondThumb = json['second_thumb'].toString();
    priceValue = json['price_value'];
    description = json['description'];
    price = json['price'];
    special = json['special'];
    discount = json['discount'];
    tax = json['tax'];
    minimum = json['minimum'].toString();
    rating = json['rating'];
    dateEnd = json['date_end'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['discount'] = this.discount;
    data['stock_status'] = this.stockStatus;
    data['thumb'] = this.thumb;
    data['second_thumb'] = this.secondThumb;
    data['price_value'] = this.priceValue;
    data['description'] = this.description;
    data['price'] = this.price;
    data['special'] = this.special;
    data['tax'] = this.tax;
    data['minimum'] = this.minimum;
    data['rating'] = this.rating;
    data['date_end'] = this.dateEnd;
    data['href'] = this.href;
    return data;
  }
}
class ViewAllModel {
  String? productId;
  String? name;
  String? quantity;
  String? stockStatus;
  String? thumb;
  String? secondThumb;
  var priceValue;
  String? price;
  String? special;
  String? minimum;
  var rating;
  var dateEnd;
  String? href;

  ViewAllModel(
      {this.productId,
        this.name,
        this.quantity,
        this.stockStatus,
        this.thumb,
        this.secondThumb,
        this.priceValue,
        this.price,
        this.special,
        this.minimum,
        this.rating,
        this.dateEnd,
        this.href});

  ViewAllModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    quantity = json['quantity'];
    stockStatus = json['stock_status'];
    thumb = json['thumb'];
    secondThumb = json['second_thumb'].toString();
    priceValue = json['price_value'];
    price = json['price'];
    special = json['special'].toString();
    minimum = json['minimum'].toString();
    rating = json['rating'];
    dateEnd = json['date_end'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_id'] = productId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['stock_status'] = this.stockStatus;
    data['thumb'] = this.thumb;
    data['second_thumb'] = this.secondThumb;
    data['price_value'] = this.priceValue;
    data['price'] = this.price;
    data['special'] = this.special;
    data['minimum'] = this.minimum;
    data['rating'] = this.rating;
    data['date_end'] = this.dateEnd;
    data['href'] = this.href;
    return data;
  }
}

class TopCategory {
  TopCategory({
    this.categoryId,
    this.name,
    this.image,
  });

  String? categoryId;
  String? name;
  String? image;

  factory TopCategory.fromJson(Map<String, dynamic> json) => TopCategory(
    categoryId: json["category_id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "name": name,
    "image": image,
  };
}
