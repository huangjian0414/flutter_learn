


import 'package:flutter/material.dart';

/// 1.创建自己需要共享的数据
/// 快捷键，选中类，cmd+n 自动生成get,set方法
class HJCounterViewModel extends ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}