import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HJMinePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      child: Center(
        child: Text('我的'),
      ),
      navigationBar: CupertinoNavigationBar(
        middle: Text('我的'),
      ),
    );
  }
}