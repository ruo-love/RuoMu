class SongListCategoryModel {
  List<Tags>? tags;

  SongListCategoryModel({this.tags});

  SongListCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  int? usedCount;
  int? createTime;
  String? name;
  int? id;

  Tags({this.usedCount, this.createTime, this.name, this.id});

  Tags.fromJson(Map<String, dynamic> json) {
    usedCount = json['usedCount'];
    createTime = json['createTime'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usedCount'] = this.usedCount;
    data['createTime'] = this.createTime;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

//歌单模型
class SongListItemModel {
  List<Playlists>? playlists;
  String? cat;

  SongListItemModel({this.playlists, this.cat});

  SongListItemModel.fromJson(Map<String, dynamic> json) {
    if (json['playlists'] != null) {
      playlists = <Playlists>[];
      json['playlists'].forEach((v) {
        playlists!.add(new Playlists.fromJson(v));
      });
    }
    cat = json['cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.playlists != null) {
      data['playlists'] = this.playlists!.map((v) => v.toJson()).toList();
    }
    data['cat'] = this.cat;
    return data;
  }
}

class Playlists {
  String? name;
  int? id;
  int? userId;
  int? createTime;
  String? coverImgUrl;
  String? description;
  List<String>? tags;
  int? playCount;
  Creator? creator;

  Playlists(
      {this.name,
      this.id,
      this.userId,
      this.createTime,
      this.coverImgUrl,
      this.description,
      this.tags,
      this.playCount,
      this.creator});

  Playlists.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    userId = json['userId'];
    createTime = json['createTime'];
    coverImgUrl = json['coverImgUrl'];
    description = json['description'];
    tags = json['tags'].cast<String>();
    playCount = json['playCount'];
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['createTime'] = this.createTime;
    data['coverImgUrl'] = this.coverImgUrl;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['playCount'] = this.playCount;
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    return data;
  }
}

class Creator {
  String? avatarUrl;
  int? userId;
  String? nickname;
  String? backgroundUrl;

  Creator({this.avatarUrl, this.userId, this.nickname, this.backgroundUrl});

  Creator.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    userId = json['userId'];
    nickname = json['nickname'];
    backgroundUrl = json['backgroundUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarUrl'] = this.avatarUrl;
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data['backgroundUrl'] = this.backgroundUrl;
    return data;
  }
}
