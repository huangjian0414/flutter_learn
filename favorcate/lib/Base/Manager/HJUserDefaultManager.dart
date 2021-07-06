

import 'package:shared_preferences/shared_preferences.dart';

class HJUserDefaultManager {

  //存储数据
  static Future saveString(String key,String value) async {
    SharedPreferences userDefault = await SharedPreferences.getInstance();
    userDefault.setString(key, value);
  }
  static Future saveBool(String key, bool value) async {
    SharedPreferences userDefault = await SharedPreferences.getInstance();
    userDefault.setBool(key, value);
  }
  static Future saveStrList(String key, List<String> value) async {
    SharedPreferences userDefault = await SharedPreferences.getInstance();
    userDefault.setStringList(key, value);
  }
  //获取数据
  static Future getBoolValue(String key) async {
    SharedPreferences userDefault = await SharedPreferences.getInstance();
    return userDefault.getBool(key);
  }
  static Future getString(String key) async {
    SharedPreferences userDefault = await SharedPreferences.getInstance();
    return userDefault.getString(key);
  }
  static Future getStrList(String key) async {
    SharedPreferences userDefault = await SharedPreferences.getInstance();
    return userDefault.getStringList(key);
  }
  //删除数据
  static Future deleteValue(String key) async {
    SharedPreferences userDefault = await SharedPreferences.getInstance();
    userDefault.remove(key);
    userDefault.setStringList('colloct', ['','']);
  }

}