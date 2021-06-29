```
/**
 *  1.Animation: 抽象类
 *    * 监听动画值的改变
 *    * 监听动画状态的改变
 *    * value
 *    * status
 *  2.AnimationController继承自Animation
 *    * vsync: 同步信号(this -> with SingleTickerProviderStateMixin)
 *    * forward(): 向前执行动画
 *    * reverse(): 反转执行动画
 *  3.CurvedAnimation:
 *    * 作用: 设置动画执行的速率(速度曲线)
 *  4.Tween: 设置动画执行的value范围
 *    * begin: 开始值
 *    * end: 结束值
 */
```

## Animation

```
abstractclass Animation<T> extends Listenable implements ValueListenable<T> {
  const Animation();
  
  // 添加动画监听器 每当动画的状态值发生变化时，动画都会通知所有通过 addListener 添加的监听器。
  @override
  void addListener(VoidCallback listener);
  
  // 移除动画监听器
  @override
  void removeListener(VoidCallback listener);
	
  // 添加动画状态监听器 当动画的状态发生变化时，会通知所有通过 addStatusListener 添加的监听器
  void addStatusListener(AnimationStatusListener listener);
	
  // 移除动画状态监听器
  void removeStatusListener(AnimationStatusListener listener);
	
  // 获取动画当前状态
  AnimationStatus get status;
	
  // 获取动画当前的值
  @override
  T get value;
```

## AnimationController

- `AnimationController`是`Animation`的一个子类

```
class AnimationController extends Animation<double>
  with AnimationEagerListenerMixin, AnimationLocalListenersMixin, AnimationLocalStatusListenersMixin {
  AnimationController({
    // 初始化值
    double value,
    // 动画执行的时间
    this.duration,
    // 反向动画执行的时间
    this.reverseDuration,
    // 最小值
    this.lowerBound = 0.0,
    // 最大值
    this.upperBound = 1.0,
    // 刷新率ticker的回调（看下面详细解析）
    @required TickerProvider vsync,
  })
}
```

- `AnimationController`还提供了对动画的控制：
- `forward`：向前执行动画
- `reverse`：反向播放动画
- `stop`：停止动画

**AnimationController有一个必传的参数vsync**

- Flutter每次渲染一帧画面之前都需要等待一个vsync信号。
- 这里也是为了监听vsync信号，当Flutter开发的应用程序不再接受同步信号时（比如锁屏或退到后台），那么继续执行动画会消耗性能。
- 这个时候我们设置了Ticker，就不会再出发动画了。
- 开发中比较常见的是将SingleTickerProviderStateMixin混入到State的定义中。

## CurvedAnimation

- CurvedAnimation也是Animation的一个实现类，它的目的是为了给AnimationController增加动画曲线：

- CurvedAnimation可以将AnimationController和Curve结合起来，生成一个新的Animation对象

```
class CurvedAnimation extends Animation<double> with AnimationWithParentMixin<double> {
  CurvedAnimation({
    // 通常传入一个AnimationController
    @requiredthis.parent,
    // Curve类型的对象
    @requiredthis.curve,
    this.reverseCurve,
  });
}
```

Curve类型的对象的有一些常量Curves（和Color类型有一些Colors是一样的），可以供我们直接使用：

- 对应值的效果，可以直接查看官网（有对应的gif效果，一目了然）
- https://api.flutter.dev/flutter/animation/Curves-class.html

## Tween

- 默认情况下，AnimationController动画生成的值所在区间是0.0到1.0，如果希望使用这个以外的值，或者其他的数据类型，就需要使用Tween

```
class Tween<T extends dynamic> extends Animatable<T> {
  Tween({ this.begin, this.end });
}
```

- Tween也有一些子类，比如ColorTween、BorderTween，可以针对动画或者边框来设置动画的值。

## 问题

1. 每次写动画，都要写一段代码，代码比较冗余
2. 调用setState意味着整个State类中的build方法就会被重新build

### 优化

#### AnimatedWidget

- 将需要执行动画的widget放到一个AnimatedWidget中的build方法中返回

- 缺点
  - 我们每次都要新建一个类来继承自AnimatedWidget
  - 如果我们的动画Widget有子Widget，那么意味着它的子Widget也会重新build

#### AnimatedBuilder

- 最终方案

```
AnimatedBuilder(
          animation: _animationController,
          builder: (ctx,child){
            return Icon(Icons.favorite,color: Colors.red,size: _tween.value,);
          },
        ),
```

## 交织动画

- 通过设置多个`Tween`，`demo`代码在工程里查看

## 转场动画

```
/// iOS present 方式 跳转
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (ctx){
          //       return HJModalPage();
          //     },
          //     fullscreenDialog: true
          // ));
          Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: Duration(seconds: 2),
              pageBuilder: (ctx,anim1,anim2){
                return FadeTransition(
                  opacity: anim1,
                  child: HJModalPage(),
                );
              }));
```

## Hero动画

移动端开发会经常遇到类似这样的需求：

- 点击一个头像，显示头像的大图，并且从原来图像的Rect到大图的Rect
- 点击一个商品的图片，可以展示商品的大图，并且从原来图像的Rect到大图的Rect

这种跨页面共享的动画被称之为享元动画（Shared Element Transition）

在Flutter中，有一个专门的Widget可以来实现这种动画效果：Hero

```
1.在第一个Page1中，定义一个起始的Hero Widget，被称之为source hero，并且绑定一个tag；
2.在第二个Page2中，定义一个终点的Hero Widget，被称之为 destination hero，并且绑定相同的tag；
3.可以通过Navigator来实现第一个页面Page1到第二个页面Page2的跳转过程；
```

