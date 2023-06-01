import 'Components.dart';

class DashBoardData {
  DashBoardData({
      required this.title,
      required this.components,});

  DashBoardData.fromJson(dynamic json) {
    title = json['title'];
    if (json['components'] != null) {
      components = [];
      json['components'].forEach((v) {
        components?.add(Components.fromJson(v));
      });
    }
  }
  String title = "";
  List<Components>? components;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    if (components != null) {
      map['components'] = components?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}