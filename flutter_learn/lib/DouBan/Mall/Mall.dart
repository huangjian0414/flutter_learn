import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HJMallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      child: Center(
        child: Text('市集'),
      ),
      navigationBar: CupertinoNavigationBar(
        middle: Text('市集'),
      ),
    );
  }
}
