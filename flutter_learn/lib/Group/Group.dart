import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HJGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
        child: Center(
          child: Text('小组'),
        ),
        navigationBar: CupertinoNavigationBar(
          middle: Text('小租'),
        ));
  }
}
