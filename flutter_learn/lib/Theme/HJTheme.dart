

import 'package:flutter/material.dart';

import 'HJMaterialColorUtil.dart';

class HJTheme{

  static final ThemeData normal = ThemeData(
    // 1.亮度
      brightness: Brightness.light,
      // 2.primarySwatch传入不是Color, 而是MaterialColor(包含了primaryColor和accentColor)
      primarySwatch: createMaterialColor(Color(0xFF1E90FF)),
      // 3.primaryColor: 单独设置导航和TabBar的颜色
      primaryColor: Colors.orange,
      // 4.accentColor: 单独设置FloatingActionButton\Switch
      // accentColor: Colors.blue,
      // 5.Button的主题
      buttonTheme: ButtonThemeData(
          height: 25,
          minWidth: 10,
          buttonColor: Colors.yellow
      ),
      // 6.Card的主题
      cardTheme: CardTheme(
          color: Colors.greenAccent,
          elevation: 10
      ),
      // 7.Text的主题
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 16, color: Colors.teal),
        headline2: TextStyle(fontSize: 20, color: Colors.green),
        headline3: TextStyle(fontSize: 22, color: Colors.pink),
        headline4: TextStyle(fontSize: 24, color: Colors.black),
        headline5: TextStyle(fontSize: 26, color: Colors.brown),
        headline6: TextStyle(fontSize: 28, color: Colors.purple),
        subtitle1: TextStyle(fontSize: 14, color: Colors.deepPurpleAccent),
        subtitle2: TextStyle(fontSize: 16, color: Colors.blue),
        bodyText1: TextStyle(fontSize: 18, color: Colors.lightBlueAccent),
        /// 默认使用
        bodyText2: TextStyle(fontSize: 20, color: Colors.red),
      )
  );

  static final ThemeData dark = ThemeData(
    primarySwatch: Colors.grey,
    // 3.primaryColor: 单独设置导航和TabBar的颜色
    primaryColor: Colors.blueGrey,
    // 4.accentColor: 单独设置FloatingActionButton\Switch
    // accentColor: Colors.deepPurple,
    // 5.Button的主题
    buttonTheme: ButtonThemeData(
        height: 25,
        minWidth: 10,
        buttonColor: Colors.grey
    ),
    // 6.Card的主题
    cardTheme: CardTheme(
        color: Colors.lightGreen,
        elevation: 10
    ),
  );
}