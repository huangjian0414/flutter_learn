import 'package:flutter/material.dart';
import 'tabbar.dart';
import 'package:flutter_learn/Http/HttpTool.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HttpTool().setConfig('https://douban.uieee.com/v2', 5); //全局配置host,timeout
    return MaterialApp(
        home: HJTabBar(),
    );
  }
}

