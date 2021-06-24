
import 'package:flutter_learn/DouBan/Base/LogUtils.dart';
import 'package:flutter_learn/StateTest/Provider/HJCounterViewModel.dart';
import 'package:flutter_learn/StateTest/Provider/HJUserViewModel.dart';
import 'package:flutter_learn/StateTest/Provider/ProviderManager.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/**
 * 1.创建自己需要共享的数据
 * 2.在应用程序的顶层ChangeNotifierProvider
 * 3.在其它位置使用共享的数据
 *  > Provider.of: 当Provider中的数据发生改变时, Provider.of所在的Widget整个build方法都会重新构建
 *  > Consumer(相对推荐): 当Provider中的数据发生改变时, 执行重新执行Consumer的builder
 *  > Selector: 1.selector方法(作用,对原有的数据进行转换) 2.shouldRebuild(作用,要不要重新构建)
 */

void main() {
  // runApp(
  //   ChangeNotifierProvider(create: (ctx) {
  //     return HJCounterViewModel();
  //   },child: MyApp(),));

  /// 多个provider
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HJStateTestPage(),
    );
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
        title: Text('Provider状态管理'),
      ),
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [HJShowData1(), HJShowData2(),HJShowData3()],
            ),
          ),
      /// 通过Consumer 使用共享数据
      // floatingActionButton: Consumer<HJCounterViewModel>(
      //   builder: (ctx, counterVM, child){
      //       return FloatingActionButton(
      //         child: Icon(Icons.data_usage),
      //         onPressed: (){
      //             counterVM.counter += 1;
      //         },
      //       );
      //   },
      // ),
      floatingActionButton: Selector<HJCounterViewModel,HJCounterViewModel>(
        selector: (ctx, counterVM)=>counterVM,
        shouldRebuild: (pre, next)=>false,/// 是否重新build
        builder: (ctx, counterVM, child){
          HJLog('builder ', StackTrace.current);
          return FloatingActionButton(
            child: Icon(Icons.data_usage),
            onPressed: (){
              counterVM.counter += 1;
            },
          );
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
  @override
  Widget build(BuildContext context) {
    HJLog('HJShowData1 build方法', StackTrace.current);
    return Card(
      color: Colors.blue,
      child: Text('当前计数：100',style: TextStyle(fontSize: 20),),
    );
  }
}

class HJShowData2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    /// 使用共享数据
    ///int counter = Provider.of<HJCounterViewModel>(context).counter;
    HJLog('HJShowData2 build方法', StackTrace.current);
    // TODO: implement build
    return Container(
      //child: Text('当前计数：$counter',style: TextStyle(fontSize: 20)),
      child: Consumer<HJCounterViewModel>(
        builder: (ctx, counterVM, child){
          HJLog('Consumer builder', StackTrace.current);
          return Text('当前计数：${counterVM.counter}',style: TextStyle(fontSize: 20));
        },
      ),
      color: Colors.amberAccent,
    );
  }
}

class HJShowData3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Consumer<HJCounterViewModel>(builder: (ctx, counterVM, child){
        return Text('当前计数：${counterVM.counter}',style: TextStyle(fontSize: 20,color: Colors.green),);
      }),
      Consumer2<HJUserViewModel,HJCounterViewModel>(builder: (ctx, userVM, counterVM, child){
        return Text(
              '当前计数：${counterVM.counter} - name:${userVM.user.name} age:${userVM.user.age} height:${userVM.user.height}',
              style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent),
              maxLines: 5,
            );
      })
    ],);
  }
}