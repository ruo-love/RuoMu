class BannerModel {
  List<Banners>? banners;
  int? code;

  BannerModel({this.banners, this.code});

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Banners {
  String? pic;
  int? targetId;

  Banners({this.pic, this.targetId});

  Banners.fromJson(Map<String, dynamic> json) {
    pic = json['pic'];
    targetId = json['targetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['targetId'] = this.targetId;
    return data;
  }
}
