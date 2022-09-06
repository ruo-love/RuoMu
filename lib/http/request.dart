import 'package:dio/dio.dart';
import 'http_Interceptor.dart';
import './http_options.dart';

class Request {
  static dynamic _instance;
  late Dio dio;
  getHeader() {
    return {
      'Accept': 'application/json, text/plain, */*',
      'Content-Type': 'multipart/form-data',
      'Authorization': "*",
      'User-Aagent': "4.1.0;android;6.0.1;default;A001",
      "HZUID": "2",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": true
    };
  }

  _init() {
    dio = Dio();
    dio.options
      ..baseUrl = HttpOptions.BASE_URL
      ..sendTimeout = HttpOptions.CONNECT_TIMEOUT
      ..receiveTimeout = HttpOptions.RECEIVE_TIMEOUT;
  }

  Request._internal() {
    Request._instance = this;
    Request._instance._init();
  }
  factory Request() {
    if (Request._instance == null) {
      Request._internal();
    }
    return Request._instance;
  }

  Future get(String url,
      {Map<String, dynamic>? parameters, Options? options}) async {
    Response response;

    if (parameters != null && options != null) {
      response =
          await dio.get(url, queryParameters: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.get(url, queryParameters: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.get(url, options: options);
    } else {
      response = await dio.get(url);
    }

    return response.data;
  }

  ///post
  Future post(String url,
      {required Map<String, dynamic>? parameters, Options? options}) async {
    Response response;
    if (parameters != null && options != null) {
      response = await dio.post(url, data: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.post(url, data: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.post(url, options: options);
    } else {
      response = await dio.post(url);
    }

    return response.data;
  }

  ///表单请求
  Future postFormData(String url,
      {required FormData? parameters, Options? options}) async {
    Response response;
    if (parameters != null && options != null) {
      response = await dio.post(url, data: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.post(url, data: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.post(url, options: options);
    } else {
      response = await dio.post(url);
    }
    return response.data;
  }
}
