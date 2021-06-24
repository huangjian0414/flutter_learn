


import 'package:flutter/cupertino.dart';

class HJUserViewModel extends ChangeNotifier {
  UserInfo _user;

  HJUserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }
}

class UserInfo {
  String name;
  int age;
  double height;

  UserInfo(this.name, this.age, this.height);
}