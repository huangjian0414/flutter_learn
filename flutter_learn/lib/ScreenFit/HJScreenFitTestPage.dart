
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_learn/ScreenFit/HJSizeFitUtil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HJSizeFitUtil.initialize();
    return MaterialApp(
        home: HJScreenFitTestPage(),
    );
  }
}

class HJScreenFitTestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenW = HJSizeFitUtil.screenWidth;
    final screenH = HJSizeFitUtil.screenHeight;

    final physicalWidth = HJSizeFitUtil.physicalWidth;
    final physicalHeight = HJSizeFitUtil.physicalHeight;

    final dpr = HJSizeFitUtil.dpr;

    print("屏幕width:$screenW height:$screenH");
    print("分辨率: $physicalWidth - $physicalHeight");
    print("dpr: $dpr");

    // 3.状态栏的高度
// 有刘海的屏幕:44 没有刘海的屏幕为20
    final statusBarHeight = mediaQuery.padding.top;
// 有刘海的屏幕:34 没有刘海的屏幕0
    final bottomHeight = mediaQuery.padding.bottom;
    print("状态栏height: $statusBarHeight 底部高度:$bottomHeight");

    return Scaffold(
      appBar: AppBar(
        title: Text('屏幕适配'),
      ),
      body: Center(
        child: Container(
          // width: HJSizeFitUtil.setRpx(300),
          // height: HJSizeFitUtil.setPx(200),
          width: 300.hj_rpx,
          height: 200.hj_px,
          color: Colors.orange,
          child: Text('海贼·王路飞',style: TextStyle(fontSize: HJSizeFitUtil.setPx(40)),),
        ),
      ),
    );
  }
}


