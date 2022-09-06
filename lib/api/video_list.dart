import 'dart:convert';
import 'package:flutter_application_pc_1/mode/mv_comment_model.dart';
import 'package:flutter_application_pc_1/mode/tiny_video_model.dart';
import 'package:flutter_application_pc_1/mode/video_model.dart' as MV;
import 'package:flutter_application_pc_1/mode/video_url_model.dart'
    as VideoUrlModel_PACKAGE;
import '../http/request.dart';

//最新mv
Future<List<MV.Data>> getHotMvList({int limit = 20, int page = 1}) async {
  Map<String, dynamic> res =
      await Request().get('/mv/first', parameters: {'limit': limit * page});

  MV.VideoModel videoData = MV.VideoModel.fromJson(res);

  return videoData.data!.sublist((page - 1) * 10);
}

//mv url
Future<VideoUrlModel_PACKAGE.Data> getMvDetail(int id) async {
  Map<String, dynamic> res =
      await Request().get('/mv/url', parameters: {'id': id});

  VideoUrlModel_PACKAGE.VideoUrlModel videoUrlData =
      VideoUrlModel_PACKAGE.VideoUrlModel.fromJson(res);

  return videoUrlData.data!;
}

//mv comment

Future<List<HotComments>> getMvComment(int id) async {
  Map<String, dynamic> res =
      await Request().get('/comment/mv', parameters: {'id': id});

  MvCommentModel data = MvCommentModel.fromJson(res);

  return data.hotComments!;
}

Future<TinyVideoModel> getRecommendVideo(
    {int offset = 1, String cookie = ''}) async {
  print(cookie);
  Map<String, dynamic> res = await Request().get(
      '/video/timeline/recommend?offset=${offset}',
      parameters: {'cookie': cookie});
  TinyVideoModel data = TinyVideoModel.fromJson(res);

  return data;
}
