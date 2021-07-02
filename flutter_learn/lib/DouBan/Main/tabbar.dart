import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/DouBan/Home/Page/Home.dart';
import 'package:flutter_learn/DouBan/Group/Group.dart';
import 'package:flutter_learn/DouBan/Mall/Mall.dart';
import 'package:flutter_learn/DouBan/Mine/Mine.dart';
import 'package:flutter_learn/DouBan/Subject/Subject.dart';

class HJTabBar extends StatefulWidget {
  /// tabbar page
  List<Widget> pages = [
    HJHomePage(),
    HJSubjectPage(),
    HJGroupPage(),
    HJMallPage(),
    HJMinePage()
  ];
  List<BottomNavigationBarItem> _barItems ;

  List<BottomNavigationBarItem> get barItems {
    if (_barItems.isNotEmpty) {
      return _barItems;
    }
    return getBarItems();
  }

  List<BottomNavigationBarItem> getBarItems() {
    var items = [
      {'icon': 'home', 'title': '首页'},
      {'icon': 'subject', 'title': '书影音'},
      {'icon': 'group', 'title': '小组'},
      {'icon': 'mall', 'title': '市集'},
      {'icon': 'profile', 'title': '我的'}
    ];
    List<BottomNavigationBarItem> barItems = [];
    for (var item in items) {
      barItems.add(HJTabbarItem(item['icon'], item['title']));
    }
    return barItems;
  }


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HJTabbarStatus();
  }


}

class _HJTabbarStatus extends State<HJTabBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: this.widget.barItems,
          activeColor: Colors.green,
          inactiveColor: Colors.grey,
        ),
        tabBuilder: (content, index) {
          return CupertinoTabView(builder: (content) {

            return this.widget.pages[index];
          });
        });
  }

}

/// TabbarItem封装
class HJTabbarItem extends BottomNavigationBarItem {
  HJTabbarItem(String iconName, String title)
      : super(
          label: title,
          icon: Image(
            image: AssetImage("assets/images/tabbar/$iconName.png"),
            width: 32,
          ),
          activeIcon: Image(
            image: AssetImage("assets/images/tabbar/${iconName}_active.png"),
            width: 32,
          ),
        );
}
