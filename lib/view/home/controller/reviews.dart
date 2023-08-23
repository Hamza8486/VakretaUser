class ReviewsModel {
  String? reviewTotal;
  String? limit;
  List<Reviews>? reviews;

  ReviewsModel({this.reviewTotal, this.limit, this.reviews});

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    reviewTotal = json['review_total'];
    limit = json['limit'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
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

class Reviews {
  String? author;
  String? text;
  int? rating;
  String? dateAdded;

  Reviews({this.author, this.text, this.rating, this.dateAdded});

  Reviews.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    text = json['text'];
    rating = json['rating'];
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['text'] = this.text;
    data['rating'] = this.rating;
    data['date_added'] = this.dateAdded;
    return data;
  }
}
