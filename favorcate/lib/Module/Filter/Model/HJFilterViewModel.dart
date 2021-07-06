

import 'package:favorcate/Base/Manager/HJUserDefaultManager.dart';
import 'package:favorcate/Const/AppConst.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HJFilterViewModel extends ChangeNotifier{

  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  bool get isGlutenFree => _isGlutenFree;

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    HJUserDefaultManager.saveBool(AppConst.isGlutenFree, value);
    notifyListeners();
  }

  bool get isLactoseFree => _isLactoseFree;

  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    HJUserDefaultManager.saveBool(AppConst.isLactoseFree, value);
    notifyListeners();
  }

  bool get isVegetarian => _isVegetarian;

  set isVegetarian(bool value) {
    _isVegetarian = value;
    HJUserDefaultManager.saveBool(AppConst.isVegetarian, value);
    notifyListeners();
  }

  bool get isVegan => _isVegan;

  set isVegan(bool value) {
    _isVegan = value;
    HJUserDefaultManager.saveBool(AppConst.isVegan, value);
    notifyListeners();
  }

  HJFilterViewModel(){
    HJUserDefaultManager.getBoolValue(AppConst.isGlutenFree).then((value) {
      if (value != null) {
        _isGlutenFree = value;
      }
    });
    HJUserDefaultManager.getBoolValue(AppConst.isLactoseFree).then((value) {
      if (value != null) {
        isLactoseFree = value;
      }
    });
    HJUserDefaultManager.getBoolValue(AppConst.isVegetarian).then((value) {
      if (value != null) {
        isVegetarian = value;
      }
    });
    HJUserDefaultManager.getBoolValue(AppConst.isVegan).then((value) {
      if (value != null) {
        isVegan = value;
      }
    });
  }
}