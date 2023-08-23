// To parse this JSON data, do
//
//     final returnTrackOrdersAll = returnTrackOrdersAllFromJson(jsonString);

import 'dart:convert';

ReturnTrackOrdersAll returnTrackOrdersAllFromJson(String str) => ReturnTrackOrdersAll.fromJson(json.decode(str));

String returnTrackOrdersAllToJson(ReturnTrackOrdersAll data) => json.encode(data.toJson());



class ReturnTrackOrdersAll {
  String? returnId;
  String? orderId;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? product;
  String? model;
  String? quantity;
  String? opened;
  String? reason;
  var action;
  String? status;
  String? comment;
  String? dateOrdered;
  String? dateAdded;
  String? dateModified;
  int? activeStatus;
  List<HistoryModelAll>? history;

  ReturnTrackOrdersAll(
      {this.returnId,
        this.orderId,
        this.firstname,
        this.lastname,
        this.email,
        this.telephone,
        this.product,
        this.model,
        this.quantity,
        this.opened,
        this.reason,
        this.action,
        this.status,
        this.comment,
        this.dateOrdered,
        this.dateAdded,
        this.dateModified,
        this.activeStatus,
        this.history});

  ReturnTrackOrdersAll.fromJson(Map<String, dynamic> json) {
    returnId = json['return_id'];
    orderId = json['order_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    telephone = json['telephone'];
    product = json['product'];
    model = json['model'];
    quantity = json['quantity'];
    opened = json['opened'];
    reason = json['reason'];
    action = json['action'];
    status = json['status'];
    comment = json['comment'];
    dateOrdered = json['date_ordered'];
    dateAdded = json['date_added'];
    dateModified = json['date_modified'];
    activeStatus = json['active_status'];
    if (json['history'] != null) {
      history = <HistoryModelAll>[];
      json['history'].forEach((v) {
        history!.add(new HistoryModelAll.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['return_id'] = this.returnId;
    data['order_id'] = this.orderId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['product'] = this.product;
    data['model'] = this.model;
    data['quantity'] = this.quantity;
    data['opened'] = this.opened;
    data['reason'] = this.reason;
    data['action'] = this.action;
    data['status'] = this.status;
    data['comment'] = this.comment;
    data['date_ordered'] = this.dateOrdered;
    data['date_added'] = this.dateAdded;
    data['date_modified'] = this.dateModified;
    data['active_status'] = this.activeStatus;
    if (this.history != null) {
      data['history'] = this.history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HistoryModelAll {
  String? returnStatusId;
  String? name;
  String? description;
  String? dateAdded;
  int? active;

  HistoryModelAll(
      {this.returnStatusId,
        this.name,
        this.description,
        this.dateAdded,
        this.active});

  HistoryModelAll.fromJson(Map<String, dynamic> json) {
    returnStatusId = json['return_status_id'];
    name = json['name'];
    description = json['description'];
    dateAdded = json['date_added'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['return_status_id'] = this.returnStatusId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['date_added'] = this.dateAdded;
    data['active'] = this.active;
    return data;
  }
}
