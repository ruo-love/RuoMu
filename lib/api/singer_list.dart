import 'dart:convert';
import 'package:flutter_application_pc_1/mode/singer_album_model.dart';
import 'package:flutter_application_pc_1/mode/singer_info_model.dart';
import 'package:flutter_application_pc_1/mode/singer_model.dart';
import 'package:flutter_application_pc_1/mode/singer_song_model.dart';

import '../http/request.dart';

//热门歌手
Future<List<Artists>> getHotSinger({int limit = 20, int page = 1}) async {
  Map<String, dynamic> res =
      await Request().get('/top/artists', parameters: {'limit': limit * page});
  // print(res);
  SingerModel singerData = SingerModel.fromJson(res);
  print(singerData);
  return singerData.artists!.sublist((page - 1) * 10);
}
//歌手详情
// http://114.132.197.72:2000/artist/detail?id=11972054

Future<SingerInfoModel> getSingerInfo(int id) async {
  Map<String, dynamic> res =
      await Request().get('/artist/detail', parameters: {'id': id});
  // print(res);
  SingerInfoModel data = SingerInfoModel.fromJson(res);

  return data;
}

Future<SingerSongModel> getSingerAllSong(int id) async {
  Map<String, dynamic> res =
      await Request().get('/artist/songs', parameters: {'id': id});
  // print(res);
  SingerSongModel data = SingerSongModel.fromJson(res);

  return data;
}

Future<List<HotAlbums>> getSingerAlbums(int id) async {
  Map<String, dynamic> res = await Request()
      .get('/artist/album', parameters: {'id': id, 'limit': 100});

  SingerAlbumModel data = SingerAlbumModel.fromJson(res);

  return data.hotAlbums!;
}
//分类/playlist/hot