import 'package:favorcate/Module/Collect/Model/HJCollectViewModel.dart';
import 'package:favorcate/Module/Meal/Model/HJMealViewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => HJMealViewModel()),
  ChangeNotifierProvider(create: (ctx) => HJCollectViewModel()),
];