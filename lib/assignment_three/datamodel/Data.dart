class Data {
  Data({
      required this.img,
      required this.title,
      required this.subTitle,});

  Data.fromJson(dynamic json) {
    img = json['img'];
    title = json['title'];
    subTitle = json['subTitle'];
    contentImg = json['contentImg'];
  }
  String img="";
  String title="";
  String subTitle="";
  String? contentImg = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['img'] = img;
    map['title'] = title;
    map['subTitle'] = subTitle;
    map['contentImg'] = contentImg;
    return map;
  }

}