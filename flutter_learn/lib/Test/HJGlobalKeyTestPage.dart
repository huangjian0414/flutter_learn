

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/Base/LogUtils.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HJGlobalKeyPage(),
    );
  }
}

class HJGlobalKeyPage extends StatelessWidget{
  final GlobalKey<_HJGlobalKeyContentState> homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('GlobalKey 测试'),
      ),
      body: HJGlobalKeyContent(key: homeKey,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.data_usage),
        onPressed: (){
          HJLog('${homeKey.currentState.value}', StackTrace.current);
          HJLog('${homeKey.currentState.widget.name}', StackTrace.current);
          HJLog('${homeKey.currentContext}', StackTrace.current);
          HJLog('${homeKey.currentWidget}', StackTrace.current);

        },
      ),
    );
  }
}

class HJGlobalKeyContent extends StatefulWidget{
  final String name = '张三';

  HJGlobalKeyContent({Key key}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HJGlobalKeyContentState();
  }
}

class _HJGlobalKeyContentState extends State<HJGlobalKeyContent>{
  final String value = "李四";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('GlobalKey Test'),
    );
  }
}