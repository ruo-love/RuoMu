class SongUrl {
  List<Data>? data;

  SongUrl({this.data});

  SongUrl.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? url;
  int? size;
  String? type;
  String? encodeType;
  int? time;

  Data({this.id, this.url, this.size, this.type, this.encodeType, this.time});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    size = json['size'];
    type = json['type'];
    encodeType = json['encodeType'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['size'] = this.size;
    data['type'] = this.type;
    data['encodeType'] = this.encodeType;
    data['time'] = this.time;
    return data;
  }
}
