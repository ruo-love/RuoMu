class TinyVideoModel {
  List<Datas>? datas;
  bool? hasmore;

  TinyVideoModel({this.datas, this.hasmore});

  TinyVideoModel.fromJson(Map<String, dynamic> json) {
    if (json['datas'] != null) {
      datas = <Datas>[];
      json['datas'].forEach((v) {
        datas!.add(new Datas.fromJson(v));
      });
    }
    hasmore = json['hasmore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.datas != null) {
      data['datas'] = this.datas!.map((v) => v.toJson()).toList();
    }
    data['hasmore'] = this.hasmore;
    return data;
  }
}

class Datas {
  Data? data;

  Datas({this.data});

  Datas.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? coverUrl;
  int? height;
  int? width;
  String? title;
  String? description;
  int? commentCount;
  int? shareCount;
  Creator? creator;
  UrlInfo? urlInfo;
  String? vid;
  int? durationms;
  int? playTime;
  int? praisedCount;

  Data(
      {this.coverUrl,
      this.height,
      this.width,
      this.title,
      this.description,
      this.commentCount,
      this.shareCount,
      this.creator,
      this.urlInfo,
      this.vid,
      this.durationms,
      this.playTime,
      this.praisedCount});

  Data.fromJson(Map<String, dynamic> json) {
    coverUrl = json['coverUrl'];
    height = json['height'];
    width = json['width'];
    title = json['title'];
    description = json['description'];
    commentCount = json['commentCount'];
    shareCount = json['shareCount'];
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    urlInfo =
        json['urlInfo'] != null ? new UrlInfo.fromJson(json['urlInfo']) : null;
    vid = json['vid'];
    durationms = json['durationms'];
    playTime = json['playTime'];
    praisedCount = json['praisedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coverUrl'] = this.coverUrl;
    data['height'] = this.height;
    data['width'] = this.width;
    data['title'] = this.title;
    data['description'] = this.description;
    data['commentCount'] = this.commentCount;
    data['shareCount'] = this.shareCount;
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    if (this.urlInfo != null) {
      data['urlInfo'] = this.urlInfo!.toJson();
    }
    data['vid'] = this.vid;
    data['durationms'] = this.durationms;
    data['playTime'] = this.playTime;
    data['praisedCount'] = this.praisedCount;
    return data;
  }
}

class Creator {
  String? avatarUrl;
  String? nickname;
  String? signature;
  String? backgroundUrl;

  Creator({this.avatarUrl, this.nickname, this.signature, this.backgroundUrl});

  Creator.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    nickname = json['nickname'];
    signature = json['signature'];
    backgroundUrl = json['backgroundUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarUrl'] = this.avatarUrl;
    data['nickname'] = this.nickname;
    data['signature'] = this.signature;
    data['backgroundUrl'] = this.backgroundUrl;
    return data;
  }
}

class UrlInfo {
  String? id;
  String? url;

  UrlInfo({this.id, this.url});

  UrlInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
