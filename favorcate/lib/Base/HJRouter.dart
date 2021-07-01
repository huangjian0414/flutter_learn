
import 'package:favorcate/Main/HJTabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:favorcate/Base/HJRouteUnknownPage.dart';

class HJRouter {
  static final Map<String, WidgetBuilder> routers = {
    HJTabBar.routeName: (ctx) => HJTabBar()
  };

  static final String initialRoute = HJTabBar.routeName;

  static final RouteFactory generateRoute = (settings){
    // if (settings.name == HJRouteDetailPage.routeName){
    //   return MaterialPageRoute(builder: (ctx){
    //     return HJRouteDetailPage(settings.arguments);
    //   });
    // }
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