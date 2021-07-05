import 'package:favorcate/Module/Home/Model/HJHomeModel.dart';
import 'package:favorcate/Module/Home/Pages/HJHomeDrawer.dart';
import 'package:favorcate/Module/Home/Services/HJHomeServices.dart';
import 'package:favorcate/Module/Meal/Pages/HJMealPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/Utils/HJSizeFitUtil.dart';
import 'package:favorcate/Utils/LogUtils.dart';

class HJHomePage extends StatefulWidget {

  static const String routeName = '/home';

  @override
  _HJHomePageState createState() => _HJHomePageState();
}

class _HJHomePageState extends State<HJHomePage> {

  @override
  Widget build(BuildContext context) {
    HJLog('_HJHomePageState build', StackTrace.current);
    return Scaffold(
      appBar: AppBar(
        title: Text('美食广场'),
        leading: buildLeadingItem(),
      ),
      body: FutureBuilder<List<HJHomeModel>>(
        future: HJHomeServices.getHomeData(),
        builder: _buildFuture,
      ),
      drawer: HJHomeDrawer(),
    );
  }

  Builder buildLeadingItem() {
    return Builder(
        builder: (ctx){
          return IconButton(
              onPressed: (){
                Scaffold.of(ctx).openDrawer();
              },
              icon: Icon(Icons.build)
          );
        },
      );
  }

  Widget _buildFuture(ctx, snapshot){
        print(snapshot.connectionState);
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            print('还没有开始网络请求');
            return Text('还没有开始网络请求');
          case ConnectionState.active:
            print('active');
            return Text('ConnectionState.active');
          case ConnectionState.waiting:
            print('waiting');
            return Center(
              child: Text('请求数据中······'),
            );
          case ConnectionState.done:
            print('done');
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            final models = snapshot.data;
            return buildGridView(models);
          default:
            return Text('unknown');
        }
        // if (!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        // if (snapshot.hasError) return Center(child: Text("请求失败"),);
        // final models = snapshot.data;
        // return buildGridView(models!);

      }

  GridView buildGridView(List<HJHomeModel> models) {
    return GridView.builder(
        itemCount: models.length,
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

          return HJHomeItem(homeModel: models[index]);
        });
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

    return GestureDetector(
      onTap: (){
        //使用了不同的风格控件（iOS），这样跳转
        //Navigator.of(context,rootNavigator: true).pushNamed(HJMealPage.routeName,arguments: _homeModel);

        Navigator.of(context).pushNamed(HJMealPage.routeName,arguments: _homeModel);
      },
      child: Container(
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
      ),
    );
  }
}
