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

  ChangeNotifierProxyProvider2<HJFilterViewModel,HJMealViewModel,HJCollectViewModel>(
      create: (ctx) =>HJCollectViewModel(),
      update: (ctx,filterVM,mealsVM,collectVM){
        collectVM!.updateFilters(filterVM);
        collectVM.updateMeals(mealsVM);
        return collectVM;
      }
  )
];