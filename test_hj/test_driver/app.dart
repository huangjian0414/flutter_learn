

import 'package:flutter_driver/driver_extension.dart';
import 'package:test_hj/main.dart' as app;

void main() {
  // 1.初始化Driver
  enableFlutterDriverExtension();

  // 2.启动应用程序
  app.main();
}