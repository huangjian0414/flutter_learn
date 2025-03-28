
import 'package:fluttertoast/fluttertoast.dart';


class HJToast {
  static showMsg(String msg) {
    Fluttertoast.showToast(
        msg: msg, gravity: ToastGravity.CENTER);
  }
}