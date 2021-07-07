

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:internationalization/HJLocalizations/HJLocalManager.dart';

class HJLocalDelegate extends LocalizationsDelegate<HJLocalManager>{
  @override
  ///当前环境的Locale，是否在我们支持的语言范围
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en','zh'].contains(locale.languageCode);
  }

  @override
  /// 当Locale发生改变时（语言环境），加载对应的HYLocalizations资源
  Future<HJLocalManager> load(Locale locale) async {
    // TODO: implement load
    //return SynchronousFuture(HJLocalManager(locale));
    final localization = HJLocalManager(locale);
    await localization.loadLocalValues();
    return localization;
  }

  @override
  ///当Localizations Widget重新build时，是否调用load方法重新加载Locale资源
  bool shouldReload(covariant LocalizationsDelegate old) {
    // TODO: implement shouldReload
    return false;
  }

  static HJLocalDelegate delegate = HJLocalDelegate();
}