

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/RouteTest/HJRouteAboutPage.dart';
import 'package:flutter_learn/RouteTest/HJRouteDetailPage.dart';
import 'package:flutter_learn/RouteTest/HJRouteUnknownPage.dart';
import 'package:flutter_learn/RouteTest/HJRouter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
       // home: HJRouteTestPage(),
      ///设置应用程序从哪一个路由开始启动，设置了该属性，就不需要再设置home属性了
      initialRoute: HJRouteTestPage.routeName,
      routes: HJRouter.routers,
      ///找不到路由时调用, 跳转的界面需要参数，命名路由不太方便
      onGenerateRoute: HJRouter.generateRoute,
      /// 未找到路由，跳转统一界面
      onUnknownRoute: HJRouter.onUnknownRoute,
    );
  }
}

class HJRouteTestPage extends StatefulWidget {

  static const String routeName = '/hjroutetest';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HJRouteTestPageState();
  }
}
class _HJRouteTestPageState extends State{

  String _message = 'default message';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_message),
              CupertinoButton(
                child: Text('点击到详情页'),
                onPressed: (){
                  _jumpToDetail(context);
                },
              ),
              CupertinoButton(
                child: Text('点击到关于页'),
                onPressed: (){
                  _jumpToAbout(context);
                },
              ),
              CupertinoButton(
                child: Text('点击到详情页'),
                onPressed: (){
                  _jumpToDetail2(context);
                },
              ),
              CupertinoButton(
                child: Text('点击到设置页'),
                onPressed: (){
                  _jumpToSetting(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }


  void _jumpToDetail(BuildContext ctx){
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx){
    //   return HJEventResponsePage();
    // }));

    Future result = Navigator.push(ctx, MaterialPageRoute(builder: (ctx){
      return HJRouteDetailPage('from route test');
    }));
    result.then((value) {
      //print(value);
      setState(() {
        _message = value;
      });
    });
  }
  void _jumpToAbout(BuildContext ctx){
    Navigator.pushNamed(ctx, HJRouteAboutPage.routeName,arguments: 'from route test');
  }

  void _jumpToDetail2(BuildContext ctx){
    Navigator.pushNamed(ctx, HJRouteDetailPage.routeName,arguments: 'from toute test 2222');
  }
  void _jumpToSetting(BuildContext ctx){
    Navigator.pushNamed(ctx, '/hjsettings',arguments: 'from toute test');
  }
}

