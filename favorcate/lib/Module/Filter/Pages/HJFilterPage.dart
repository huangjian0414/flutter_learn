
import 'package:flutter/material.dart';

class HJFilterPage extends StatelessWidget {
  const HJFilterPage({Key? key}) : super(key: key);

  static const String routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食过滤'),
      ),
      body: HJFilterPageContent(),
    );
  }
}


class HJFilterPageContent extends StatelessWidget {
  const HJFilterPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
