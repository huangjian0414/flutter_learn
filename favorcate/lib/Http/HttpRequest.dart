
enum HttpType { kGet, kPost, kPut, kDelete }
class HttpRequest {

  String url = '';
  Map<String, dynamic> params = {};
  Map<String, String> headers = {};
  HttpType type = HttpType.kGet;
  int timeOut = 5;

  static String getTypeString(HttpType type) {
    switch (type){
      case HttpType.kGet:
        return 'get';
      case HttpType.kPost:
        return 'post';
      case HttpType.kPut:
        return 'put';
      case HttpType.kDelete:
        return 'delete';
    }
}
}