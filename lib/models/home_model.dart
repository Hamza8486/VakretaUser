// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    required this.logoLink,
    required this.whatsappNumber,
    required this.topCategories,
    required this.silder,
    required this.products,
    required this.banner,
  });

  String logoLink;
  String whatsappNumber;
  List<TopCategory> topCategories;
  List<Banner> silder;
  List<ProductHome> products;
  List<Banner> banner;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
    logoLink: json["logo_link"],
    whatsappNumber: json["whatsapp_number"],
    topCategories: List<TopCategory>.from(json["top_categories"].map((x) => TopCategory.fromJson(x))),
    silder: List<Banner>.from(json["silder"].map((x) => Banner.fromJson(x))),
    products: List<ProductHome>.from(json["products"].map((x) => ProductHome.fromJson(x))),
    banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "logo_link": logoLink,
    "whatsapp_number": whatsappNumber,
    "top_categories": List<dynamic>.from(topCategories.map((x) => x.toJson())),
    "silder": List<dynamic>.from(silder.map((x) => x.toJson())),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
    required this.title,
    required this.preset,
    required  this.layout,
    required  this.sort,
    required this.column,
    required this.data,
  });

  String title;
  String preset;
  String layout;
  String sort;
  String column;
  List<BannerDatum> data;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    title: json["title"],
    preset: json["preset"],
    layout: json["layout"],
    sort: json["sort"],
    column: json["column"],
    data: List<BannerDatum>.from(json["data"].map((x) => BannerDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "preset": preset,
    "layout": layout,
    "sort": sort,
    "column": column,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BannerDatum {
  BannerDatum({
    required  this.name,
    required this.image,
    required this.linkType,
    required this.link,
  });

  String name;
  String image;
  String linkType;
  String link;

  factory BannerDatum.fromJson(Map<String, dynamic> json) => BannerDatum(
    name: json["name"],
    image: json["image"],
    linkType: json["link_type"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "link_type": linkType,
    "link": link,
  };
}

class ProductHome {
  ProductHome({
    required this.title,
    required this.preset,
    required this.layout,
    required  this.sort,
    required this.column,
    required this.data,
  });

  String title;
  String preset;
  String layout;
  String sort;
  String column;
  List<ProductDatum> data;

  factory ProductHome.fromJson(Map<String, dynamic> json) => ProductHome(
    title: json["title"],
    preset: json["preset"],
    layout: json["layout"],
    sort: json["sort"],
    column: json["column"],
    data: List<ProductDatum>.from(json["data"].map((x) => ProductDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "preset": preset,
    "layout": layout,
    "sort": sort,
    "column": column,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductDatum {
  ProductDatum({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.stockStatus,
    required this.thumb,
    this.secondThumb,
    required this.priceValue,
    required this.description,
    required  this.price,
    required this.special,
    required this.tax,
    required this.minimum,
    required this.rating,
    this.dateEnd,
    required  this.href,
  });

  String productId;
  String name;
  String quantity;
  String stockStatus;
  String thumb;
  dynamic secondThumb;
  bool priceValue;
  String description;
  String price;
  String special;
  bool tax;
  String minimum;
  int rating;
  dynamic dateEnd;
  String href;

  factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
    productId: json["product_id"],
    name: json["name"],
    quantity: json["quantity"],
    stockStatus: json["stock_status"],
    thumb: json["thumb"],
    secondThumb: json["second_thumb"],
    priceValue: json["price_value"],
    description: json["description"],
    price: json["price"],
    special: json["special"],
    tax: json["tax"],
    minimum: json["minimum"],
    rating: json["rating"],
    dateEnd: json["date_end"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "name": name,
    "quantity": quantity,
    "stock_status": stockStatus,
    "thumb": thumb,
    "second_thumb": secondThumb,
    "price_value": priceValue,
    "description": description,
    "price": price,
    "special": special,
    "tax": tax,
    "minimum": minimum,
    "rating": rating,
    "date_end": dateEnd,
    "href": href,
  };
}

class TopCategory {
  TopCategory({
    required this.categoryId,
    required this.name,
    this.image,
  });

  String categoryId;
  String name;
  dynamic image;

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
