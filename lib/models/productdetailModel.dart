// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vkreta/models/WishlistModel.dart';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
  ProductDetailModel({
    this.productId,
    this.headingTitle,
    this.textMinimum,
    this.textLogin,
    this.tabReview,
    this.reviewsTotals,
    this.manufacturer,
    this.manufacturers,
    this.model,
    this.reward,
    this.quantity,
    this.points,
    this.description,
    this.stock,
    this.popup,
    this.thumb,
    this.images,
    this.price,
    this.special,
    this.options,
    this.minimum,
    this.reviewStatus,
    this.reviewGuest,
    this.customerName,
    this.reviews,
    this.rating,
    this.captcha,
    this.share,
    this.attributeGroups,
    this.products,
    this.tags,
    this.wishlist,
    this.buttonDeliver,
    this.ptsQuickStatus,
    this.sellerReviewStatus,
    this.modulePurpletreeMultivendorHideSellerDetail,
    this.sellerDetail,
    this.modulePurpletreeMultivendorAllowLiveChat,
    this.storeLiveChatEnable,
    this.storeLiveChatCode,
    this.templateProductStatus,
    this.recurrings,
    this.productsBottomTab,
    this.disclaimer,
    this.specialSection,
    this.returnPolicy,
  });

  String? productId;
  String? headingTitle;
  String? textMinimum;
  String? textLogin;
  String? tabReview;
  String? reviewsTotals;
  String? manufacturer;
  String? manufacturers;
  String? model;
  dynamic reward;
  String? quantity;
  String? points;
  String? description;
  String? stock;
  String? popup;
  String? thumb;
  List<ImageData>? images;
  String? price;
  var special;
  List<Option>? options =[];
  String? minimum;
  String? reviewStatus;
  bool? reviewGuest;
  String? customerName;
  String? reviews;
  String? rating;
  String? captcha;
  String? share;
  List<dynamic>? attributeGroups=[];
  List<dynamic>? products=[];
  List<Tag>? tags;
  List<dynamic>? wishlist=[];
  String? buttonDeliver;
  String? ptsQuickStatus;
  String? sellerReviewStatus;
  String? modulePurpletreeMultivendorHideSellerDetail;
  SellerDetail? sellerDetail;
  String? modulePurpletreeMultivendorAllowLiveChat;

  String? storeLiveChatEnable;
  String? storeLiveChatCode;
  String? templateProductStatus;
  List<dynamic>? recurrings=[];
  List<ProductsBottomTab>? productsBottomTab=[];
  String? disclaimer;
  List<SpecialSection>? specialSection=[];
  String? returnPolicy;

   factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>ProductDetailModel(
      productId:
      json["product_id"].toString()
    ,
    headingTitle: json["heading_title"],
    textMinimum: json["text_minimum"],
    textLogin: json["text_login"],
    tabReview: json["tab_review"],
    reviewsTotals: json["reviews_totals"].toString(),
    manufacturer:json["manufacturer"],
    manufacturers: json["manufacturers"],
    model: json["model"],
    reward: json["reward"],
    quantity: json["quantity"],
    points: json["points"],
    description: json["description"],
    stock: json["stock"],
    popup: json["popup"],
    thumb: json["thumb"] ?? "https://",
    images: List<ImageData>.from(
    json["images"].map((x) => ImageData.fromJson(x))),
    price: json["price"],
    special: json["special"],
    options:json["options"].isEmpty ?[]:
    json["options"].map<Option>((x) => Option.fromJson(x)).toList(),
    minimum: json["minimum"].toString(),
    reviewStatus: json["review_status"],
    reviewGuest: json["review_guest"],
    customerName: json["customer_name"],
    reviews: json["reviews"],
    rating: json["rating"]== null ? "0":json["rating"].toString(),
    captcha: json["captcha"],
    share: json["share"],
    attributeGroups:json["attribute_groups"].isEmpty ?[]:
    List<dynamic>.from(json["attribute_groups"].map((x) => x)),
    products:json["products"].isEmpty ?[]:
    List<dynamic>.from(json["products"].map((x) => x)),
    tags:json["tags"].isEmpty ?[]:
    List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    wishlist:json["wishlist"].isEmpty ?[]:
    List<dynamic>.from(json["wishlist"].map((x) => x)),
    buttonDeliver: json["button_deliver"],
    ptsQuickStatus: json["pts_quick_status"].toString(),
    sellerReviewStatus: json["seller_review_status"],
    modulePurpletreeMultivendorHideSellerDetail:
    json["module_purpletree_multivendor_hide_seller_detail"],
    sellerDetail: SellerDetail.fromJson(json["seller_detail"]),
    modulePurpletreeMultivendorAllowLiveChat:
    json["module_purpletree_multivendor_allow_live_chat"],
    storeLiveChatEnable:  json["store_live_chat_enable"]== null ? "0":json["store_live_chat_enable"].toString(),
    storeLiveChatCode: json["store_live_chat_code"] == ""? "0":json["store_live_chat_code"],
    templateProductStatus: json["template_product_status"]== null ? "0":json["template_product_status"].toString(),
    recurrings:json["recurrings"].isEmpty ?[]:
    List<dynamic>.from(json["recurrings"].map((x) => x)),
    productsBottomTab: json["products_bottom_tab"].isEmpty ?[]:
    List<ProductsBottomTab>.from(
    json["products_bottom_tab"]
        .map((x) => ProductsBottomTab.fromJson(x))),
    disclaimer: json["disclaimer"],
    specialSection:json["special-section"].isEmpty ?[]:
    List<SpecialSection>.from(
    json["special-section"].map((x) => SpecialSection.fromJson(x))),
    returnPolicy: json["return_policy"],
   );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "heading_title": headingTitle,
        "text_minimum": textMinimum,
        "text_login": textLogin,
        "tab_review": tabReview,
        "reviews_totals": reviewsTotals,
        "manufacturer": manufacturer,
        "manufacturers": manufacturers,
        "model": model,
        "reward": reward,
        "quantity": quantity,
        "points": points,
        "description": description,
        "stock": stock,
        "popup": popup,
        "thumb": thumb,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "price": price,
        "special": special,
        "options": List<Option>.from(options!.map((x) => x)),
        "minimum": minimum,
        "review_status": reviewStatus,
        "review_guest": reviewGuest,
        "customer_name": customerName,
        "reviews": reviews,
        "rating": rating,
        "captcha": captcha,
        "share": share,
        "attribute_groups": List<dynamic>.from(attributeGroups!.map((x) => x)),
        "products": List<dynamic>.from(products!.map((x) => x)),
        "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
        "wishlist": List<dynamic>.from(wishlist!.map((x) => x)),
        "button_deliver": buttonDeliver,
        "pts_quick_status": ptsQuickStatus,
        "seller_review_status": sellerReviewStatus,
        "module_purpletree_multivendor_hide_seller_detail": modulePurpletreeMultivendorHideSellerDetail,
        "seller_detail": sellerDetail!.toJson(),
        "module_purpletree_multivendor_allow_live_chat": modulePurpletreeMultivendorAllowLiveChat,
        "store_live_chat_enable": storeLiveChatEnable,
        "store_live_chat_code": storeLiveChatCode,
        "template_product_status": templateProductStatus,
        "recurrings": List<dynamic>.from(recurrings!.map((x) => x)),
        "products_bottom_tab": List<dynamic>.from(productsBottomTab!.map((x) => x.toJson())),
        "disclaimer": disclaimer,
        "special-section": List<dynamic>.from(specialSection!.map((x) => x.toJson())),
        "return_policy": returnPolicy,
      };
}

