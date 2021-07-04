
import 'package:favorcate/Module/Home/Model/HJHomeModel.dart';
import 'package:flutter/material.dart';

class HJMealPage extends StatelessWidget {
  static const String routeName = '/meal';

  @override
  Widget build(BuildContext context) {
    //获取传递的参数
    final model = ModalRoute.of(context)?.settings.arguments as HJHomeModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: Text(''),
    );
  }
}
