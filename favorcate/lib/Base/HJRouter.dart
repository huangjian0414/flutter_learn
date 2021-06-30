
import 'package:favorcate/Main/HJMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:favorcate/Base/HJRouteUnknownPage.dart';

class HJRouter {
  static final Map<String, WidgetBuilder> routers = {
    HJMainScreen.routeName: (ctx) => HJMainScreen()
  };

  static final String initialRoute = HJMainScreen.routeName;

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