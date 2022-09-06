class MvCommentModel {
  List<HotComments>? hotComments;

  MvCommentModel({this.hotComments});

  MvCommentModel.fromJson(Map<String, dynamic> json) {
    if (json['hotComments'] != null) {
      hotComments = <HotComments>[];
      json['hotComments'].forEach((v) {
        hotComments!.add(new HotComments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotComments != null) {
      data['hotComments'] = this.hotComments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotComments {
  User? user;
  int? status;
  int? commentId;
  String? content;
  String? timeStr;
  int? likedCount;

  HotComments(
      {this.user,
      this.status,
      this.commentId,
      this.content,
      this.timeStr,
      this.likedCount});

  HotComments.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    status = json['status'];
    commentId = json['commentId'];
    content = json['content'];
    timeStr = json['timeStr'];
    likedCount = json['likedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status'] = this.status;
    data['commentId'] = this.commentId;
    data['content'] = this.content;
    data['timeStr'] = this.timeStr;
    data['likedCount'] = this.likedCount;
    return data;
  }
}

class User {
  int? userId;
  String? avatarUrl;
  String? nickname;

  User({this.userId, this.avatarUrl, this.nickname});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    avatarUrl = json['avatarUrl'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['avatarUrl'] = this.avatarUrl;
    data['nickname'] = this.nickname;
    return data;
  }
}
