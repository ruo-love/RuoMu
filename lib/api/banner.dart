import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_pc_1/mode/banner_model.dart';

import '../http/request.dart';

Future<List<Banners>> getBannerList() async {
  Map<String, dynamic> res =
      await Request().get('/banner', parameters: {'type': 1});
  BannerModel resModel = BannerModel.fromJson(res);
  return resModel.banners!;
}
