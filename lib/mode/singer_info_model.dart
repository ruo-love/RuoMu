class SingerInfoModel {
  Data? data;

  SingerInfoModel({this.data});

  SingerInfoModel.fromJson(Map<String, dynamic> json) {
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
  Artist? artist;
  List<SecondaryExpertIdentiy>? secondaryExpertIdentiy;
  int? eventCount;
  User? user;

  Data({this.artist, this.secondaryExpertIdentiy, this.eventCount, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    artist =
        json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
    if (json['secondaryExpertIdentiy'] != null) {
      secondaryExpertIdentiy = <SecondaryExpertIdentiy>[];
      json['secondaryExpertIdentiy'].forEach((v) {
        secondaryExpertIdentiy!.add(new SecondaryExpertIdentiy.fromJson(v));
      });
    }
    eventCount = json['eventCount'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.artist != null) {
      data['artist'] = this.artist!.toJson();
    }
    if (this.secondaryExpertIdentiy != null) {
      data['secondaryExpertIdentiy'] =
          this.secondaryExpertIdentiy!.map((v) => v.toJson()).toList();
    }
    data['eventCount'] = this.eventCount;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Artist {
  int? id;
  String? cover;
  String? name;
  List<String>? identities;
  List<String>? identifyTag;
  String? briefDesc;
  int? albumSize;
  int? musicSize;
  int? mvSize;

  Artist(
      {this.id,
      this.cover,
      this.name,
      this.identities,
      this.identifyTag,
      this.briefDesc,
      this.albumSize,
      this.musicSize,
      this.mvSize});

  Artist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'];
    name = json['name'];
    identities = json['identities']?.cast<String>();
    identifyTag = json['identifyTag']?.cast<String>();
    briefDesc = json['briefDesc'];
    albumSize = json['albumSize'];
    musicSize = json['musicSize'];
    mvSize = json['mvSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cover'] = this.cover;
    data['name'] = this.name;
    data['identities'] = this.identities;
    data['identifyTag'] = this.identifyTag;
    data['briefDesc'] = this.briefDesc;
    data['albumSize'] = this.albumSize;
    data['musicSize'] = this.musicSize;
    data['mvSize'] = this.mvSize;
    return data;
  }
}

class SecondaryExpertIdentiy {
  int? expertIdentiyId;
  String? expertIdentiyName;
  int? expertIdentiyCount;

  SecondaryExpertIdentiy(
      {this.expertIdentiyId, this.expertIdentiyName, this.expertIdentiyCount});

  SecondaryExpertIdentiy.fromJson(Map<String, dynamic> json) {
    expertIdentiyId = json['expertIdentiyId'];
    expertIdentiyName = json['expertIdentiyName'];
    expertIdentiyCount = json['expertIdentiyCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expertIdentiyId'] = this.expertIdentiyId;
    data['expertIdentiyName'] = this.expertIdentiyName;
    data['expertIdentiyCount'] = this.expertIdentiyCount;
    return data;
  }
}

class User {
  String? backgroundUrl;
  int? birthday;
  String? detailDescription;
  int? gender;
  int? city;
  String? signature;
  String? description;
  String? nickname;
  String? avatarUrl;
  int? userId;
  int? createTime;

  User(
      {this.backgroundUrl,
      this.birthday,
      this.detailDescription,
      this.gender,
      this.city,
      this.signature,
      this.description,
      this.nickname,
      this.avatarUrl,
      this.userId,
      this.createTime});

  User.fromJson(Map<String, dynamic> json) {
    backgroundUrl = json['backgroundUrl'];
    birthday = json['birthday'];
    detailDescription = json['detailDescription'];
    gender = json['gender'];
    city = json['city'];
    signature = json['signature'];
    description = json['description'];
    nickname = json['nickname'];
    avatarUrl = json['avatarUrl'];
    userId = json['userId'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backgroundUrl'] = this.backgroundUrl;
    data['birthday'] = this.birthday;
    data['detailDescription'] = this.detailDescription;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['signature'] = this.signature;
    data['description'] = this.description;
    data['nickname'] = this.nickname;
    data['avatarUrl'] = this.avatarUrl;
    data['userId'] = this.userId;
    data['createTime'] = this.createTime;
    return data;
  }
}
