class RecommendSongModel {
  int? code;
  int? category;
  List<Result>? result;

  RecommendSongModel({this.code, this.category, this.result});

  RecommendSongModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    category = json['category'];
    if (json['result'] != null) {
      result = <Result>[];

      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['category'] = this.category;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? id;
  int? type;
  String? name;
  String? copywriter;
  String? picUrl;
  bool? canDislike;
  String? trackNumberUpdateTime;
  Song? song;
  String? alg;

  Result(
      {this.id,
      this.type,
      this.name,
      this.copywriter,
      this.picUrl,
      this.canDislike,
      this.trackNumberUpdateTime,
      this.song,
      this.alg});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];

    copywriter = json['copywriter'];
    picUrl = json['picUrl'];
    canDislike = json['canDislike'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];

    song = json['song'] != null ? new Song.fromJson(json['song']) : null;
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['copywriter'] = this.copywriter;
    data['picUrl'] = this.picUrl;
    data['canDislike'] = this.canDislike;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    if (this.song != null) {
      data['song'] = this.song!.toJson();
    }
    data['alg'] = this.alg;
    return data;
  }
}

class Song {
  String? name;
  int? id;
  int? status;
  int? fee;
  int? copyrightId;
  String? disc;
  int? no;
  List<Artists>? artists;
  Album? album;
  bool? starred;
  int? popularity;
  int? score;
  int? starredNum;
  int? duration;
  int? playedNum;
  int? dayPlays;
  int? hearTime;
  SqMusic? sqMusic;
  SqMusic? hrMusic;
  String? ringtone;
  String? crbt;
  String? audition;
  String? copyFrom;
  String? commentThreadId;
  String? rtUrl;
  int? ftype;
  int? copyright;
  String? transName;
  String? sign;
  int? mark;
  int? originCoverType;
  String? originSongSimpleData;
  int? single;
  String? noCopyrightRcmd;
  int? rtype;
  String? rurl;
  int? mvid;
  SqMusic? bMusic;
  String? mp3Url;
  SqMusic? hMusic;
  SqMusic? mMusic;
  SqMusic? lMusic;
  bool? exclusive;
  Privilege? privilege;
  int? position;

  Song(
      {this.name,
      this.id,
      this.status,
      this.fee,
      this.copyrightId,
      this.disc,
      this.no,
      this.artists,
      this.album,
      this.starred,
      this.popularity,
      this.score,
      this.starredNum,
      this.duration,
      this.playedNum,
      this.dayPlays,
      this.hearTime,
      this.sqMusic,
      this.hrMusic,
      this.ringtone,
      this.crbt,
      this.audition,
      this.copyFrom,
      this.commentThreadId,
      this.rtUrl,
      this.ftype,
      this.copyright,
      this.transName,
      this.sign,
      this.mark,
      this.originCoverType,
      this.originSongSimpleData,
      this.single,
      this.noCopyrightRcmd,
      this.rtype,
      this.rurl,
      this.mvid,
      this.bMusic,
      this.mp3Url,
      this.hMusic,
      this.mMusic,
      this.lMusic,
      this.exclusive,
      this.privilege,
      this.position});

