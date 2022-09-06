import 'package:dio/dio.dart';
import 'package:flutter_application_pc_1/http/http_response.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["token"] = "abcdefg111111111111111111";

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 请求成功是对数据做基本处理
    if (response.statusCode == 200) {
      response.data = DioResponse(code: 0, message: "请求成功啦", data: response);
    } else {
      response.data = DioResponse(code: 1, message: "请求失败啦", data: response);
    }
    super.onResponse(response, handler);
  }

  @override
  // Future onError(DioError err, ErrorInterceptorHandler handler) {
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err);
    switch (err.type) {
      // 连接服务器超时
      case DioErrorType.connectTimeout:
        {
          // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
        }
        break;
      // 响应超时
      case DioErrorType.receiveTimeout:
        {
          // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
        }
        break;
      // 发送超时
      case DioErrorType.sendTimeout:
        {
          // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
        }
        break;
      // 请求取消
      case DioErrorType.cancel:
        {
          // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
        }
        break;
      // 404/503错误
      case DioErrorType.response:
        {
          // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
        }
        break;
      // other 其他错误类型
      case DioErrorType.other:
        {}
        break;
    }
    super.onError(err, handler);
  }
}
