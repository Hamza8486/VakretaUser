class CurrentPriceRange {
  CurrentPriceRange({
      this.min, 
      this.max,});

  CurrentPriceRange.fromJson(dynamic json) {
    min = json['min'];
    max = json['max'];
  }
  int? min;
  int? max;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['min'] = min;
    map['max'] = max;
    return map;
  }

}