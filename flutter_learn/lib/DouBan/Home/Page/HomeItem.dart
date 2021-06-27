import 'package:flutter/material.dart';
import 'package:flutter_learn/DouBan/Home/Model/HomeModel.dart';
import 'package:flutter_learn/DouBan/Home/Page/HJRatingStar.dart';
import 'package:flutter_learn/DouBan/Home/Page/HJDashLine.dart';
import 'package:flutter_learn/DouBan/Base/HJToast.dart';

class HJHomeItem extends StatelessWidget {
  final HomeModel model;

  HJHomeItem(this.model);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 8, color: Color(0xfff2f2f2)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          SizedBox(height: 8),
          buildMiddle(),
          SizedBox(height: 8),
          buildFooter()],
      ),
    );
  }

  /// 头部No. 排名
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        'No.${model.rank}',
        style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  ///中间部分
  Widget buildMiddle(){

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildMiddleImage(),
        SizedBox(
          width: 8,
        ),
        Expanded(child: IntrinsicHeight(///高度一样
          child: Row(
            children: [
              buildMiddelInfo(),
              SizedBox(
                width: 8,
              ),
              buildMiddleInfoDashLine(),
              SizedBox(
                width: 8,
              ),
              buildMiddleInfoWish()
            ],
          ),
        ))
      ],
    );
  }
  /// 中间图片
  Widget buildMiddleImage(){
    return ClipRRect(
      borderRadius:BorderRadius.circular(8),
      child: Image(image: AssetImage('assets/images/home/${model.imageURL}.png'),height: 150,),
    );
  }
  /// 中间title
  Widget buildMiddelInfo() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildMiddelInfoTitle(),buildMiddelInfoRate(),buildMiddleInfoDesc()],
    ));
  }

  /// row不能换行 ，如果太长，gg， 所以使用span
  /// 头部名称，年份
  Widget buildMiddelInfoTitle() {
    // return Row(children: [
    //   Icon(Icons.play_circle_outline)
    // ],);
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Text.rich(TextSpan(children: [
        WidgetSpan(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.pink,
            ),
            //baseline: TextBaseline.ideographic,
            alignment: PlaceholderAlignment.middle,),
        WidgetSpan(child: SizedBox(width: 4,)),
        WidgetSpan(
            child: Text(
              model.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            alignment: PlaceholderAlignment.middle),
        WidgetSpan(child: SizedBox(width: 4,)),
        WidgetSpan(
            child: Text(
              '${model.playDate}',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            alignment: PlaceholderAlignment.middle)
      ])),
    );
  }
  /// 评分
  Widget buildMiddelInfoRate(){
    return FittedBox(/// 防止尺寸越界
      child: Row(
        children: [
          HJRatingStar(rating: model.rating,size: 20,selectedColor: Color.fromARGB(255, 254, 172, 45),),
          SizedBox(width: 6),
          Text('${model.rating}', style: TextStyle(fontSize: 16),)
        ],
      ),
    );
  }
  /// 简介
  Widget buildMiddleInfoDesc(){
    final String text = '${model.type} / ${model.director} / ${model.actor}';

    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }
  /// 中间 竖着的虚线
  Widget buildMiddleInfoDashLine(){

    return Container(
      padding: EdgeInsets.only(top: 10),
      //height: 100,
      child: HJDashLine(
        axis: Axis.vertical,
        dashWidth: 1,
        dashHeight: 6,
        count: 10,
        color: Colors.grey,
      ),
    );
  }
  /// 想看
  Widget buildMiddleInfoWish() {
    return GestureDetector(
      child: Container(
        //height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/home/wish.png'),
              width: 30,
            ),
            Text(
              '想看',
              style: TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 254, 172, 45)),
            ),

          ],
        ),
      ),
      onTap: (){
        HJToast.showMsg('别点了，你不想看!!');
      },
    );
  }

  Widget buildFooter(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(6)
      ),
      child: Text(
          model.originalTitle,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff666666)
          ),
      ),
    );
  }
}
