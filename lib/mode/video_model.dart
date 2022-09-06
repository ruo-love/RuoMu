class VideoModel {
  List<Data>? data;
  int? code;

  VideoModel({this.data, this.code});

  VideoModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;

    return data;
  }
}

class Data {
  int? id;
  String? cover;
  String? name;
  int? playCount;
  String? briefDesc;
  Null? desc;
  String? artistName;
  int? artistId;
  int? duration;
  int? mark;
  bool? subed;
  List<Artists>? artists;
  List<String>? transNames;

  Data(
      {this.id,
      this.cover,
      this.name,
      this.playCount,
      this.briefDesc,
      this.desc,
      this.artistName,
      this.artistId,
      this.duration,
      this.mark,
      this.subed,
      this.artists,
      this.transNames});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'];
    name = json['name'];
    playCount = json['playCount'];
    briefDesc = json['briefDesc'];
    desc = json['desc'];
    artistName = json['artistName'];
    artistId = json['artistId'];
    duration = json['duration'];
    mark = json['mark'];
    subed = json['subed'];
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(new Artists.fromJson(v));
      });
    }
    transNames = json['transNames']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cover'] = this.cover;
    data['name'] = this.name;
    data['playCount'] = this.playCount;
    data['briefDesc'] = this.briefDesc;
    data['desc'] = this.desc;
    data['artistName'] = this.artistName;
    data['artistId'] = this.artistId;
    data['duration'] = this.duration;
    data['mark'] = this.mark;
    data['subed'] = this.subed;
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    data['transNames'] = this.transNames;
    return data;
  }
}

class Artists {
  int? id;
  String? name;

  Artists({this.id, this.name});

  Artists.fromJson(Map<String, dynamic> json) {
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
