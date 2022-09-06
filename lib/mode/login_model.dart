class LoginModel {
  int? loginType;
  int? code;
  Account? account;
  String? token;
  Profile? profile;
  List<Bindings>? bindings;
  String? cookie;

  LoginModel(
      {this.loginType,
      this.code,
      this.account,
      this.token,
      this.profile,
      this.bindings,
      this.cookie});

  LoginModel.fromJson(Map<String, dynamic> json) {
    loginType = json['loginType'];
    code = json['code'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    token = json['token'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['bindings'] != null) {
      bindings = <Bindings>[];
      json['bindings'].forEach((v) {
        bindings!.add(new Bindings.fromJson(v));
      });
    }
    cookie = json['cookie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginType'] = this.loginType;
    data['code'] = this.code;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    data['token'] = this.token;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.bindings != null) {
      data['bindings'] = this.bindings!.map((v) => v.toJson()).toList();
    }
    data['cookie'] = this.cookie;
    return data;
  }
}

class Account {
  int? id;
  String? userName;
  int? type;
  int? status;
  int? whitelistAuthority;
  int? createTime;
  String? salt;
  int? tokenVersion;
  int? ban;
  int? baoyueVersion;
  int? donateVersion;
  int? vipType;
  int? viptypeVersion;
  bool? anonimousUser;
  bool? uninitialized;

  Account(
      {this.id,
      this.userName,
      this.type,
      this.status,
      this.whitelistAuthority,
      this.createTime,
      this.salt,
      this.tokenVersion,
      this.ban,
      this.baoyueVersion,
      this.donateVersion,
      this.vipType,
      this.viptypeVersion,
      this.anonimousUser,
      this.uninitialized});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    type = json['type'];
    status = json['status'];
    whitelistAuthority = json['whitelistAuthority'];
    createTime = json['createTime'];
    salt = json['salt'];
    tokenVersion = json['tokenVersion'];
    ban = json['ban'];
    baoyueVersion = json['baoyueVersion'];
    donateVersion = json['donateVersion'];
    vipType = json['vipType'];
    viptypeVersion = json['viptypeVersion'];
    anonimousUser = json['anonimousUser'];
    uninitialized = json['uninitialized'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['type'] = this.type;
    data['status'] = this.status;
    data['whitelistAuthority'] = this.whitelistAuthority;
    data['createTime'] = this.createTime;
    data['salt'] = this.salt;
    data['tokenVersion'] = this.tokenVersion;
    data['ban'] = this.ban;
    data['baoyueVersion'] = this.baoyueVersion;
    data['donateVersion'] = this.donateVersion;
    data['vipType'] = this.vipType;
    data['viptypeVersion'] = this.viptypeVersion;
    data['anonimousUser'] = this.anonimousUser;
    data['uninitialized'] = this.uninitialized;
    return data;
  }
}

class Profile {
  bool? followed;
  String? backgroundUrl;
  String? detailDescription;
  String? avatarImgIdStr;
  String? backgroundImgIdStr;
  int? userId;
  int? userType;
  int? vipType;
  String? nickname;
  int? birthday;
  int? gender;
  int? province;
  int? city;
  int? avatarImgId;
  int? backgroundImgId;
  int? accountStatus;
  String? avatarUrl;
  bool? defaultAvatar;
  Null? expertTags;
  Experts? experts;
  bool? mutual;
  Null? remarkName;
  int? authStatus;
  int? djStatus;
  String? description;
  String? signature;
  int? authority;

  int? followeds;
  int? follows;
  int? eventCount;
  Null? avatarDetail;
  int? playlistCount;
  int? playlistBeSubscribedCount;

  Profile(
      {this.followed,
      this.backgroundUrl,
      this.detailDescription,
      this.backgroundImgIdStr,
      this.userId,
      this.userType,
      this.vipType,
      this.nickname,
      this.birthday,
      this.gender,
      this.province,
      this.city,
      this.avatarImgId,
      this.backgroundImgId,
      this.accountStatus,
      this.avatarUrl,
      this.defaultAvatar,
      this.expertTags,
      this.experts,
      this.mutual,
      this.remarkName,
      this.authStatus,
      this.djStatus,
      this.description,
      this.signature,
      this.authority,
      this.avatarImgIdStr,
      this.followeds,
      this.follows,
      this.eventCount,
      this.avatarDetail,
      this.playlistCount,
      this.playlistBeSubscribedCount});

