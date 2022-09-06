class AlbumDetailModel {
  List<Songs>? songs;
  Album? album;

  AlbumDetailModel({this.songs, this.album});

  AlbumDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['songs'] != null) {
      songs = <Songs>[];
      json['songs'].forEach((v) {
        songs!.add(new Songs.fromJson(v));
      });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songs != null) {
      data['songs'] = this.songs!.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album!.toJson();
    }
    return data;
  }
}

class Songs {
  String? name;
  int? id;
  int? fee;
  Songs({this.name, this.id});

  Songs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['fee'] = this.fee;
    return data;
  }
}

class Album {
  String? company;
  String? description;
  String? name;

  Album({this.company, this.description, this.name});

  Album.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    description = json['description'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['description'] = this.description;
    data['name'] = this.name;
    return data;
  }
}
