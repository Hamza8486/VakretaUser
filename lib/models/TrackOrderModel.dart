import 'History.dart';

class TrackOrderModel {
  TrackOrderModel({
      this.orderId,
      this.orderAdded,
      this.history,
      this.name,
      this.courier,
      this.trakingNum,
      this.journey,});

  TrackOrderModel.fromJson(dynamic json) {
    orderId = json['OrderId'].toString() ;
    orderAdded = json['order_added'];
    if (json['history'] != null) {
      history = [];
      json['history'].forEach((v) {
        history!.add(History.fromJson(v));
      });
    }
    name = json['name'];
    courier = json['courier'];
    trakingNum = json['traking_num'];
    if (json['journey'] != null) {
      journey = <Journey>[];
      json['journey'].forEach((v) {
        journey!.add(new Journey.fromJson(v));
      });
    }
  }
  String? orderId;
  String? orderAdded;
  List<History>? history;
  String? name;
  String? courier;
  String? trakingNum;
  List<Journey>? journey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['OrderId'] = orderId;
    map['order_added'] = orderAdded;
    if (history != null) {
      map['history'] = history!.map((v) => v.toJson()).toList();
    }
    map['name'] = name;
    map['courier'] = courier;
    map['traking_num'] = trakingNum;
    if (this.journey != null) {
      map['journey'] = this.journey!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class Journey {
  String? date;
  String? status;
  String? activity;
  String? location;
  String? srStatus;
  String? srStatusLabel;

  Journey(
      {this.date,
        this.status,
        this.activity,
        this.location,
        this.srStatus,
        this.srStatusLabel});

  Journey.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    status = json['status'];
    activity = json['activity'];
    location = json['location'];
    srStatus = json['sr-status'];
    srStatusLabel = json['sr-status-label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['status'] = this.status;
    data['activity'] = this.activity;
    data['location'] = this.location;
    data['sr-status'] = this.srStatus;
    data['sr-status-label'] = this.srStatusLabel;
    return data;
  }
}