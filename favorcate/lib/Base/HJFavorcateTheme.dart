

import 'package:flutter/material.dart';

class HJFavorcateTheme{
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;

  static final Color norTextColors = Colors.red;

  static final ThemeData normal = ThemeData(
      primarySwatch: Colors.pink,
      canvasColor: Color.fromRGBO(255, 254, 222, 1),
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: bodyFontSize),
        headline1: TextStyle(fontSize: smallFontSize, color: Colors.black87),
        headline2: TextStyle(fontSize: normalFontSize, color: Colors.black87),
        headline3: TextStyle(fontSize: largeFontSize, color: Colors.black87),
      ));

  static final ThemeData dark = ThemeData(
      primarySwatch: Colors.pink,
      canvasColor: Color.fromRGBO(255, 254, 222, 1),
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: bodyFontSize),
        headline1: TextStyle(fontSize: smallFontSize, color: Colors.black87),
        headline2: TextStyle(fontSize: normalFontSize, color: Colors.black87),
        headline3: TextStyle(fontSize: largeFontSize, color: Colors.black87),
      ));
}