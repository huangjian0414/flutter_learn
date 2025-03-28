
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/RouteTest/HJRouteTestPage.dart';
import 'package:flutter_learn/RouteTest/HJRouteAboutPage.dart';
import 'package:flutter_learn/RouteTest/HJRouteDetailPage.dart';
import 'package:flutter_learn/RouteTest/HJRouteUnknownPage.dart';

class HJRouter {
  static final Map<String, WidgetBuilder> routers = {
    HJRouteTestPage.routeName : (ctx) => HJRouteTestPage(),
    HJRouteAboutPage.routeName: (ctx) => HJRouteAboutPage(),
  };

  static final String initialRoute = HJRouteTestPage.routeName;

  static final RouteFactory generateRoute = (settings){
    if (settings.name == HJRouteDetailPage.routeName){
      return MaterialPageRoute(builder: (ctx){
        return HJRouteDetailPage('${settings.arguments}');
      });
    }
    return null;
    // return MaterialPageRoute(builder: (ctx){
    //   return HJRouteUnknownPage();
    // });
  };
  static final RouteFactory onUnknownRoute = (settings){
    return MaterialPageRoute(builder: (ctx){
      return HJRouteUnknownPage();
    });
  };
}