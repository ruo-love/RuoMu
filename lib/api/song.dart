import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_pc_1/mode/album_detail_model.dart';
import 'package:flutter_application_pc_1/mode/album_model.dart';
import 'package:flutter_application_pc_1/mode/category_song_list.dart';
import 'package:flutter_application_pc_1/mode/recommend_song_model.dart'
    as PACKAGE_RECOMMEND;
import 'package:flutter_application_pc_1/mode/song_list.dart'
    as PACKAGE_SONG_LIST;
import 'package:flutter_application_pc_1/mode/song_list_detail_model.dart';
import 'package:flutter_application_pc_1/mode/song_url_model.dart';

import 'package:flutter_application_pc_1/mode/search_song_model.dart'
    as PACKAGE_SEARCH;
import '../http/request.dart';

//关键词搜索
Future<List<PACKAGE_SEARCH.Songs>> getSongsByKewords(
    {String keywords = '海阔天空', int limit = 60}) async {
  Map<String, dynamic> res = await Request()
      .get('/search', parameters: {'keywords': keywords, 'limit': limit});

  PACKAGE_SEARCH.SearchSongModel searchSongData =
      PACKAGE_SEARCH.SearchSongModel.fromJson(res);
  return searchSongData.result!.songs!;
}

//获取最新歌曲推荐
Future<List<PACKAGE_RECOMMEND.Result>> getSongsByRecommend(
    {int limit = 20, int page = 1}) async {
  Map<String, dynamic> res = await Request()
      .get('/personalized/newsong', parameters: {'limit': limit * page});

  // print(json.encode(res));
  PACKAGE_RECOMMEND.RecommendSongModel recommendData =
      PACKAGE_RECOMMEND.RecommendSongModel.fromJson(res);

  return recommendData.result!.sublist((page - 1) * 10);
}

//歌曲url
Future<SongUrl> getSongUrl(int id) async {
  Map<String, dynamic> res =
      await Request().get('/song/url', parameters: {'id': id});

  SongUrl data = SongUrl.fromJson(res);

  return data;
}

//推荐歌单
Future<List<PACKAGE_SONG_LIST.Result>> getRecommendSongList(
    {int limit = 30}) async {
  Map<String, dynamic> res =
      await Request().get('/personalized', parameters: {'limit': limit});

  PACKAGE_SONG_LIST.SongList data = PACKAGE_SONG_LIST.SongList.fromJson(res);

  return data.result!;
}

//专辑
Future<List<Albums>> getNewAlbum() async {
  Map<String, dynamic> res = await Request().get('/album/newest');

  AlbumModel data = AlbumModel.fromJson(res);

  return data.albums!;
}

//歌单详情
Future<Playlist> getAlbumDetails({int id = 2084738832}) async {
  Map<String, dynamic> res =
      await Request().get('/playlist/detail', parameters: {'id': id});

  SongListDetailModel data = SongListDetailModel.fromJson(res);

  return data.playlist!;
}

Future<AlbumDetailModel> getNewAlbumDetail(int id) async {
  Map<String, dynamic> res =
      await Request().get('/album', parameters: {'id': id});

  AlbumDetailModel data = AlbumDetailModel.fromJson(res);

  return data;
}

//歌单分类
Future<List<Tags>> getSongListCategory() async {
  Map<String, dynamic> res = await Request().get('/playlist/hot');

  SongListCategoryModel data = SongListCategoryModel.fromJson(res);

  return data.tags!;
}

//歌单分类详情
Future<List<Playlists>> getSongListCategoryDetail(String cat) async {
  Map<String, dynamic> res =
      await Request().get('/top/playlist', parameters: {'cat': cat});

  SongListItemModel data = SongListItemModel.fromJson(res);

  return data.playlists!;
}
