

import 'package:favorcate/Module/Meal/Model/HJMealModel.dart';
import 'package:favorcate/Module/Meal/Service/HJMealService.dart';
import 'package:flutter/cupertino.dart';

class HJMealViewModel extends ChangeNotifier{

  HJMealModel? _mealModel;

  HJMealModel? get mealModel => _mealModel;

  HJMealViewModel(){
    HJMealService.getMealData().then((value) {
      _mealModel = value;
      notifyListeners();
    });
  }

}