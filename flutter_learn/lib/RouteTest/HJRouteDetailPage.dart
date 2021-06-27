


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HJRouteDetailPage extends StatelessWidget {
  static const String routeName = '/hjdetail';

  String _msg;

  HJRouteDetailPage(this._msg);

  @override
  Widget build(BuildContext context) {
    //return buildScaffold(context);
    return WillPopScope(child: buildScaffold(context), onWillPop: (){
      Navigator.of(context).pop('from detail');
      /// ture flutter帮我们返回, false 自己写返回代码
      return Future.value(false);
    });
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('详情页'),
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back_ios_outlined),
      //   onPressed: (){
      //     Navigator.of(context).pop('from detail');
      //   },
      // ),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_msg),
          CupertinoButton(
            child: Text('返回'),
            onPressed: (){
              Navigator.of(context).pop('from detail');
            },
          ),
        ],
      )
    ),
  );
  }
}
