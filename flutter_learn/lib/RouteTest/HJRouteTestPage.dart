

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/RouteTest/HJRouteDetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: HJRouteTestPage(),
    );
  }
}

class HJRouteTestPage extends StatefulWidget {

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
                child: Text('点击跳转'),
                onPressed: (){
                  _jumpToDetail(context);
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
}

