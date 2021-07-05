
import 'package:favorcate/Module/Filter/Model/HJFilterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/Utils/HJSizeFitUtil.dart';
import 'package:provider/provider.dart';

class HJFilterPage extends StatelessWidget {
  const HJFilterPage({Key? key}) : super(key: key);

  static const String routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食过滤'),
      ),
      body: HJFilterPageContent(),
    );
  }
}


class HJFilterPageContent extends StatelessWidget {
  const HJFilterPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitle(context),
        buildChoiceSelect()
      ],
    );
  }

  Widget buildChoiceSelect() {
    return Expanded(
      child: Consumer<HJFilterViewModel>(
        builder: (ctx, filterVM, child){
          return ListView(
            children: [
              buildListTile('无谷蛋白','展示无谷蛋白食物',filterVM.isGlutenFree,(value){
                filterVM.isGlutenFree = value;
              }),
              buildListTile('不含乳糖','展示不含乳糖食物',filterVM.isLactoseFree,(value){
                filterVM.isLactoseFree = value;
              }),
              buildListTile('素食主义','展示素食主义食物',filterVM.isVegetarian,(value){
                filterVM.isVegetarian = value;
              }),
              buildListTile('严格素食主义','展示严格素食主义食物',filterVM.isVegan,(value){
                filterVM.isVegan = value;
              }),
            ],
          );
        },
      ),
    );
  }

  ListTile buildListTile(String title, String subTitle, bool isOn, ValueChanged onChanged) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(
        value: isOn,
        onChanged: onChanged,
      ),
    );
  }

  Container buildTitle(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.hj_px),
        alignment: Alignment.center,
        child: Text('展示你的选择',style: Theme.of(context).textTheme.headline3?.copyWith(fontWeight: FontWeight.bold),),
      );
  }
}
