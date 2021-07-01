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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: getBarItems(context),
        ),
        tabBuilder: (content, index) {
          return CupertinoTabView(builder: (content) {
            List<Widget> pages = getPages();
            return pages[index];
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

  /// tabbar page
  List<Widget> getPages() {
    List<Widget> pages = [
      HJHomePage(),
      HJCollectPage()
    ];
    return pages;
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
