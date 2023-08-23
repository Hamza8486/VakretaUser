class History {
  History({
      this.statusId, 
      this.date, 
      this.notify, 
      this.name, 
      this.active, 
      this.description,});

  History.fromJson(dynamic json) {
    statusId = json['status_id'].toString();
    date = json['date'];
    notify = json['notify'].toString();
    name = json['name'];
    active = json['active'];
    description = json['description'];
  }
  String? statusId;
  String? date;
  String? notify;
  String? name;
  var active;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_id'] = statusId;
    map['date'] = date;
    map['notify'] = notify;
    map['name'] = name;
    map['active'] = active;
    map['description'] = description;
    return map;
  }

}