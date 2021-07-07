import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HJLocalManager {

  final Locale local;
  HJLocalManager(this.local);

  static Map<String,Map<String,String>> _localValues = {
    // "en": {
    //   "title": "home",
    //   "text": "Tap",
    //   "btnText": "Pick a Time"
    // },
    // "zh": {
    //   "title": "首页",
    //   "text": "点击",
    //   "btnText": "选择一个时间"
    // }
  };

  /// 异步加载json文件
  Future<bool> loadLocalValues() async {
    final jsonStr = await rootBundle.loadString('assets/json/localValues.json');

    /// json -> map
    Map<String,dynamic> result = json.decode(jsonStr);
    /// 遍历每个键值对
    _localValues = result.map((key, value) {
      // 将Map<String, dynamic>转成Map<String, Map<String, String>>类型
      return MapEntry(key, value.cast<String,String>());
    });
    return true;
  }

  String? get title {
    return _localValues[local.languageCode]?['title'];
  }
  String? get text {
    return _localValues[local.languageCode]?['text'];
  }
  String? get btnText {
    return _localValues[local.languageCode]?['btnText'];
  }

  /// 优化方法
  static HJLocalManager of(BuildContext context) {
    return Localizations.of(context, HJLocalManager);
  }
}