  Song.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    status = json['status'];
    fee = json['fee'];
    copyrightId = json['copyrightId'];
    disc = json['disc'];
    no = json['no'];

    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(new Artists.fromJson(v));
      });
    }

    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    starred = json['starred'];
    popularity = json['popularity'];
    score = json['score'];
    starredNum = json['starredNum'];
    duration = json['duration'];
    playedNum = json['playedNum'];
    dayPlays = json['dayPlays'];
    hearTime = json['hearTime'];

    sqMusic =
        json['sqMusic'] != null ? new SqMusic.fromJson(json['sqMusic']) : null;
    hrMusic =
        json['hrMusic'] != null ? new SqMusic.fromJson(json['hrMusic']) : null;

    ringtone = json['ringtone'];
    crbt = json['crbt'];
    audition = json['audition'];
    copyFrom = json['copyFrom'];

    commentThreadId = json['commentThreadId'];
    rtUrl = json['rtUrl'];
    ftype = json['ftype'];
    copyright = json['copyright'];

    transName = json['transName'];

    sign = json['sign'];

    mark = json['mark'];

    originCoverType = json['originCoverType'];

    single = json['single'];
    noCopyrightRcmd = json['noCopyrightRcmd'];
    rtype = json['rtype'];

    rurl = json['rurl'];
    mvid = json['mvid'];

    bMusic =
        json['bMusic'] != null ? new SqMusic.fromJson(json['bMusic']) : null;
    mp3Url = json['mp3Url'];
    hMusic =
        json['hMusic'] != null ? new SqMusic.fromJson(json['hMusic']) : null;
    mMusic =
        json['mMusic'] != null ? new SqMusic.fromJson(json['mMusic']) : null;
    lMusic =
        json['lMusic'] != null ? new SqMusic.fromJson(json['lMusic']) : null;
    exclusive = json['exclusive'];
    privilege = json['privilege'] != null
        ? new Privilege.fromJson(json['privilege'])
        : null;
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['status'] = this.status;
    data['fee'] = this.fee;
    data['copyrightId'] = this.copyrightId;
    data['disc'] = this.disc;
    data['no'] = this.no;
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album!.toJson();
    }
    data['starred'] = this.starred;
    data['popularity'] = this.popularity;
    data['score'] = this.score;
    data['starredNum'] = this.starredNum;
    data['duration'] = this.duration;
    data['playedNum'] = this.playedNum;
    data['dayPlays'] = this.dayPlays;
    data['hearTime'] = this.hearTime;
    if (this.sqMusic != null) {
      data['sqMusic'] = this.sqMusic!.toJson();
    }
    if (this.hrMusic != null) {
      data['hrMusic'] = this.hrMusic!.toJson();
    }
    data['ringtone'] = this.ringtone;
    data['crbt'] = this.crbt;
    data['audition'] = this.audition;
    data['copyFrom'] = this.copyFrom;
    data['commentThreadId'] = this.commentThreadId;
    data['rtUrl'] = this.rtUrl;
    data['ftype'] = this.ftype;
    data['copyright'] = this.copyright;
    data['transName'] = this.transName;
    data['sign'] = this.sign;
    data['mark'] = this.mark;
    data['originCoverType'] = this.originCoverType;
    data['originSongSimpleData'] = this.originSongSimpleData;
    data['single'] = this.single;
    data['noCopyrightRcmd'] = this.noCopyrightRcmd;
    data['rtype'] = this.rtype;
    data['rurl'] = this.rurl;
    data['mvid'] = this.mvid;
    if (this.bMusic != null) {
      data['bMusic'] = this.bMusic!.toJson();
    }
    data['mp3Url'] = this.mp3Url;
    if (this.hMusic != null) {
      data['hMusic'] = this.hMusic!.toJson();
    }
    if (this.mMusic != null) {
      data['mMusic'] = this.mMusic!.toJson();
    }
    if (this.lMusic != null) {
      data['lMusic'] = this.lMusic!.toJson();
    }
    data['exclusive'] = this.exclusive;
    if (this.privilege != null) {
      data['privilege'] = this.privilege!.toJson();
    }
    data['position'] = this.position;
    return data;
  }
}

class Artists {
  String? name;
  int? id;
  int? picId;
  int? img1v1Id;
  String? briefDesc;
  String? picUrl;
  String? img1v1Url;
  int? albumSize;
  String? trans;
  int? musicSize;
  int? topicPerson;

  Artists(
      {this.name,
      this.id,
      this.picId,
      this.img1v1Id,
      this.briefDesc,
      this.picUrl,
      this.img1v1Url,
      this.albumSize,
      this.trans,
      this.musicSize,
      this.topicPerson});

  Artists.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    picId = json['picId'];
    img1v1Id = json['img1v1Id'];
    briefDesc = json['briefDesc'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
    albumSize = json['albumSize'];
    trans = json['trans'];
    musicSize = json['musicSize'];
    topicPerson = json['topicPerson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['picId'] = this.picId;
    data['img1v1Id'] = this.img1v1Id;
    data['briefDesc'] = this.briefDesc;
    data['picUrl'] = this.picUrl;
    data['img1v1Url'] = this.img1v1Url;
    data['albumSize'] = this.albumSize;
    data['trans'] = this.trans;
    data['musicSize'] = this.musicSize;
    data['topicPerson'] = this.topicPerson;
    return data;
  }
}

class Album {
  String? name;
  int? id;
  String? type;
  int? size;
  int? picId;
  String? blurPicUrl;
  int? companyId;
  int? pic;
  String? picUrl;
  int? publishTime;
  String? description;
  String? tags;
  String? company;
  String? briefDesc;
  Artists? artist;
  int? status;
  int? copyrightId;
  String? commentThreadId;
  List<Artists>? artists;
  String? subType;
  String? transName;
  bool? onSale;
  int? mark;
  int? gapless;
  String? picIdStr;

