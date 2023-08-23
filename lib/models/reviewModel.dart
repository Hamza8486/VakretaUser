// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

ReviewModel reviewModelFromJson(String str) => ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  String? reviewTotal;
  String? limit;
  List<ReviewAllModel>? reviews;

  ReviewModel({this.reviewTotal, this.limit, this.reviews});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    reviewTotal = json['review_total'];
    limit = json['limit'];
    if (json['reviews'] != null) {
      reviews = <ReviewAllModel>[];
      json['reviews'].forEach((v) {
        reviews!.add(new ReviewAllModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_total'] = this.reviewTotal;
    data['limit'] = this.limit;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReviewAllModel {
  String? author;
  String? text;
  int? rating;
  String? dateAdded;
  List<Images>? images;

  ReviewAllModel({this.author, this.text, this.rating, this.dateAdded, this.images});

  ReviewAllModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    text = json['text'];
    rating = json['rating'];
    dateAdded = json['date_added'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['text'] = this.text;
    data['rating'] = this.rating;
    data['date_added'] = this.dateAdded;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? popup;
  String? thumb;

  Images({this.popup, this.thumb});

  Images.fromJson(Map<String, dynamic> json) {
    popup = json['popup'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popup'] = this.popup;
    data['thumb'] = this.thumb;
    return data;
  }
}