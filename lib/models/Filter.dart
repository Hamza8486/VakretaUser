class Filter {
  String? title;
  String? display;
  String? input;
  String? inStockText;
  String? outOfStockText;
  String? id;
  Classes? classes;
  String? type;
  String? key;
  List<String>? panelClasses;
  bool? imageOnly;
  bool? collapsed;
  PriceRange? priceRange;
  PriceRange? currentPriceRange;
  List<Items>? items;

  Filter(
      {this.title,
        this.display,
        this.input,
        this.inStockText,
        this.outOfStockText,
        this.id,
        this.classes,
        this.type,
        this.key,
        this.panelClasses,
        this.imageOnly,
        this.collapsed,
        this.priceRange,
        this.currentPriceRange,
        this.items});

  Filter.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    display = json['display'];
    input = json['input'];
    inStockText = json['inStockText'];
    outOfStockText = json['outOfStockText'];
    id = json['id'];
    classes =
    json['classes'] != null ? new Classes.fromJson(json['classes']) : null;
    type = json['type'];
    key = json['key'];
    panelClasses = json['panel_classes'].cast<String>();
    imageOnly = json['image_only'];
    collapsed = json['collapsed'];
    priceRange = json['price_range'] != null
        ? new PriceRange.fromJson(json['price_range'])
        : null;
    currentPriceRange = json['current_price_range'] != null
        ? new PriceRange.fromJson(json['current_price_range'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['display'] = this.display;
    data['input'] = this.input;
    data['inStockText'] = this.inStockText;
    data['outOfStockText'] = this.outOfStockText;
    data['id'] = this.id;
    if (this.classes != null) {
      data['classes'] = this.classes!.toJson();
    }
    data['type'] = this.type;
    data['key'] = this.key;
    data['panel_classes'] = this.panelClasses;
    data['image_only'] = this.imageOnly;
    data['collapsed'] = this.collapsed;
    if (this.priceRange != null) {
      data['price_range'] = this.priceRange!.toJson();
    }
    if (this.currentPriceRange != null) {
      data['current_price_range'] = this.currentPriceRange!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classes {
  String? s0;
  String? s1;
  String? s2;
  String? s3;
  bool? textOnly;
  bool? imageOnly;

  Classes({this.s0, this.s1, this.s2, this.s3, this.textOnly, this.imageOnly});

  Classes.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    textOnly = json['text-only'];
    imageOnly = json['image-only'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['text-only'] = this.textOnly;
    data['image-only'] = this.imageOnly;
    return data;
  }
}

class PriceRange {
  int? min;
  int? max;

  PriceRange({this.min, this.max});

  PriceRange.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    return data;
  }
}

class Items {
  String? id;
  String? value;
  String? image;
  String? total;
  bool? checked;
  String? image2x;

  Items(
      {this.id,
        this.value,
        this.image,
        this.total,
        this.checked,
        this.image2x});

  Items.fromJson(Map<String, dynamic> json) {
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
