

import 'package:favorcate/Module/Collect/Model/HJCollectViewModel.dart';
import 'package:favorcate/Module/Meal/Pages/HJMealPageItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HJCollectPage extends StatefulWidget {

  @override
  _HJCollectPageState createState() => _HJCollectPageState();
}

class _HJCollectPageState extends State<HJCollectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('我的收藏'),
          ),
          body: HJCollectContent(),
        );
  }
}


class HJCollectContent extends StatelessWidget {
  const HJCollectContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HJCollectViewModel>(
      builder: (ctx, collectVM, child) {
        print('builderHJCollectContent - ${collectVM.collectMeals}');
        if (collectVM.collectMeals.isEmpty) {
          return Center(
            child: Text('未收藏美食'),
          );
        }
        return ListView.builder(
            itemCount: collectVM.collectMeals.length,
            itemBuilder: (ctx, index) {
              return HJMealPageItem(collectVM.collectMeals[index]);
            });
      },
    );
  }
}
