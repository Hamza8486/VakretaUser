class Categories {
  Categories({
      this.categoryId, 
      this.name, 
      this.productCount, 
      this.image,});

  Categories.fromJson(dynamic json) {
    categoryId = json['category_id'];
    name = json['name'];
    productCount = json['product_count'];
    image = json['image'];
  }
  String? categoryId;
  String? name;
  String? productCount;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = categoryId;
    map['name'] = name;
    map['product_count'] = productCount;
    map['image'] = image;
    return map;
  }

}