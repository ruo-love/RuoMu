class SingerAlbumModel {
  List<HotAlbums>? hotAlbums;

  SingerAlbumModel({this.hotAlbums});

  SingerAlbumModel.fromJson(Map<String, dynamic> json) {
    if (json['hotAlbums'] != null) {
      hotAlbums = <HotAlbums>[];
      json['hotAlbums'].forEach((v) {
        hotAlbums!.add(new HotAlbums.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotAlbums != null) {
      data['hotAlbums'] = this.hotAlbums!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotAlbums {
  String? blurPicUrl;
  Artist? artist;
  int? publishTime;
  String? company;
  String? picUrl;
  String? name;
  int? id;
  int? size;

  HotAlbums(
      {this.blurPicUrl,
      this.artist,
      this.publishTime,
      this.company,
      this.picUrl,
      this.name,
      this.id,
      this.size});

  HotAlbums.fromJson(Map<String, dynamic> json) {
    blurPicUrl = json['blurPicUrl'];
    artist =
        json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
    publishTime = json['publishTime'];
    company = json['company'];
    picUrl = json['picUrl'];
    name = json['name'];
    id = json['id'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blurPicUrl'] = this.blurPicUrl;
    if (this.artist != null) {
      data['artist'] = this.artist!.toJson();
    }
    data['publishTime'] = this.publishTime;
    data['company'] = this.company;
    data['picUrl'] = this.picUrl;
    data['name'] = this.name;
    data['id'] = this.id;
    data['size'] = this.size;
    return data;
  }
}

class Artist {
  int? img1v1Id;
  int? topicPerson;
  bool? followed;
  List<String>? alias;
  int? picId;
  int? musicSize;
  int? albumSize;
  String? briefDesc;
  String? picUrl;
  String? img1v1Url;
  String? trans;
  String? name;
  int? id;
  String? picIdStr;
  String? img1v1IdStr;

  Artist(
      {this.img1v1Id,
      this.topicPerson,
      this.followed,
      this.alias,
      this.picId,
      this.musicSize,
      this.albumSize,
      this.briefDesc,
      this.picUrl,
      this.img1v1Url,
      this.trans,
      this.name,
      this.id,
      this.picIdStr,
      this.img1v1IdStr});

  Artist.fromJson(Map<String, dynamic> json) {
    img1v1Id = json['img1v1Id'];
    topicPerson = json['topicPerson'];
    followed = json['followed'];
    alias = json['alias'].cast<String>();
    picId = json['picId'];
    musicSize = json['musicSize'];
    albumSize = json['albumSize'];
    briefDesc = json['briefDesc'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
    trans = json['trans'];
    name = json['name'];
    id = json['id'];
    picIdStr = json['picId_str'];
    img1v1IdStr = json['img1v1Id_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img1v1Id'] = this.img1v1Id;
    data['topicPerson'] = this.topicPerson;
    data['followed'] = this.followed;
    data['alias'] = this.alias;
    data['picId'] = this.picId;
    data['musicSize'] = this.musicSize;
    data['albumSize'] = this.albumSize;
    data['briefDesc'] = this.briefDesc;
    data['picUrl'] = this.picUrl;
    data['img1v1Url'] = this.img1v1Url;
    data['trans'] = this.trans;
    data['name'] = this.name;
    data['id'] = this.id;
    data['picId_str'] = this.picIdStr;
    data['img1v1Id_str'] = this.img1v1IdStr;
    return data;
  }
}
