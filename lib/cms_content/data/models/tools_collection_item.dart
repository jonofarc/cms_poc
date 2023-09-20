class Toolscollectionitem {
  Meta? meta;
  String? label;
  String? banner;
  String? country;
  String? url;
  String? description;

  Toolscollectionitem({this.meta, this.label, this.banner, this.country});

  Toolscollectionitem.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    label = json['label'];
    banner = json['banner'];
    country = json['country'];
    url = json['url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['label'] = label;
    data['banner'] = banner;
    data['country'] = country;
    data['url'] = url;
    data['description'] = description;
    return data;
  }
}

class Meta {
  int? id;

  Meta({this.id});

  Meta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
