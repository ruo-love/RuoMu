class SingerModel {
  int? code;
  bool? more;
  List<Artists>? artists;

  SingerModel({this.code, this.more, this.artists});

  SingerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    more = json['more'];
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(new Artists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['more'] = this.more;
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Artists {
  String? name;
  int? id;
  int? picId;
  int? img1v1Id;
  String? picUrl;
  String? img1v1Url;
  int? albumSize;
  List<String>? alias;
  int? fansCount;

  Artists(
      {this.name,
      this.id,
      this.picId,
      this.img1v1Id,
      this.picUrl,
      this.img1v1Url,
      this.albumSize,
      this.alias,
      this.fansCount});

  Artists.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    picId = json['picId'];
    img1v1Id = json['img1v1Id'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
    albumSize = json['albumSize'];
    alias = json['alias'].cast<String>();
    fansCount = json['fansCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['picId'] = this.picId;
    data['img1v1Id'] = this.img1v1Id;
    data['picUrl'] = this.picUrl;
    data['img1v1Url'] = this.img1v1Url;
    data['albumSize'] = this.albumSize;
    data['alias'] = this.alias;
    data['fansCount'] = this.fansCount;
    return data;
  }
}
