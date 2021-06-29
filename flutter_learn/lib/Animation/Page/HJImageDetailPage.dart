
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HJImageDetailPage extends StatelessWidget {
  final String _imgUrl;

  HJImageDetailPage(this._imgUrl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Hero(tag: _imgUrl,child: Image.network(_imgUrl),),
        ),
      ),
      onTap: (){
        Navigator.of(context).pop();
      },
    );
  }
}
