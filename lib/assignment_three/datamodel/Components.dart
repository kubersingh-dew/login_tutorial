import 'Data.dart';

class Components {
  Components({
      required this.title,
      required this.type,
      this.img,
      this.subtitle,
      this.data,});


  Components.fromJson(dynamic json) {
    title = json['title'];
    type = json['type'];
    img = json['img'];
    subtitle = json['subtitle'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String title = "";
  String type = "";
  String? subtitle;
  String? img;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['type'] = type;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}