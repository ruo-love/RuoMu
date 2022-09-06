class AlbumModel {
  int? code;
  List<Albums>? albums;

  AlbumModel({this.code, this.albums});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['albums'] != null) {
      albums = <Albums>[];
      json['albums'].forEach((v) {
        albums!.add(new Albums.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.albums != null) {
      data['albums'] = this.albums!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Albums {
  String? name;
  int? id;
  String? type;
  String? blurPicUrl;
  String? picUrl;
  String? company;
  Artist? artist;

  Albums({
    this.name,
    this.id,
    this.type,
    this.blurPicUrl,
    this.picUrl,
    this.company,
    this.artist,
  });

  Albums.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    blurPicUrl = json['blurPicUrl'];
    picUrl = json['picUrl'];
    company = json['company'];
    artist =
        json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['blurPicUrl'] = this.blurPicUrl;
    data['picUrl'] = this.picUrl;
    data['company'] = this.company;
    if (this.artist != null) {
      data['artist'] = this.artist!.toJson();
    }

    return data;
  }
}

class Artist {
  String? name;
  int? id;
  String? picUrl;
  String? img1v1Url;

  Artist({this.name, this.id, this.picUrl, this.img1v1Url});

  Artist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['picUrl'] = this.picUrl;
    data['img1v1Url'] = this.img1v1Url;
    return data;
  }
}
