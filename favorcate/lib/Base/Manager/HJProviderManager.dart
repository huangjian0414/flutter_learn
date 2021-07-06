import 'package:favorcate/Module/Collect/Model/HJCollectViewModel.dart';
import 'package:favorcate/Module/Filter/Model/HJFilterViewModel.dart';
import 'package:favorcate/Module/Meal/Model/HJMealViewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providers = [
  // ChangeNotifierProvider(create: (ctx) => HJMealViewModel()),
  ChangeNotifierProvider(create: (ctx) => HJFilterViewModel()),
  ChangeNotifierProxyProvider<HJFilterViewModel,HJMealViewModel>(
      create: (ctx) =>HJMealViewModel(),
      update: (ctx,filterVM,mealVM){
        mealVM!.updateFilters(filterVM);
        return mealVM;
      }),
  //ChangeNotifierProvider(create: (ctx) => HJCollectViewModel()),
  ChangeNotifierProxyProvider<HJFilterViewModel,HJCollectViewModel>(
      create: (ctx) =>HJCollectViewModel(),
      update: (ctx,filterVM,collectVM){
        collectVM!.updateFilters(filterVM);
        return collectVM;
      }),
  ChangeNotifierProxyProvider<HJMealViewModel,HJCollectViewModel>(
      create: (ctx) =>HJCollectViewModel(),
      update: (ctx,mealsVM,collectVM){
        collectVM!.updateMeals(mealsVM);
        return collectVM;
      }),
];