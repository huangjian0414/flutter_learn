
enum HttpType { kGet, kPost, kPut, kDelete }
class HttpRequest {

  String url;
  Map<String, dynamic> params;
  Map<String, String> headers;
  HttpType type = HttpType.kGet;
  int timeOut ;

  static String getTypeString(HttpType type) {
    switch (type){
      case HttpType.kGet:
        return 'get';
        break;
      case HttpType.kPost:
        return 'post';
        break;
      case HttpType.kPut:
        return 'put';
        break;
      case HttpType.kDelete:
        return 'delete';
        break;
    }
    return 'get';
}
}