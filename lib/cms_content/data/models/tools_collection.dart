import 'package:cms_pocs/cms_content/data/models/tools_collection_item.dart';

class ToolsCollection {
  Meta? meta;
  Data? data;

  ToolsCollection({this.meta, this.data});

  ToolsCollection.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Meta {
  int? count;
  String? nextPage;
  String? previousPage;

  Meta({this.count, this.nextPage, this.previousPage});

  Meta.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    nextPage = json['next_page'];
    previousPage = json['previous_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next_page'] = nextPage;
    data['previous_page'] = previousPage;
    return data;
  }
}

class Data {
  List<Toolscollectionitem>? toolscollectionitem;

  Data({this.toolscollectionitem});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['toolscollectionitem'] != null) {
      toolscollectionitem = <Toolscollectionitem>[];
      json['toolscollectionitem'].forEach((v) {
        toolscollectionitem!.add(Toolscollectionitem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (toolscollectionitem != null) {
      data['toolscollectionitem'] =
          toolscollectionitem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
