## HelloWorld

```dart
//// 1
import 'package:flutter/material.dart';

main() {
  // 1.runApp函数
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text("第一个Flutter程序"),
            ),
            body: Center(
              child: Text(
                "Hello World",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.orange
                ),
              ),
            ),
          )
      )
  );
}

//// 2 
import 'package:flutter/material.dart';

main() => runApp(MyApp());

/**
 * Widget:
 * 有状态的Widget: StatefulWidget 在运行过程中有一些状态(data)需要改变
 * 无状态的Widget: StatelessWidget 内容是确定没有状态(data)的改变
 */

class MyApp extends StatelessWidget {
  // build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HYHomePage()
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第一个Flutter程序"),
        ),
        body: HYContentBody()
    );
  }
}

class HYContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello World",
        style: TextStyle(
            fontSize: 40,
            color: Colors.orange
        ),
      ),
    );
  }
}

```

## 同意协议

```dart
import 'package:flutter/material.dart';


// 这个代码是有问题的
class HYContentBody extends StatelessWidget {
  // 错误的代码
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: flag,
            onChanged: (value) => flag = value
          ),
          Text("同意协议", style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}

/// 正确方式

import 'package:flutter/material.dart';

/**
 * Widget:
 * 有状态的Widget: StatefulWidget 在运行过程中有一些状态(data)需要改变
 * 无状态的Widget: StatelessWidget 内容是确定没有状态(data)的改变
 */
class MyApp extends StatelessWidget {
  // build
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HYHomePage()
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("HYHomePage Build");
    return Scaffold(
        appBar: AppBar(
          title: Text("第一个Flutter程序"),
        ),
        body: HYContentBody()
    );
  }
}

// StatefullWidget: 继承自StatefulWidget的类(可以接收父Widget传过来的数据)/State类(状态)
// flag: 状态
// Stateful不能定义状态 -> 创建一个单独的类, 这个类负责维护状态
class HYContentBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HYContentBodyState();
  }
}


class HYContentBodyState extends State<HYContentBody> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    print("HYContentBodyState Build");
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: flag,
            onChanged: (value) {
              this.setState(() {
                flag = value;
              });
            },
          ),
          Text("同意协议", style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
```

## StatelessWidget,StatefulWidget

```dart
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: HYHomeContent(),
    );
  }
}

class HYHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        HYHomeProductItem("Apple1", "Macbook1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        SizedBox(height: 6,),
        HYHomeProductItem("Apple2", "Macbook2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        SizedBox(height: 6,),
        HYHomeProductItem("Apple3", "Macbook2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
      ],
    );
  }
}

class HYHomeProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  final style1 = TextStyle(fontSize: 25, color: Colors.orange);
  final style2 = TextStyle(fontSize: 20, color: Colors.green);

  HYHomeProductItem(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(
              width: 5, // 设置边框的宽度
              color: Colors.pink// 设置边框的颜色
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(title, style: style1),
            ],
          ),
          SizedBox(height: 8),
          Text(desc, style: style2),
          SizedBox(height: 8),
          Image.network(imageURL)
        ],
      ),
    );
  }
}

////. StatefulWidget

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: HYHomeContent("你好啊,李银河"),
    );
  }
}


// Widget是不加_: 暴露给别人使用
class HYHomeContent extends StatefulWidget {
  final String message;

  HYHomeContent(this.message);

  @override
  State<StatefulWidget> createState() {
    return _HYHomeContentState();
  }
}

/**
 * 为什么Flutter在设计的时候StatefulWidget的build方法放在State中
 *  1.build出来的Widget是需要依赖State中的变量(状态/数据)
 *  2.在Flutter的运行过程中:
 *    Widget是不断的销毁和创建的
 *    当我们自己的状态发生改变时, 并不希望重新状态一个新的State
 */
// State是加_: 状态这个类只是给Widget使用
class _HYHomeContentState extends State<HYHomeContent> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getButtons(),
          Text("当前计数:$_counter", style: TextStyle(fontSize: 25),),
          Text("传递的信息:${widget.message}")
        ],
      ),
    );
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("+", style: TextStyle(fontSize: 20, color: Colors.white),),
          color: Colors.pink,
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
        RaisedButton(
            child: Text("-", style: TextStyle(fontSize: 20, color: Colors.white),),
            color: Colors.purple,
            onPressed: () {
              setState(() {
                _counter--;
              });
            }
        ),
      ],
    );
  }
}

```

## 生命周期

```dart
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomeDemo(),
    );
  }
}


class HYHomeDemo extends StatefulWidget {
  @override
  _HYHomeDemoState createState() => _HYHomeDemoState();
}

class _HYHomeDemoState extends State<HYHomeDemo> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: Column(
        children: [
          HYHomeContent()
        ],
      ),
      floatingActionButton: RaisedButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
          });
        },
      ),
    );
  }
}



// StatelessWidget的生命周期
// class HYHomeContent extends StatelessWidget {
//  final String message;

//  HYHomeContent(this.message) {
//    print("构造函数被调用");
//  }

//  @override
//  Widget build(BuildContext context) {
//    print("调用build方法");
//    return Text(message);
//  }
// }


// StatefulWidget的生命周期
class HYHomeContent extends StatefulWidget {
  HYHomeContent() {
    print("1.调用HYHomeContent的constructor方法");
  }

  @override
  _HYHomeContentState createState() {
    print("2.调用HYHomeContent的createState方法");
    return _HYHomeContentState();
  }
}

class _HYHomeContentState extends State<HYHomeContent> {
  int _counter = 0;
  _HYHomeContentState() {
    print("3.调用_HYHomeContentState的constructor方法");
  }

  @override
  void initState() {
    // 调用: 这里是必须调用super
    final TextStyle style = TextStyle();

    super.initState();
    print("4.调用_HYHomeContentState的initState方法");
  }

  @override
  void didUpdateWidget(HYHomeContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("调用_HYHomeContentState的didChangeDependencies方法");
  }

  @override
  Widget build(BuildContext context) {
    print("5.调用_HYHomeContentState的build方法");
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
        Text("数字:$_counter")
      ],
    );
  }

  @override
  void dispose() {
    print("6.调用_HYHomeContentState的dispose方法");
    super.dispose();
  }
}

```



