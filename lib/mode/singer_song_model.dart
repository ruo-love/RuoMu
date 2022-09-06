class SingerSongModel {
  List<Songs>? songs;
  int? total;

  SingerSongModel({this.songs, this.total});

  SingerSongModel.fromJson(Map<String, dynamic> json) {
    if (json['songs'] != null) {
      songs = <Songs>[];
      json['songs'].forEach((v) {
        songs!.add(new Songs.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songs != null) {
      data['songs'] = this.songs!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Songs {
  List<Ar>? ar;
  int? fee;
  String? name;
  int? id;
  String? eq;

  Songs({this.ar, this.fee, this.name, this.id, this.eq});

  Songs.fromJson(Map<String, dynamic> json) {
    if (json['ar'] != null) {
      ar = <Ar>[];
      json['ar'].forEach((v) {
        ar!.add(new Ar.fromJson(v));
      });
    }
    fee = json['fee'];
    name = json['name'];
    id = json['id'];
    eq = json['eq'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ar != null) {
      data['ar'] = this.ar!.map((v) => v.toJson()).toList();
    }
    data['fee'] = this.fee;
    data['name'] = this.name;
    data['id'] = this.id;
    data['eq'] = this.eq;
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
