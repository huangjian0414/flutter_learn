
import 'package:favorcate/Module/Meal/Model/HJMealModel.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/Utils/HJSizeFitUtil.dart';

class HJMealDetailPage extends StatelessWidget {
  static const String routeName = '/meal_detail';

  @override
  Widget build(BuildContext context) {
    //获取传递的参数
    final model = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: HJMealDetailContent(model),
    );
  }
}

class HJMealDetailContent extends StatelessWidget {

  final Meal _meal;
  HJMealDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildTitle('制作材料', context),
          buildMakeMaterial(context),
          buildTitle('制作步骤', context),
          buildMakeSteps(),
          SizedBox(height: 10.hj_px,)
        ],
      ),
    );
  }

  Widget buildBannerImage(){
    return Container(
      child: Image.network(_meal.imageUrl,fit: BoxFit.cover,width: double.infinity,height: 250.hj_px,),
    );
  }

  /// 制作材料
  Widget buildMakeMaterial(BuildContext ctx) {
    return buildContainer(ListView.builder(
      itemCount: _meal.ingredients.length,
      ///true 内容多高，listview就是多高
      shrinkWrap: true,
      /// 不进行滚动
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
        return Card(
          color: Colors.orange,
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: 5.hj_px, horizontal: 10.hj_px),
            child: Text(_meal.ingredients[index]),
          ),
        );
      },
    ));
  }
  ///制作步骤
  Widget buildMakeSteps(){
    return buildContainer(
      ListView.separated(
        itemCount: _meal.steps.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (ctx, index){
          return Divider(indent: 20.hj_px,endIndent: 20.hj_px,);
        },
        itemBuilder: (ctx, index){
          return ListTile(
            title: Text(_meal.steps[index]),
            leading: CircleAvatar(
              child: Text('#${index+1}'),
            ),
          );
        },
      )
    );
  }

  ///公共标题
  Widget buildTitle(String title, BuildContext ctx){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.hj_px),
      child: Text(title,style: Theme.of(ctx).textTheme.headline2?.copyWith(
        fontWeight: FontWeight.bold
      ),),
    );
  }
  ///公共Container
  Widget buildContainer(Widget child){
    return Container(
      padding: EdgeInsets.all(8.hj_px),
      width: HJSizeFitUtil.screenWidth-30.hj_px,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.hj_px)
      ),
      child: child,
    );
  }
}
