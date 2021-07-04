import 'package:favorcate/Module/Home/Model/HJHomeModel.dart';
import 'package:favorcate/Module/Meal/Model/HJMealModel.dart';
import 'package:favorcate/Module/Meal/Model/HJMealViewModel.dart';
import 'package:favorcate/Module/Meal/Pages/HJMealPageItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

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
      body: HJMealContent(),
    );
  }
}

class HJMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取传递的参数
    final model = ModalRoute.of(context)?.settings.arguments as HJHomeModel;

    return Selector<HJMealViewModel,List<Meal>?>(
      selector: (ctx, mealVM) {
        return mealVM.mealModel?.meal
            .where((element) => element.categories.contains(model.id))
            .toList();
      },
      shouldRebuild: (pre, next) => !ListEquality().equals(pre, next),
      builder: (ctx, meals, child){
        if (meals == null) {
          return Center(
            child: Text('数据请求中'),
          );
        } else {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return HJMealPageItem(meals[index]);
            },
            itemCount: meals.length,
          );
        }
      },
    );
  }
}


class MealConsumer extends StatelessWidget {
  const MealConsumer({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HJHomeModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer<HJMealViewModel>(builder: (ctx, mealVM, child) {

      final meals = mealVM.mealModel?.meal
          .where((element) => element.categories.contains(model.id))
          .toList();
      if (meals == null) {
        return Center(
          child: Text('数据请求中'),
        );
      } else {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(meals[index].title);
          },
          itemCount: meals.length,
        );
      }
    });
  }
}
