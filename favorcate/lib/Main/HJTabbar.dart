import 'package:favorcate/Base/Config/HJRouter.dart';
import 'package:favorcate/Module/Collect/Pages/HJCollectPage.dart';
import 'package:favorcate/Module/Home/Pages/HJHomePage.dart';
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
    HJCollectPage(),
  ];
  static List<BottomNavigationBarItem> _barItems = [];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_barItems.isEmpty) {
      _barItems = getBarItems(context);
    }
    // return CupertinoTabScaffold(
    //     tabBar: CupertinoTabBar(
    //       items: _barItems,
    //     ),
    //     tabBuilder: (content, index) {
    //       return CupertinoTabView(
    //           // ///Cupertino也需要设置路由
    //           // routes: HJRouter.cupertinoRouters,
    //           builder: (content) {
    //         return _pages[index];
    //       });
    //     });
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _barItems,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
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
