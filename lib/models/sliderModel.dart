class SliderModel {
  String? title;
  String? preset;
  String? layout;
  String? sort;
  String? column;
  List<SliderInfo>? data;

  SliderModel(
      {this.title,
        this.preset,
        this.layout,
        this.sort,
        this.column,
        this.data});

  SliderModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    preset = json['preset'];
    layout = json['layout'];
    sort = json['sort'];
    column = json['column'];
    if (json['data'] != null) {
      data = <SliderInfo>[];
      json['data'].forEach((v) {
        data!.add(new SliderInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['preset'] = this.preset;
    data['layout'] = this.layout;
    data['sort'] = this.sort;
    data['column'] = this.column;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SliderInfo {
  String? name;
  String? image;
  String? linkType;
  String? link;

  SliderInfo({this.name, this.image, this.linkType, this.link});

  SliderInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    linkType = json['link_type'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['link_type'] = this.linkType;
    data['link'] = this.link;
    return data;
  }
}
