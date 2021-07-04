
import 'package:favorcate/Module/Detail/Pages/HJMealDetailPage.dart';
import 'package:favorcate/Module/Meal/Model/HJMealModel.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/Utils/HJSizeFitUtil.dart';

class HJMealPageItem extends StatelessWidget {

  final Meal _meal;
  HJMealPageItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(8.hj_px),
        //阴影偏移
        elevation: 5,
        //圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.hj_px)),
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperationInfo()
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(HJMealDetailPage.routeName, arguments: _meal);
      },
    );
  }
  Widget buildBasicInfo(BuildContext ctx){
    return Stack(
      children: [
        ClipRRect(
          child: Image.network(_meal.imageUrl,width: double.infinity,height: 250.hj_px,fit: BoxFit.cover,),
          borderRadius: BorderRadius.only(//局部圆角
            topLeft: Radius.circular(12.hj_px),
            topRight: Radius.circular(12.hj_px)
          )
        ),
        Positioned(
          right: 10.hj_px,
          bottom: 10.hj_px,
          child: Container(
            width: 300.hj_px,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.hj_px)
            ),
            child: Text(_meal.title,style:Theme.of(ctx).textTheme.headline2?.copyWith(color: Colors.white),),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo(){
    return Padding(
      padding: EdgeInsets.all(16.hj_px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HJMealOperationItem(Icon(Icons.schedule),'${_meal.duration}分钟'),
          HJMealOperationItem(Icon(Icons.restaurant),'${_meal.complexityStr}'),
          HJMealOperationItem(Icon(Icons.favorite),'未收藏')
        ],
      ),
    );
  }

}

class HJMealOperationItem extends StatelessWidget {

  final Widget _icon;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon,
        SizedBox(width: 3.hj_px,),
        Text(_title)
      ],
    );
  }

  HJMealOperationItem(this._icon, this._title);
}
