
import 'package:flutter/material.dart';
import 'package:favorcate/Utils/HJSizeFitUtil.dart';

class HJHomeDrawer extends StatelessWidget {
  const HJHomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.hj_px,
      color: Theme.of(context).canvasColor,
      child: Drawer(
        child: Column(
          children: [
            buildHeader(context),
            buildListTile(context,Icon(Icons.restaurant),'进餐',(){
              Navigator.of(context).pop();
            }),
            buildListTile(context,Icon(Icons.settings),'过滤',(){

            }),
          ],
        ),
      ),

    );
  }

  ListTile buildListTile(BuildContext context, Widget icon,String title, GestureTapCallback handler) {
    return ListTile(
            leading: icon,
            title: Text(title,style: Theme.of(context).textTheme.headline2,),
            onTap: handler,
          );
  }

  Container buildHeader(BuildContext context) {
    return Container(
            width: double.infinity,
            color: Color(0xFFFFC107),
            height: 100.hj_px,
            alignment: Alignment(0,0.5),
            child: Text('开始助手',style: Theme.of(context).textTheme.headline3,),
          );
  }
}
