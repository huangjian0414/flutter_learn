
import 'package:favorcate/Http/HttpRequest.dart';
import 'package:favorcate/Http/HttpTool.dart';
import 'package:favorcate/Module/Meal/Model/HJMealModel.dart';

class HJMealService{

  static Future<HJMealModel> getMealData() async{
    HttpRequest req = HttpRequest();
    req.url = 'http://yapi.smart-xwork.cn/mock/73924/v1/getmeal';
    req.type = HttpType.kGet;

    final result = await HttpTool.sendRequest(req);
    final mealModel = HJMealModel.fromJson(result);

    return mealModel;
  }
}