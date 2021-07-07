import 'package:flutter/material.dart';

class HJLocalManager {

  final Locale local;
  HJLocalManager(this.local);

  static Map<String,Map<String,String>> _localValues = {
    "en": {
      "title": "home",
      "text": "Tap",
      "btnText": "Pick a Time"
    },
    "zh": {
      "title": "首页",
      "text": "点击",
      "btnText": "选择一个时间"
    }
  };

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