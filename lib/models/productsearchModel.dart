// To parse this JSON data, do
//
//     final productsearchModel = productsearchModelFromJson(jsonString);
/*

import 'dart:convert';

List<ProductsearchModel> productsearchModelFromJson(String str) => List<ProductsearchModel>.from(json.decode(str).map((x) => ProductsearchModel.fromJson(x)));

String productsearchModelToJson(List<ProductsearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsearchModel {
  ProductsearchModel({
    this.quantity,
    this.priceValue,
    this.productId,
    this.name,
    this.thumb,
    this.thumb2,
    this.price,
    this.special,
    this.href,
  });

  int? quantity;
  bool? priceValue;
  String? productId;
  String? name;
  String? thumb;
  String? thumb2;
  String? price;
  dynamic special;
  String? href;

  factory ProductsearchModel.fromJson(Map<String, dynamic> json) => ProductsearchModel(
    quantity: json["quantity"],
    priceValue: json["price_value"],
    productId: json["product_id"],
    name: json["name"],
    thumb: json["thumb"],
    thumb2: json["thumb2"],
    price: json["price"],
    special: json["special"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "price_value": priceValue,
    "product_id": productId,
    "name": name,
    "thumb": thumb,
    "thumb2": thumb2,
    "price": price,
    "special": special,
    "href": href,
  };
}
*/

// To parse this JSON data, do
//
//     final productsearchModel = productsearchModelFromJson(jsonString);

import 'dart:convert';

ProductsearchModel productsearchModelFromJson(String str) => ProductsearchModel.fromJson(json.decode(str));

String productsearchModelToJson(ProductsearchModel data) => json.encode(data.toJson());

class ProductsearchModel {
  ProductsearchModel({
    this.productTotal,
    this.products,
    this.filter,
  });

  int? productTotal;
  List<Product>? products;
  List<Filter>? filter;

  factory ProductsearchModel.fromJson(Map<String, dynamic> json) => ProductsearchModel(
    productTotal: json["product_total"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    filter: List<Filter>.from(json["filter"].map((x) => Filter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_total": productTotal,
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    "filter": List<dynamic>.from(filter!.map((x) => x.toJson())),
  };
}

class Filter {
  Filter({
    this.title,
    // this.display,
    // this.input,
    // this.inStockText,
    // this.outOfStockText,
    // this.id,
    // this.classes,
    // this.type,
    // this.key,
    // this.panelClasses,
    // this.imageOnly,
    // this.collapsed,
    this.priceRange,
    this.currentPriceRange,
    this.items,
  });

  String? title;
  // String? display;
  // String? input;
  // String? inStockText;
  // String? outOfStockText;
  // String? id;
  // Classes? classes;
  // String? type;
  // String? key;
  // List<PanelClass>? panelClasses;
  // bool? imageOnly;
  // bool? collapsed;
  PriceRange? priceRange;
  PriceRange? currentPriceRange;
  List<Item>? items;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    title: json["title"],
    // display: json["display"],
    // input: json["input"],
    // inStockText: json["inStockText"],
    // outOfStockText: json["outOfStockText"],
    // id: json["id"],
    // classes: Classes.fromJson(json["classes"]),
    // type: json["type"],
    // key: json["key"],
    // panelClasses: List<PanelClass>.from(json["panel_classes"].map((x) => panelClassValues.map![x])),
    // imageOnly: json["image_only"],
    // collapsed: json["collapsed"],
    priceRange: json["price_range"] == null ? null : PriceRange.fromJson(json["price_range"]),
    currentPriceRange: json["current_price_range"] == null ? null : PriceRange.fromJson(json["current_price_range"]),
    items: json["items"] == null ?
            null :
              json["items"].runtimeType != Map ?
                null :
                  List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    // "display": display,
    // "input": input,
    // "inStockText": inStockText,
    // "outOfStockText": outOfStockText,
    // "id": id,
    // "classes": classes!.toJson(),
    // "type": type,
    // "key": key,
    // "panel_classes": List<dynamic>.from(panelClasses!.map((x) => panelClassValues.reverse![x])),
    // "image_only": imageOnly,
    // "collapsed": collapsed,
    "price_range": priceRange == null ? null : priceRange!.toJson(),
    "current_price_range": currentPriceRange == null ? null : currentPriceRange!.toJson(),
    // "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
    "items": items == null ?
              null :
                items.runtimeType != Map ?
                  null :
                    List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Classes {
  Classes({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.textOnly,
    this.imageOnly,
  });

  String? the0;
  String? the1;
  String? the2;
  String? the3;
  bool? textOnly;
  bool? imageOnly;

  factory Classes.fromJson(Map<String, dynamic> json) => Classes(
    the0: json["0"],
    the1: json["1"],
    the2: json["2"],
    the3: json["3"] == null ? null : json["3"],
    textOnly: json["text-only"],
    imageOnly: json["image-only"],
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "1": the1,
    "2": the2,
    "3": the3 == null ? null : the3,
    "text-only": textOnly,
    "image-only": imageOnly,
  };
}

class PriceRange {
  PriceRange({
    this.min,
    this.max,
  });

  int? min;
  int? max;

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
    min: json["min"],
    max: json["max"],
  );

  Map<String, dynamic> toJson() => {
    "min": min,
    "max": max,
  };
}

class Item {
  Item({
    this.id,
    // this.value,
    // this.image,
    // this.total,
    // this.checked,
    // this.image2X,
  });

  dynamic id;
  // String? value;
  // String? image;
  // dynamic total;
  // bool? checked;
  // String? image2X;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    // value: json["value"],
    // image: json["image"] == null ? null : json["image"],
    // total: json["total"],
    // checked: json["checked"],
    // image2X: json["image2x"] == null ? null : json["image2x"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "value": value,
    // "image": image == null ? null : image,
    // "total": total,
    // "checked": checked,
    // "image2x": image2X == null ? null : image2X,
  };
}

enum PanelClass { PANEL_COLLAPSE, COLLAPSE, IN }

final panelClassValues = EnumValues({
  "collapse": PanelClass.COLLAPSE,
  "in": PanelClass.IN,
  "panel-collapse": PanelClass.PANEL_COLLAPSE
});

class Product {
  Product({
    this.quantity,
    this.priceValue,
    this.productId,
    this.name,
    this.thumb,
    this.thumb2,
    this.price,
    this.special,
    this.href,
    this.rating,
    this.discount_percentage
  });

  int? quantity;
  bool? priceValue;
  String? productId;
  String? name;
  String? thumb;
  String? thumb2;
  String? price;
  dynamic special;
  String? href;
  int? rating;
  String? discount_percentage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    quantity: json["quantity"],
    priceValue: json["price_value"],
    productId: json["product_id"],
    name: json["name"],
    thumb: json["thumb"],
    thumb2: json["thumb2"],
    price: json["price"],
    special: json["special"],
    href: json["href"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "price_value": priceValue,
    "product_id": productId,
    "name": name,
    "thumb": thumb,
    "thumb2": thumb2,
    "price": price,
    "special": special,
    "href": href,
    "rating": rating,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    // if (reverseMap == null) {
    //   reverseMap = map!.map((k, v) => new MapEntry(v, k));
    // }
    // return reverseMap;
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
