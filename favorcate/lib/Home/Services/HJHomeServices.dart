
import 'package:flutter/services.dart';
import 'package:favorcate/Home/Model/HJHomeModel.dart';
import 'dart:convert';

class HJHomeServices {

  static Future<List<HJHomeModel>> getHomeData() async{

    /// 加载json文件
    final jsonString = await rootBundle.loadString('assets/json/category.json');
    /// 将json文件转成map/list
    final result = json.decode(jsonString);
    /// map中内容转对象
    final category = result['category'];
    List<HJHomeModel> results  = [];
    for (var i in category){
      results.add(HJHomeModel.fromJson(i));
    }
    return results;
  }

}