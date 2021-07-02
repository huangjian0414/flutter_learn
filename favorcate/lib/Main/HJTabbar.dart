import 'package:favorcate/Collect/Pages/HJCollectPage.dart';
import 'package:favorcate/Home/Pages/HJHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HJTabBar extends StatefulWidget {
  static const String routeName = "/";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HJTabbarStatus();
  }
}

class _HJTabbarStatus extends State {
  static List<Widget> _pages = [
    HJHomePage(),
    HJCollectPage()
  ];
  static List<BottomNavigationBarItem> _barItems = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_barItems.isEmpty) {
      _barItems = getBarItems(context);
    }
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: _barItems,
        ),
        tabBuilder: (content, index) {
          return CupertinoTabView(
              builder: (content) {
            return _pages[index];
          });
        });
  }

  /// tabbar
  List<BottomNavigationBarItem> getBarItems(BuildContext ctx) {
    var items = [
      {'icon': 'home', 'title': '首页'},
      {'icon': 'group', 'title': '收藏'},
    ];
    List<BottomNavigationBarItem> barItems = [];
    for (var item in items) {
      barItems.add(HJTabbarItem(item['icon']??'', item['title']??'',ctx));
    }
    return barItems;
  }

}

/// TabbarItem封装
class HJTabbarItem extends BottomNavigationBarItem {
  HJTabbarItem(String iconName, String title,BuildContext ctx)
      : super(
          label: title,
          icon: Image(
            image: AssetImage("assets/images/tabbar/$iconName.png"),
            width: 28,
            color: Colors.grey,
          ),
          activeIcon: Image(
            image: AssetImage("assets/images/tabbar/${iconName}_active.png"),
            width: 28,
            color: Theme.of(ctx).primaryColor,
          ),
        );
}