  Album(
      {this.name,
      this.id,
      this.type,
      this.size,
      this.picId,
      this.blurPicUrl,
      this.companyId,
      this.pic,
      this.picUrl,
      this.publishTime,
      this.description,
      this.tags,
      this.company,
      this.briefDesc,
      this.artist,
      this.status,
      this.copyrightId,
      this.commentThreadId,
      this.artists,
      this.subType,
      this.transName,
      this.onSale,
      this.mark,
      this.gapless,
      this.picIdStr});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    size = json['size'];
    picId = json['picId'];
    blurPicUrl = json['blurPicUrl'];
    companyId = json['companyId'];
    pic = json['pic'];
    picUrl = json['picUrl'];
    publishTime = json['publishTime'];
    description = json['description'];
    tags = json['tags'];
    company = json['company'];
    briefDesc = json['briefDesc'];
    artist =
        json['artist'] != null ? new Artists.fromJson(json['artist']) : null;
    status = json['status'];
    copyrightId = json['copyrightId'];
    commentThreadId = json['commentThreadId'];
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(new Artists.fromJson(v));
      });
    }
    subType = json['subType'];
    transName = json['transName'];
    onSale = json['onSale'];
    mark = json['mark'];
    gapless = json['gapless'];
    picIdStr = json['picId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['size'] = this.size;
    data['picId'] = this.picId;
    data['blurPicUrl'] = this.blurPicUrl;
    data['companyId'] = this.companyId;
    data['pic'] = this.pic;
    data['picUrl'] = this.picUrl;
    data['publishTime'] = this.publishTime;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['company'] = this.company;
    data['briefDesc'] = this.briefDesc;
    if (this.artist != null) {
      data['artist'] = this.artist!.toJson();
    }
    data['status'] = this.status;
    data['copyrightId'] = this.copyrightId;
    data['commentThreadId'] = this.commentThreadId;
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    data['subType'] = this.subType;
    data['transName'] = this.transName;
    data['onSale'] = this.onSale;
    data['mark'] = this.mark;
    data['gapless'] = this.gapless;
    data['picId_str'] = this.picIdStr;
    return data;
  }
}

class SqMusic {
  String? name;
  int? id;
  int? size;
  String? extension;
  int? sr;
  int? dfsId;
  int? bitrate;
  int? playTime;
  int? volumeDelta;

  SqMusic(
      {this.name,
      this.id,
      this.size,
      this.extension,
      this.sr,
      this.dfsId,
      this.bitrate,
      this.playTime,
      this.volumeDelta});

  SqMusic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    size = json['size'];
    extension = json['extension'];
    sr = json['sr'];
    dfsId = json['dfsId'];
    bitrate = json['bitrate'];
    playTime = json['playTime'];
    volumeDelta = json['volumeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['size'] = this.size;
    data['extension'] = this.extension;
    data['sr'] = this.sr;
    data['dfsId'] = this.dfsId;
    data['bitrate'] = this.bitrate;
    data['playTime'] = this.playTime;
    data['volumeDelta'] = this.volumeDelta;
    return data;
  }
}

class Privilege {
  int? id;
  int? fee;
  int? payed;
  int? st;
  int? pl;
  int? dl;
  int? sp;
  int? cp;
  int? subp;
  bool? cs;
  int? maxbr;
  int? fl;
  bool? toast;
  int? flag;
  bool? preSell;
  int? playMaxbr;
  int? downloadMaxbr;
  String? maxBrLevel;
  String? playMaxBrLevel;
  String? downloadMaxBrLevel;
  String? plLevel;
  String? dlLevel;
  String? flLevel;
  String? rscl;
  FreeTrialPrivilege? freeTrialPrivilege;
  List<ChargeInfoList>? chargeInfoList;

