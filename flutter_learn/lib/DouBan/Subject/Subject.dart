import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HJSubjectPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      child: Center(
        child: Text('书影音'),
      ),
      navigationBar: CupertinoNavigationBar(
        middle: Text('书影音'),
      ),
    );
  }
}