
import 'package:flutter_learn/StateTest/Provider/HJCounterViewModel.dart';
import 'package:flutter_learn/StateTest/Provider/HJUserViewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => HJUserViewModel(UserInfo('hj',18,180))),
  ChangeNotifierProvider(create: (ctx) => HJCounterViewModel())
];