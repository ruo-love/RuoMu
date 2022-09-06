import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_application_pc_1/mode/login_model.dart';

import '../http/request.dart';

// Future<LoginModel> loginByCaptcha(
//     {required String phone, required String captcha}) async {
//   Map<String, dynamic> res = await Request().get('/login/cellphone',
//       parameters: {'phone': phone, 'captcha': captcha});

//   print('ok');
//   LoginModel resModel = LoginModel.fromJson(res);
//   return resModel;
// }

// Future<bool> setCaptcha(String phone) async {
//   await Request().get('/captcha/sent', parameters: {'phone': phone});
//   return true;
// }

Future<TouristLoginModel> loginByTourist() async {
  Map<String, dynamic> res = await Request().get('/register/anonimous');
  TouristLoginModel resModel = TouristLoginModel.fromJson(res);
  return resModel;
}
