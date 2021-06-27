## 原始指针事件（Pointer Events）

- 屏幕上由触摸板、鼠标、指示笔等触发的指针的位置和移动

```
 Listener buildListener() {
    return Listener(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
        onPointerDown: (event){
          HJLog('手指按下：$event', StackTrace.current);
        },
        onPointerMove: (event){
          HJLog('手指移动：$event', StackTrace.current);
        },
        onPointerUp: (event){
          HJLog('手指抬起：$event', StackTrace.current);
        },
      );
  }
}
```

## 手势识别（Gesture Detector）

- 在原始事件上的一种封装

### **点击**：

- onTapDown：用户发生手指按下的操作
- onTapUp：用户发生手指抬起的操作
- onTap：用户点击事件完成
- onTapCancel：事件按下过程中被取消

### **双击：**

- onDoubleTap：快速点击了两次

### **长按：**

- onLongPress：在屏幕上保持了一段时间

### **纵向拖拽：**

- onVerticalDragStart：指针和屏幕产生接触并可能开始纵向移动；
- onVerticalDragUpdate：指针和屏幕产生接触，在纵向上发生移动并保持移动；
- onVerticalDragEnd：指针和屏幕产生接触结束；

### **横线拖拽：**

- onHorizontalDragStart：指针和屏幕产生接触并可能开始横向移动；
- onHorizontalDragUpdate：指针和屏幕产生接触，在横向上发生移动并保持移动；
- onHorizontalDragEnd：指针和屏幕产生接触结束；

### **移动：**

- onPanStart：指针和屏幕产生接触并可能开始横向移动或者纵向移动。如果设置了 `onHorizontalDragStart` 或者 `onVerticalDragStart`，该回调方法会引发崩溃；
- onPanUpdate：指针和屏幕产生接触，在横向或者纵向上发生移动并保持移动。如果设置了 `onHorizontalDragUpdate` 或者 `onVerticalDragUpdate`，该回调方法会引发崩溃。
- onPanEnd：指针先前和屏幕产生了接触，并且以特定速度移动，此后不再在屏幕接触上发生移动。如果设置了 `onHorizontalDragEnd` 或者 `onVerticalDragEnd`，该回调方法会引发崩溃。

```
GestureDetector buildGestureDetector() {
    return GestureDetector(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
        onTap: (){
          HJLog('点击', StackTrace.current);
        },
        onTapDown: (details){
          HJLog('按下', StackTrace.current);
        },
        onTapUp: (details){
          HJLog('抬起', StackTrace.current);
        },
        onDoubleTap: (){
          HJLog('双击', StackTrace.current);
        },
      );
  }
  
  /// 嵌套手势
  GestureDetector buildDoubleGestureDetector() {
    return GestureDetector(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.orange,
          alignment: Alignment.center,
          child: GestureDetector(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            onTapDown: (_){
              HJLog('red tapDown', StackTrace.current);
            },
          ),
        ),
        onTapDown: (_){
          HJLog('orange tapDown', StackTrace.current);
        },
      );
  }
  /// 忽略事件响应
  IgnorePointer(
              child: GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                onTapDown: (_){
                  HJLog('red tapDown', StackTrace.current);
                },
              ),
            )
```

## 跨组件事件

- 组件之间如果有事件需要传递，使用EventBus工具

```
dependencies:
  event_bus:^2.0.0
```

- 使用

```
/// 创建全局的eventbus
final eventBus = EventBus();

/// 发出事件
CupertinoButton(
        child: Text('点击'),
        onPressed: (){
          // eventBus.fire('helloworld');
          UserInfo user = UserInfo('张三', 18, 180);
          eventBus.fire(user);
          }
    )
    
    
 /// 响应时间
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventBus.on<UserInfo>().listen((event) {
      print('${event.name} -- ${event.age} -- ${event.height}');
      setState(() {
        _msg = '${event.name} -- ${event.age} -- ${event.height}';
      });
    });
  }
```

