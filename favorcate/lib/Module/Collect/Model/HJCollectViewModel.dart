

import 'package:favorcate/Module/Meal/Model/HJMealModel.dart';
import 'package:flutter/material.dart';

class HJCollectViewModel extends ChangeNotifier{
  List<Meal> _collectMeals = [];

  List<Meal> get collectMeals => _collectMeals;

  void addMeal(Meal meal){
    _collectMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(Meal meal){
    _collectMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(Meal meal){
    if (isCollect(meal)) {
      removeMeal(meal);
    }else{
      addMeal(meal);
    }
  }

  bool isCollect(Meal meal){

    return _collectMeals.contains(meal);
  }

}