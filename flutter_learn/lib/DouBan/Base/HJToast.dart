
import 'package:fluttertoast/fluttertoast.dart';


class HJToast {
  static showMsg(String msg) {
    Fluttertoast.showToast(
        msg: msg, timeInSecForIos: 1, gravity: ToastGravity.CENTER);
  }
}