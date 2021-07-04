
import 'package:favorcate/Module/Meal/Model/HJMealModel.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Text(model.title),
      ),
    );
  }
}