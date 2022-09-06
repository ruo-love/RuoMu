// 请求配置
class HttpOptions {
  // 连接服务器超时时间，单位是毫秒
  static const int CONNECT_TIMEOUT = 30000;
  // 接收超时时间，单位是毫秒
  static const int RECEIVE_TIMEOUT = 30000;
  // 地址前缀
  // static const String BASE_URL = 'http://dev.duuchin.com';
  static const String BASE_URL = 'http://114.132.197.72:2000';
  static const String BASE_URL_Out =
      'https://netease-cloud-music-api-ruddy-gamma.vercel.app';
  //是否开启网络前缀
  static bool CACHE_ENABLE = false;
  //最大缓存时间
  static int MAX_CACHE_AGE = 7 * 24 * 60 * 60;
  // 最大缓存条数
  static int MAX_CACHE_COUNT = 100;
}
