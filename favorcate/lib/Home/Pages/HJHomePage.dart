import 'package:favorcate/Home/Model/HJHomeModel.dart';
import 'package:favorcate/Home/Services/HJHomeServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/Utils/HJSizeFitUtil.dart';

class HJHomePage extends StatefulWidget {

  @override
  _HJHomePageState createState() => _HJHomePageState();
}

class _HJHomePageState extends State<HJHomePage> {
  List<HJHomeModel> _homeModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HJHomeServices.getHomeData().then((value) {
      setState(() {
        _homeModels = value;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食广场'),
      ),
      body: GridView.builder(
          itemCount: _homeModels.length,
          ///整体边距
          padding: EdgeInsets.all(20.hj_px),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // 列数
              crossAxisCount: 2,
              // 列间距
              crossAxisSpacing: 20.hj_px,
              //行间距
              mainAxisSpacing: 20.hj_px,
              //宽高比
              childAspectRatio: 1.5
          ),
          itemBuilder: (ctx, index) {

            return HJHomeItem(homeModel: _homeModels[index]);
          }),
    );
  }
}

/// 单个Item
class HJHomeItem extends StatelessWidget {
  const HJHomeItem({
    Key? key,
    required HJHomeModel homeModel,
  }) : _homeModel = homeModel, super(key: key);

  final HJHomeModel _homeModel;

  @override
  Widget build(BuildContext context) {
    final bgColor = _homeModel.cColor;

    return Container(
      decoration: BoxDecoration(
        //color: bgColor,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            bgColor.withOpacity(0.5),
            bgColor
          ]
        )
      ),
      alignment: Alignment.center,
      child: Text(
        _homeModel.title,
        style: Theme.of(context).textTheme.headline2!.copyWith(
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
