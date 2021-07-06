
import 'package:favorcate/Module/Meal/Model/HJMealViewModel.dart';
import 'package:favorcate/Utils/LogUtils.dart';
import 'package:favorcate/Base/Manager/HJUserDefaultManager.dart';
import 'package:favorcate/Module/Filter/Model/HJFilterViewModel.dart';
import 'package:favorcate/Module/Meal/Model/HJMealModel.dart';
import 'package:flutter/material.dart';

class HJCollectViewModel extends ChangeNotifier{
  List<Meal> _collectMeals = [];
  HJFilterViewModel? _filterVM;
  HJMealViewModel? _mealsVM;

  ///原数据
  List<Meal>? _origMeals;

  List<String> ids = [];

  List<Meal> get collectMeals {

    if (_mealsVM!=null) {
      final collects = _mealsVM!.mealModel?.meal.where((element) {
        if (!ids.contains(element.id)) {
          return false;
        }
        return true;
      }).toList();
      if (collects != null) {
        _collectMeals = collects;
        _origMeals = collects;
      }
    }

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
    if (!ids.contains(meal.id)) {
      ids.add(meal.id);
      HJUserDefaultManager.saveStrList('key', ids);
    }
    notifyListeners();
  }

  void removeMeal(Meal meal){
    _collectMeals.remove(meal);
    _origMeals = _collectMeals;
    if (ids.contains(meal.id)) {
      ids.remove(meal.id);
      HJUserDefaultManager.saveStrList('key', ids);
    }
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
  void updateMeals(HJMealViewModel mealsVM){
    print('HJCollectViewModel updateMeals - $mealsVM');
    _mealsVM = mealsVM;
    notifyListeners();
  }

  HJCollectViewModel(){
    HJLog('HJCollectViewModel init', StackTrace.current);
    HJUserDefaultManager.getStrList('key').then((value) {
      if (value != null) {
        ids = value;
        HJLog('ids - $ids', StackTrace.current);
      }
    });
  }
}