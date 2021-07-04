import 'package:favorcate/Base/Config/HJFavorcateTheme.dart';
import 'package:favorcate/Base/Config/HJRouter.dart';
import 'package:favorcate/Utils/HJSizeFitUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:favorcate/Base/Manager/HJProviderManager.dart';

void main() {
  runApp(MultiProvider(
      providers: providers,
      child: MyApp(),
  ));
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

