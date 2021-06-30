import 'package:favorcate/Base/HJFavorcateTheme.dart';
import 'package:favorcate/Base/HJRouter.dart';
import 'package:favorcate/Utils/HJSizeFitUtil.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HJSizeFitUtil.initialize();
    return MaterialApp(
      theme: HJFavorcateTheme.normal,
      darkTheme: HJFavorcateTheme.dark,
      initialRoute: HJRouter.initialRoute,
      routes: HJRouter.routers,
      onGenerateRoute: HJRouter.generateRoute,
      onUnknownRoute: HJRouter.onUnknownRoute,
    );
  }
}

