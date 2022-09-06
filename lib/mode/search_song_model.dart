class SearchSongModel {
  Result? result;

  SearchSongModel({this.result});

  SearchSongModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Songs>? songs;
  bool? hasMore;
  int? songCount;

  Result({this.songs, this.hasMore, this.songCount});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['songs'] != null) {
      songs = <Songs>[];
      json['songs'].forEach((v) {
        songs!.add(new Songs.fromJson(v));
      });
    }
    hasMore = json['hasMore'];
    songCount = json['songCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songs != null) {
      data['songs'] = this.songs!.map((v) => v.toJson()).toList();
    }
    data['hasMore'] = this.hasMore;
    data['songCount'] = this.songCount;
    return data;
  }
}

class Songs {
  int? id;
  String? name;
  List<Artists>? artists;
  int? mvid;
  int? fee;

  Songs({this.id, this.name, this.artists, this.mvid, this.fee});

  Songs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(new Artists.fromJson(v));
      });
    }
    mvid = json['mvid'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    data['mvid'] = this.mvid;
    data['fee'] = this.fee;
    return data;
  }
}

class Artists {
  int? id;
  String? name;
  String? img1v1Url;

  Artists({this.id, this.name, this.img1v1Url});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img1v1Url = json['img1v1Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img1v1Url'] = this.img1v1Url;
    return data;
  }
}