class ImageData {
  ImageData({
    this.popup,
    this.thumb,
  });

  String? popup;
  String? thumb;

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        popup: json["popup"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "popup": popup,
        "thumb": thumb,
      };
}

class ProductsBottomTab {
  ProductsBottomTab({
    this.title,
    this.products,
  });

  String? title;
  List<Product>? products=[];

  factory ProductsBottomTab.fromJson(Map<String, dynamic> json) => ProductsBottomTab(
        title: json["title"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.productId,
    this.thumb,
    this.quantity,
    this.name,
    this.description,
    this.price,
    this.special,
    this.tax,
    this.minimum,
    this.rating,
    this.href,
  });

  String? productId;
  String? thumb;
  String? quantity;
  String? name;
  String? description;
  String? price;
  String? special;
  bool? tax;
  String? minimum;
  String? rating;
  String? href;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        thumb: json["thumb"],
        quantity: json["quantity"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        special: json["special"].toString(),
        tax: json["tax"],
        minimum: json["minimum"].toString(),
        rating: json["rating"].toString(),
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "thumb": thumb,
        "quantity": quantity,
        "name": name,
        "description": description,
        "price": price,
        "special": special,
        "tax": tax,
        "minimum": minimum,
        "rating": rating,
        "href": href,
      };
}

