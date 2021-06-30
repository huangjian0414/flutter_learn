
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HJRouteUnknownPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('错误页面'),
      ),
      body: Center(
        child:Text('未找到该路由页面')
      ),
    );
  }
}
