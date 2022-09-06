class SongListDetailModel {
  Playlist? playlist;

  SongListDetailModel({this.playlist});

  SongListDetailModel.fromJson(Map<String, dynamic> json) {
    playlist = json['playlist'] != null
        ? new Playlist.fromJson(json['playlist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.playlist != null) {
      data['playlist'] = this.playlist!.toJson();
    }
    return data;
  }
}

class Playlist {
  int? id;
  String? name;
  String? coverImgUrl;
  int? userId;
  int? trackCount;
  int? playCount;
  String? description;
  List<String>? tags;
  List<Subscribers>? subscribers;
  List<Tracks>? tracks;

  Playlist(
      {this.id,
      this.name,
      this.coverImgUrl,
      this.userId,
      this.trackCount,
      this.playCount,
      this.description,
      this.tags,
      this.subscribers,
      this.tracks});

  Playlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coverImgUrl = json['coverImgUrl'];
    userId = json['userId'];
    trackCount = json['trackCount'];
    playCount = json['playCount'];
    description = json['description'];
    tags = json['tags'].cast<String>();
    if (json['subscribers'] != null) {
      subscribers = <Subscribers>[];
      json['subscribers'].forEach((v) {
        subscribers!.add(new Subscribers.fromJson(v));
      });
    }
    if (json['tracks'] != null) {
      tracks = <Tracks>[];
      json['tracks'].forEach((v) {
        tracks!.add(new Tracks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['coverImgUrl'] = this.coverImgUrl;
    data['userId'] = this.userId;
    data['trackCount'] = this.trackCount;
    data['playCount'] = this.playCount;
    data['description'] = this.description;
    data['tags'] = this.tags;
    if (this.subscribers != null) {
      data['subscribers'] = this.subscribers!.map((v) => v.toJson()).toList();
    }
    if (this.tracks != null) {
      data['tracks'] = this.tracks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subscribers {
  String? avatarUrl;
  int? userId;
  String? nickname;
  String? backgroundUrl;

  Subscribers({this.avatarUrl, this.userId, this.nickname, this.backgroundUrl});

  Subscribers.fromJson(Map<String, dynamic> json) {
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

class Tracks {
  String? name;
  int? id;
  List<Ar>? ar;
  Al? al;

  Tracks({this.name, this.id, this.ar, this.al});

  Tracks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['ar'] != null) {
      ar = <Ar>[];
      json['ar'].forEach((v) {
        ar!.add(new Ar.fromJson(v));
      });
    }
    al = json['al'] != null ? new Al.fromJson(json['al']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.ar != null) {
      data['ar'] = this.ar!.map((v) => v.toJson()).toList();
    }
    if (this.al != null) {
      data['al'] = this.al!.toJson();
    }
    return data;
  }
}

class Ar {
  int? id;
  String? name;

  Ar({this.id, this.name});

  Ar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Al {
  int? id;
  String? name;
  String? picUrl;

  Al({this.id, this.name, this.picUrl});

  Al.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
    return data;
  }
}