class SellerDetail {
  SellerDetail({
    this.sellerName,
    this.storeId,
    this.sellerRating,
    this.sellerCount,
    this.sellerHref,
    this.sellerReviewLink,
    this.sellerContactLink,
    this.otherSellerCount,
  });

  String? sellerName;
  String? storeId;
  String? sellerRating;
  String? sellerCount;
  String? sellerHref;
  String? sellerReviewLink;
  String? sellerContactLink;
  String? otherSellerCount;

  factory SellerDetail.fromJson(Map<String, dynamic> json) => SellerDetail(
        sellerName: json["seller_name"],
        storeId: json["store_id"],
        sellerRating: json["seller_rating"],
        sellerCount: json["seller_count"],
        sellerHref: json["seller_href"],
        sellerReviewLink: json["seller_review_link"],
        sellerContactLink: json["seller_contact_link"],
        otherSellerCount: json["other_seller_count"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "seller_name": sellerName,
        "store_id": storeId,
        "seller_rating": sellerRating,
        "seller_count": sellerCount,
        "seller_href": sellerHref,
        "seller_review_link": sellerReviewLink,
        "seller_contact_link": sellerContactLink,
        "other_seller_count": otherSellerCount,
      };
}

class SpecialSection {
  SpecialSection({
    this.image,
    this.title,
    this.description,
  });

  String? image;
  String? title;
  String? description;

  factory SpecialSection.fromJson(Map<String, dynamic> json) => SpecialSection(
        image: json["image"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "description": description == null ? null : description,
      };
}

class Tag {
  Tag({
    this.tag,
    this.href,
  });

  String? tag;
  String? href;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        tag: json["tag"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
        "href": href,
      };
}
class Option {
  String? productOptionId;
  List<ProductOptionValue>? productOptionValue;
  String? optionId;
  String? parentOptionId;
  String? name;
  String? type;
  String? value;
  String? required;

  Option(
      {this.productOptionId,
        this.productOptionValue,
        this.optionId,
        this.parentOptionId,
        this.name,
        this.type,
        this.value,
        this.required});

  Option.fromJson(Map<String, dynamic> json) {
    productOptionId = json['product_option_id'];
    if (json['product_option_value'] != null) {
      productOptionValue = <ProductOptionValue>[];
      json['product_option_value'].forEach((v) {
        productOptionValue!.add(new ProductOptionValue.fromJson(v));
      });
    }
    optionId = json['option_id'];
    parentOptionId = json['parent_option_id'];
    name = json['name'];
    type = json['type'];
    value = json['value'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_option_id'] = this.productOptionId;
    if (this.productOptionValue != null) {
      data['product_option_value'] =
          this.productOptionValue!.map((v) => v.toJson()).toList();
    }
    data['option_id'] = this.optionId;
    data['parent_option_id'] = this.parentOptionId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['value'] = this.value;
    data['required'] = this.required;
    return data;
  }
}


class ProductOptionValue {
  String? productId;
  String? productOptionValueId;
  String? optionValueId;
  String? name;
  String? image;
  String? price;
  String? optionthumb;
  int? disabled;
  int? active;

  ProductOptionValue(
      {this.productId,
        this.productOptionValueId,
        this.optionValueId,
        this.name,
        this.image,
        this.price,
        this.optionthumb,
        this.disabled,
        this.active});

  ProductOptionValue.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'].toString();
    productOptionValueId = json['product_option_value_id'].toString();
    optionValueId = json['option_value_id'];
    name = json['name'];
    image = json['image'].toString();
    price = json['price'];
    optionthumb = json['optionthumb'];
    disabled = json['disabled'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_option_value_id'] = this.productOptionValueId;
    data['option_value_id'] = this.optionValueId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['optionthumb'] = this.optionthumb;
    data['disabled'] = this.disabled;
    data['active'] = this.active;
    return data;
  }
}

