
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/DouBan/Base/LogUtils.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HJStateTestPage(),
    );
  }
}

class HJStateTestPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('事件监听'),
      ),
      body: Center(
        // child: buildListener()
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.orange,
              ),
              onTapDown: (_){
                HJLog('orange tapDown', StackTrace.current);
              },
            ),
            IgnorePointer(/// 忽略事件响应
              child: GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                onTapDown: (_){
                  HJLog('red tapDown', StackTrace.current);
                },
              ),
            )
          ],
        )
      ),
    );
  }
  /// 嵌套手势
  GestureDetector buildDoubleGestureDetector() {
    return GestureDetector(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.orange,
          alignment: Alignment.center,
          child: GestureDetector(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            onTapDown: (_){
              HJLog('red tapDown', StackTrace.current);
            },
          ),
        ),
        onTapDown: (_){
          HJLog('orange tapDown', StackTrace.current);
        },
      );
  }

  GestureDetector buildGestureDetector() {
    return GestureDetector(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
        onTap: (){
          HJLog('点击', StackTrace.current);
        },
        onTapDown: (details){
          HJLog('按下', StackTrace.current);
        },
        onTapUp: (details){
          HJLog('抬起', StackTrace.current);
        },
        onDoubleTap: (){
          HJLog('双击', StackTrace.current);
        },
      );
  }



  Listener buildListener() {
    return Listener(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
        onPointerDown: (event){
          HJLog('手指按下：$event', StackTrace.current);
        },
        onPointerMove: (event){
          HJLog('手指移动：$event', StackTrace.current);
        },
        onPointerUp: (event){
          HJLog('手指抬起：$event', StackTrace.current);
        },
      );
  }
}