  Privilege(
      {this.id,
      this.fee,
      this.payed,
      this.st,
      this.pl,
      this.dl,
      this.sp,
      this.cp,
      this.subp,
      this.cs,
      this.maxbr,
      this.fl,
      this.toast,
      this.flag,
      this.preSell,
      this.playMaxbr,
      this.downloadMaxbr,
      this.maxBrLevel,
      this.playMaxBrLevel,
      this.downloadMaxBrLevel,
      this.plLevel,
      this.dlLevel,
      this.flLevel,
      this.rscl,
      this.freeTrialPrivilege,
      this.chargeInfoList});

  Privilege.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fee = json['fee'];
    payed = json['payed'];
    st = json['st'];
    pl = json['pl'];
    dl = json['dl'];
    sp = json['sp'];
    cp = json['cp'];
    subp = json['subp'];
    cs = json['cs'];
    maxbr = json['maxbr'];
    fl = json['fl'];
    toast = json['toast'];
    flag = json['flag'];
    preSell = json['preSell'];
    playMaxbr = json['playMaxbr'];
    downloadMaxbr = json['downloadMaxbr'];
    maxBrLevel = json['maxBrLevel'];
    playMaxBrLevel = json['playMaxBrLevel'];
    downloadMaxBrLevel = json['downloadMaxBrLevel'];
    plLevel = json['plLevel'];
    dlLevel = json['dlLevel'];
    flLevel = json['flLevel'];
    rscl = json['rscl'];
    freeTrialPrivilege = json['freeTrialPrivilege'] != null
        ? new FreeTrialPrivilege.fromJson(json['freeTrialPrivilege'])
        : null;
    if (json['chargeInfoList'] != null) {
      chargeInfoList = <ChargeInfoList>[];
      json['chargeInfoList'].forEach((v) {
        chargeInfoList!.add(new ChargeInfoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fee'] = this.fee;
    data['payed'] = this.payed;
    data['st'] = this.st;
    data['pl'] = this.pl;
    data['dl'] = this.dl;
    data['sp'] = this.sp;
    data['cp'] = this.cp;
    data['subp'] = this.subp;
    data['cs'] = this.cs;
    data['maxbr'] = this.maxbr;
    data['fl'] = this.fl;
    data['toast'] = this.toast;
    data['flag'] = this.flag;
    data['preSell'] = this.preSell;
    data['playMaxbr'] = this.playMaxbr;
    data['downloadMaxbr'] = this.downloadMaxbr;
    data['maxBrLevel'] = this.maxBrLevel;
    data['playMaxBrLevel'] = this.playMaxBrLevel;
    data['downloadMaxBrLevel'] = this.downloadMaxBrLevel;
    data['plLevel'] = this.plLevel;
    data['dlLevel'] = this.dlLevel;
    data['flLevel'] = this.flLevel;
    data['rscl'] = this.rscl;
    if (this.freeTrialPrivilege != null) {
      data['freeTrialPrivilege'] = this.freeTrialPrivilege!.toJson();
    }
    if (this.chargeInfoList != null) {
      data['chargeInfoList'] =
          this.chargeInfoList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FreeTrialPrivilege {
  bool? resConsumable;
  bool? userConsumable;
  String? listenType;

  FreeTrialPrivilege(
      {this.resConsumable, this.userConsumable, this.listenType});

  FreeTrialPrivilege.fromJson(Map<String, dynamic> json) {
    resConsumable = json['resConsumable'];
    userConsumable = json['userConsumable'];
    listenType = json['listenType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resConsumable'] = this.resConsumable;
    data['userConsumable'] = this.userConsumable;
    data['listenType'] = this.listenType;
    return data;
  }
}

class ChargeInfoList {
  int? rate;
  String? chargeUrl;
  String? chargeMessage;
  int? chargeType;

  ChargeInfoList(
      {this.rate, this.chargeUrl, this.chargeMessage, this.chargeType});

  ChargeInfoList.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    chargeUrl = json['chargeUrl'];
    chargeMessage = json['chargeMessage'];
    chargeType = json['chargeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['chargeUrl'] = this.chargeUrl;
    data['chargeMessage'] = this.chargeMessage;
    data['chargeType'] = this.chargeType;
    return data;
  }
}
