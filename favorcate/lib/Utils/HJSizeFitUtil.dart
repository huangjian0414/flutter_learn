
import 'dart:ui';

class HJSizeFitUtil {
// 1.基本信息
  static double physicalWidth = 0;
  static double physicalHeight = 0;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double dpr = 0;
  static double statusHeight = 0;

  static double rpx = 0;
  static double px = 0;
  /// 以750作为设计稿宽度 ，可选
  static void initialize({double standardSize = 750}) {
    // 1.手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2.获取dpr
    dpr = window.devicePixelRatio;

    // 3.宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    statusHeight = window.padding.top / dpr;

    // 5.计算rpx的大小
    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}

extension DoubleFit on double{
  double get hj_px {
    return HJSizeFitUtil.setPx(this);
  }
  double get hj_rpx {
    return HJSizeFitUtil.setRpx(this);
  }
}

extension IntFit on int {
  double get hj_px{
    return HJSizeFitUtil.setPx(this.toDouble());
  }
  double get hj_rpx{
    return HJSizeFitUtil.setRpx(this.toDouble());
  }
}