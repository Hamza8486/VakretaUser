class Products {
  Products({
      this.productId, 
      this.thumb, 
      this.name, 
      this.description,
  this.discount,
      this.price, 
      this.special, 
      this.minimum, 
      this.rating,});

  Products.fromJson(dynamic json) {
    productId = json['product_id'];
    thumb = json['thumb'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    special = json['special'].toString();
    discount = json['discount'];
    minimum = json['minimum'].toString();
    rating = json['rating'].toString();
  }
  String? productId;
  String? thumb;
  String? name;
  String? description;
  String? price;
  var discount;
  String? special;
  String? minimum;
  String? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['thumb'] = thumb;
    map['discount'] = discount;

    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['special'] = special;
    map['minimum'] = minimum;
    map['rating'] = rating.toString();
    return map;
  }

}