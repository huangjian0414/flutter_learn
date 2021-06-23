import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/DouBan/Home/Model/HomeModel.dart';
import 'package:flutter_learn/DouBan/Home/Page/HomeItem.dart';
import 'package:flutter_learn/DouBan/Home/Service/HomeService.dart';

class HJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return CupertinoPageScaffold(
      child: Center(
        child: HJHomePageContent(),
      ),
      navigationBar: CupertinoNavigationBar(
        middle: Text('主页'),
      ),
    );
  }
}

class HJHomePageContent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HJHomePageState();
  }
}

class _HJHomePageState extends State{

  List<HomeModel> homeList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeService.requestHomeList().then((value) => {
        setState(() {
          print(value);
          if (value != null){
            homeList = value;
          }
        })
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: ListView.builder(
        itemCount: homeList.length,
        itemBuilder: (ctx, index){
          return HJHomeItem(homeList[index]);
        })
    ,);
  }
}