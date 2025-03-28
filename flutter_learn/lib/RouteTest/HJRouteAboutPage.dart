
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HJRouteAboutPage extends StatelessWidget {

  static const String routeName = '/hjabout';

  @override
  Widget build(BuildContext context) {
    /// 拿到命名路由传递的参数
    final _msg = ModalRoute.of(context)?.settings.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text('关于页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_msg'),
            CupertinoButton(child: Text('返回'), onPressed: (){
              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }
}
