import 'package:dio/dio.dart';
import 'HttpRequest.dart';

class HttpTool {

  factory HttpTool() => _sharedInstance();

  static HttpTool? _instance;

  static Dio dio = Dio();

  HttpTool._() {
    // 初始化
    if (dio == null) {
      dio = Dio();
    }
  }

  static HttpTool _sharedInstance() {
    if (_instance == null) {
      _instance = HttpTool._();
    }
    return _instance!;
  }
  //全局配置
  void setConfig(String baseUrl, int timeOut) {
   BaseOptions options = new BaseOptions(
       baseUrl: baseUrl,
       connectTimeout: timeOut * 1000,
       receiveTimeout: 3000);
   dio.options = options;
  }
  //发起请求
  static Future<T> sendRequest<T>(HttpRequest request) async {
    print(dio.options.baseUrl + request.url);
    try {

     Response res = await dio.request(request.url,
         data: request.params,
         options: Options(
             method: HttpRequest.getTypeString(request.type),
             headers: request.headers,
             sendTimeout: request.timeOut != null ? request.timeOut * 1000 : dio.options.connectTimeout));

      print('response : ${res.data}');
      return res.data;
    } catch (exception) {
      print('response error : $exception');
      return Future.error(exception);
    }
  }
}
