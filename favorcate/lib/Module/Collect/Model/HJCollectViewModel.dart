

import 'package:favorcate/Module/Filter/Model/HJFilterViewModel.dart';
import 'package:favorcate/Module/Meal/Model/HJMealModel.dart';
import 'package:flutter/material.dart';

class HJCollectViewModel extends ChangeNotifier{
  List<Meal> _collectMeals = [];
  HJFilterViewModel? _filterVM;

  ///原数据
  List<Meal>? _origMeals;

  List<Meal> get collectMeals {

    if (_origMeals != null) {
      final origModels = _origMeals;
      final newMeals = origModels?.where((element) {
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
        _collectMeals = newMeals;
      }
    }

    return _collectMeals;
  }

  void addMeal(Meal meal){
    _collectMeals.add(meal);
    _origMeals = _collectMeals;
    notifyListeners();
  }

  void removeMeal(Meal meal){
    _collectMeals.remove(meal);
    _origMeals = _collectMeals;
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

  void updateFilters(HJFilterViewModel filterVM){
    print('HJCollectViewModel updateFilters - $filterVM');
    _filterVM = filterVM;
    notifyListeners();
  }

}