  Profile.fromJson(Map<String, dynamic> json) {
    followed = json['followed'];
    backgroundUrl = json['backgroundUrl'];
    detailDescription = json['detailDescription'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    userId = json['userId'];
    userType = json['userType'];
    vipType = json['vipType'];
    nickname = json['nickname'];
    birthday = json['birthday'];
    gender = json['gender'];
    province = json['province'];
    city = json['city'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    accountStatus = json['accountStatus'];
    avatarUrl = json['avatarUrl'];
    defaultAvatar = json['defaultAvatar'];
    expertTags = json['expertTags'];
    experts =
        json['experts'] != null ? new Experts.fromJson(json['experts']) : null;
    mutual = json['mutual'];
    remarkName = json['remarkName'];
    authStatus = json['authStatus'];
    djStatus = json['djStatus'];
    description = json['description'];
    signature = json['signature'];
    authority = json['authority'];
    avatarImgIdStr = json['avatarImgId_str'];
    followeds = json['followeds'];
    follows = json['follows'];
    eventCount = json['eventCount'];
    avatarDetail = json['avatarDetail'];
    playlistCount = json['playlistCount'];
    playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followed'] = this.followed;
    data['backgroundUrl'] = this.backgroundUrl;
    data['detailDescription'] = this.detailDescription;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['vipType'] = this.vipType;
    data['nickname'] = this.nickname;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['province'] = this.province;
    data['city'] = this.city;
    data['avatarImgId'] = this.avatarImgId;
    data['backgroundImgId'] = this.backgroundImgId;
    data['accountStatus'] = this.accountStatus;
    data['avatarUrl'] = this.avatarUrl;
    data['defaultAvatar'] = this.defaultAvatar;
    data['expertTags'] = this.expertTags;
    if (this.experts != null) {
      data['experts'] = this.experts!.toJson();
    }
    data['mutual'] = this.mutual;
    data['remarkName'] = this.remarkName;
    data['authStatus'] = this.authStatus;
    data['djStatus'] = this.djStatus;
    data['description'] = this.description;
    data['signature'] = this.signature;
    data['authority'] = this.authority;
    data['avatarImgId_str'] = this.avatarImgIdStr;
    data['followeds'] = this.followeds;
    data['follows'] = this.follows;
    data['eventCount'] = this.eventCount;
    data['avatarDetail'] = this.avatarDetail;
    data['playlistCount'] = this.playlistCount;
    data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
    return data;
  }
}

class Experts {
  Experts();

  Experts.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class Bindings {
  String? url;
  int? userId;
  bool? expired;
  int? bindingTime;
  int? refreshTime;
  String? tokenJsonStr;
  int? expiresIn;
  int? id;
  int? type;

  Bindings(
      {this.url,
      this.userId,
      this.expired,
      this.bindingTime,
      this.refreshTime,
      this.tokenJsonStr,
      this.expiresIn,
      this.id,
      this.type});

  Bindings.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    userId = json['userId'];
    expired = json['expired'];
    bindingTime = json['bindingTime'];
    refreshTime = json['refreshTime'];
    tokenJsonStr = json['tokenJsonStr'];
    expiresIn = json['expiresIn'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['userId'] = this.userId;
    data['expired'] = this.expired;
    data['bindingTime'] = this.bindingTime;
    data['refreshTime'] = this.refreshTime;
    data['tokenJsonStr'] = this.tokenJsonStr;
    data['expiresIn'] = this.expiresIn;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}

class TouristLoginModel {
  int? code;
  int? userId;
  int? createTime;
  String? cookie;

  TouristLoginModel({this.code, this.userId, this.createTime, this.cookie});

  TouristLoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    userId = json['userId'];
    createTime = json['createTime'];
    cookie = json['cookie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['userId'] = this.userId;
    data['createTime'] = this.createTime;
    data['cookie'] = this.cookie;
    return data;
  }
}
