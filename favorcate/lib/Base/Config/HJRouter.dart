
import 'package:favorcate/Main/HJTabbar.dart';
import 'package:favorcate/Module/Detail/Pages/HJMealDetailPage.dart';
import 'package:favorcate/Module/Filter/Pages/HJFilterPage.dart';
import 'package:favorcate/Module/Home/Model/HJHomeModel.dart';
import 'package:favorcate/Module/Home/Pages/HJHomePage.dart';
import 'package:favorcate/Module/Meal/Pages/HJMealPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:favorcate/Base/Config/HJRouteUnknownPage.dart';

class HJRouter {
  static final Map<String, WidgetBuilder> routers = {
    HJTabBar.routeName: (ctx) => HJTabBar(),
    HJMealPage.routeName: (ctx) => HJMealPage(),
    HJMealDetailPage.routeName: (ctx) => HJMealDetailPage()
  };
  // static final Map<String, WidgetBuilder> cupertinoRouters = {
  //   HJMealPage.routeName: (ctx) => HJMealPage()
  // };

  static final String initialRoute = HJTabBar.routeName;

  static final RouteFactory generateRoute = (settings){
    if (settings.name == HJFilterPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return HJFilterPage();
          },
          /// 全屏模态视图弹出
          fullscreenDialog: true);
    }

    return MaterialPageRoute(builder: (ctx){
      return HJRouteUnknownPage();
    });
  };
  static final RouteFactory onUnknownRoute = (settings){
    return MaterialPageRoute(builder: (ctx){
      return HJRouteUnknownPage();
    });
  };
}