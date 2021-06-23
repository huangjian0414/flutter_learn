
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

class HJCounterWidget extends InheritedWidget{
  /// 需要共享的状态
  final int counter;

  ///定义构造方法
  HJCounterWidget({this.counter, Widget child}): super(child:child);

  ///获取组件最近的当前InheritedWidget
  static HJCounterWidget of(BuildContext context){
    ///沿着Element树, 去找到最近的HYCounterElement, 从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  /// 必须实现的方法
  /// 如果返回true: 执行依赖当期的InheritedWidget的State中的didChangeDependencies
  /// 绝对要不要回调State中的didChangeDependencies
  @override
  bool updateShouldNotify(HJCounterWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.counter != counter;
  }

}


class HJStateTestPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HJStateTestPageState();
  }
}

class _HJStateTestPageState extends State{
  int _count = 100;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理'),
      ),
      body: HJCounterWidget(
          counter: _count,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [HJShowData1(), HJShowData2()],
          ),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.data_usage),
        onPressed: (){
          setState(() {
            _count++;
          });
        },
      ),
    );
  }
}

class HJShowData1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HJShowData1State();
  }
}
class _HJShowData1State extends State<HJShowData1>{

  /// build 出来的widget 依赖的HJCounterWidget的数据发生改变时调用
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    HJLog('_HJShowData1State didChangeDependencies', StackTrace.current);
  }

  @override
  Widget build(BuildContext context) {
    int counter = HJCounterWidget.of(context).counter;

    return Card(
      color: Colors.blue,
      child: Text('当前计数：$counter',style: TextStyle(fontSize: 20),),
    );
  }
}

class HJShowData2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    int counter = HJCounterWidget.of(context).counter;

    // TODO: implement build
    return Container(
      child: Text('当前计数：$counter',style: TextStyle(fontSize: 20)),
      color: Colors.amberAccent,
    );
  }
}