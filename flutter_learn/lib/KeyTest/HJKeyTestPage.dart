
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HJKeyTestPage(),
    );
  }
}


class HJKeyTestPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HJKeyTestPageState();
  }
}

class _HJKeyTestPageState extends State{
  final List<String> lists = ['111111','222222','333333'];

  /// ValueKey(Random().nextInt(10000)) 随机key 每次删除都会出现随机颜色
  /// 因为修改了key之后，Element会强制刷新，那么对应的State也会重新创建

  /// 指定key  理想效果
  /// 在更新widget的过程中根据key进行了diff算法，
  /// 在前后进行对比时，发现222对应的Element和333对应的Element会继续使用，那么就会删除之前111对应的Element，而不是直接删除最后一个Element
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Key 测试'),
      ),
      body: ListView(
        children: lists.map((e) {
          return ListItemLess(e);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          setState(() {
            lists.removeAt(0);
          });
        },
      ),
    );
  }
}

/// 删除之后调用setState，会重新build，重新build出来的新的StatelessWidget会重新生成一个新的随机颜色,所有的颜色都会发现一次变化
class ListItemLess extends StatelessWidget {
  final String name;
  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  ListItemLess(this.name);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text(name,style: TextStyle(color: Colors.white, fontSize: 30)),
      height: 100,
      color: randColor,
    );
  }
}

/// 没有key：
/// 很奇怪的现象，颜色不变化，但是数据向上移动了
/// 因为在删除第一条数据的时候，Widget对应的Element并没有改变
/// 而Element中对应的State引用也没有发生改变；
/// 在更新Widget的时候，Widget使用了没有改变的Element中的State
class ListItemFul extends StatefulWidget {
  final String name;

  const ListItemFul({Key? key, this.name = ''}) : super(key: key);

  //ListItemFul(this.name) :super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListItemFulState();
  }
}

class _ListItemFulState extends State<ListItemFul>{
  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 30),),
      height: 100,
      color: randColor,
    );
  }
}