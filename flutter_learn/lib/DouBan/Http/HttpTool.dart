import 'package:dio/dio.dart';
import 'HttpRequest.dart';

class HttpTool {

  factory HttpTool() => _sharedInstance();

  static HttpTool _instance;

  static Dio dio;

  HttpTool._() {
    // 初始化
    dio = new Dio();

  }

  static HttpTool _sharedInstance() {
    if (_instance == null) {
      _instance = HttpTool._();
    }
    return _instance;
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
  void sendRequest(HttpRequest request, Function success,
      Function failure) async {
    print(dio.options.baseUrl + request.url);
    try {
      success("aa");
     Response res = await dio.request(request.url,
         data: request.params,
         options: new Options(
             method: HttpRequest.getTypeString(request.type),
             headers: request.headers,
             sendTimeout: request.timeOut != null ? request.timeOut * 1000 : dio.options.connectTimeout));
      if (success != null){
        success(res.toString());
      }
      print(res.toString());
    } catch (exception) {
      print(exception);
      if (failure != null){
        failure(exception.toString());
      }
    }
  }
}
