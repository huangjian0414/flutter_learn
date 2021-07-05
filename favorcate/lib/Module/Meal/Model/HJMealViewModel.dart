

import 'package:favorcate/Module/Filter/Model/HJFilterViewModel.dart';
import 'package:favorcate/Module/Meal/Model/HJMealModel.dart';
import 'package:favorcate/Module/Meal/Service/HJMealService.dart';
import 'package:flutter/cupertino.dart';

class HJMealViewModel extends ChangeNotifier{

  HJMealModel? _mealModel;

  HJFilterViewModel? _filterVM;

  HJMealModel? get mealModel {
    if (_mealModel != null) {
      final newMeals = _mealModel?.meal.where((element) {
        if (_filterVM != null) {
          if (_filterVM!.isGlutenFree&&!element.isGlutenFree) {
            return false;
          }
          if (_filterVM!.isLactoseFree&&!element.isLactoseFree) {
            return false;
          }
          if (_filterVM!.isVegetarian&&!element.isVegetarian) {
            return false;
          }
          if (_filterVM!.isVegan&&!element.isVegan) {
            return false;
          }
        }
        return true;
      }).toList();
      if (newMeals != null) {
        _mealModel?.meal = newMeals;
      }
    }
    return _mealModel;
  }
  void updateFilters(HJFilterViewModel filterVM){
    _filterVM = filterVM;
  }

  HJMealViewModel(){
    HJMealService.getMealData().then((value) {
      _mealModel = value;
      notifyListeners();
    });
  }




}