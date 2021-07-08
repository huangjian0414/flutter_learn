import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {

  group("counter application test", () {
    FlutterDriver? driver ;

    setUpAll(() async {
      //运行测试案例前，先与待测应用建立连接
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver!.close();
      }
    });

    final textFinder = find.byValueKey("counter");
    final buttonFinder = find.byValueKey("increment");

    test(("starts at 0"), () async {
      if (driver != null) {
        expect(await driver!.getText(textFinder), "0");
      }
    });

    test(("on tap click"), () async {
      if (driver != null) {
        await driver!.tap(buttonFinder);
        expect(await driver!.getText(textFinder), "1");
      }
    });
  });
}