## 文本

```dart
import 'package:flutter/material.dart';

class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
//        text: "Hello World",
//        style: TextStyle(color: Colors.red, fontSize: 20)
          children: [
            TextSpan(text: "Hello World", style: TextStyle(color: Colors.red)),
            TextSpan(text: "Hello flutter", style: TextStyle(color: Colors.green)),
            WidgetSpan(child: Icon(Icons.favorite, color: Colors.red,)),
            TextSpan(text: "Hello dart", style: TextStyle(color: Colors.blue)),
          ]
      )
    );
  }
}


// Text Widget
class TextDemo extends StatelessWidget {
  const TextDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼 莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
//      textScaleFactor: 1.5,
      style: TextStyle(
          fontSize: 20,
          color: Colors.red,
          fontWeight: FontWeight.bold
      ),
    );
  }
}
```

## 按钮

```dart
import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 1.RaisedButton:
        RaisedButton(
          child: Text("RaisedButton"),
          textColor: Colors.white,
          color: Colors.purple,
          onPressed: () => print("RaisedButton Click"),
        ),

        // 2.FlatButton
        FlatButton(
          child: Text("FlatButton"),
          color: Colors.orange,
          onPressed: () => print("FlatButton Click"),
        ),

        // 3.OutlineButton
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: () => print("OutlineButton"),
        ),

        // 4.FloatingActionButton
//        FloatingActionButton

        // 5.自定义button: 图标-文字-背景-圆角
        FlatButton(
          color: Colors.amberAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.favorite, color: Colors.red,),
              Text("喜欢作者")
            ],
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

```

## 图片

```dart
import 'package:flutter/material.dart';

class ImageDemo02 extends StatelessWidget {
  const ImageDemo02({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/juren.jpeg");
  }
}

class ImageDemo01 extends StatelessWidget {
  const ImageDemo01({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    // Image.network(imageURL)
    return Image(
      color: Colors.green,
      colorBlendMode: BlendMode.colorDodge,
      image: NetworkImage(imageURL),
      width: 200,
      height: 200,
      fit: BoxFit.contain,
      repeat: ImageRepeat.repeatY,
//      alignment: Alignment.bottomCenter,
//    范围: -1 1
      alignment: Alignment(0, 0),
    );
  }
}

```

## Button-image-icon

```dart


import 'package:flutter/material.dart';

class IconExtensionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Icon字体图标和图片图标
    // 1.字体图标矢量图(放大的时候不会失真)
    // 2.字体图标可以设置颜色
    // 3.图标很多时, 占据空间更小
//    return Icon(Icons.pets, size: 300, color: Colors.orange,);
//    return Icon(IconData(0xe91d, fontFamily: 'MaterialIcons'), size: 300, color: Colors.orange,);
    // 1.0xe91d -> unicode编码
    // 2.设置对应的字体
    return Text("\ue91d", style: TextStyle(fontSize: 100, color: Colors.orange, fontFamily: "MaterialIcons"),);
  }
}


class ImageExtensionDemo extends StatelessWidget {
  const ImageExtensionDemo({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    // 1.占位图的问题: FadeInImage
    // 2.图片缓存: 1000张 100m
    return FadeInImage(
      fadeOutDuration: Duration(milliseconds: 1),
      fadeInDuration: Duration(milliseconds: 1),
      placeholder: AssetImage("assets/images/juren.jpeg"),
      image: NetworkImage(imageURL),
    );
  }
}


class ButtonExtensionDemo extends StatelessWidget {
  const ButtonExtensionDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1.默认情况下Button上下有一定的间距
    // 2.Button变小: ButtonTheme
    // 3.取出Button的内边距
    return Column(
      children: <Widget>[
        ButtonTheme(
          minWidth: 30,
          height: 10,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.red,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Text("Flat Button1"),
            textColor: Colors.white,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

```

## TextField

```dart
import 'package:flutter/material.dart';

class TextFieldDemo extends StatelessWidget {

  final usernameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Colors.red
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: usernameTextEditController,
              decoration: InputDecoration(
                  labelText: "username",
                  icon: Icon(Icons.people),
                  hintText: "请输入用户名",
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.red[100]
              ),
              onChanged: (value) {
                print("onChange:$value");
              },
              onSubmitted: (value) {
                print("onSubmitted:$value");
              },
            ),
            SizedBox(height: 10,),
            TextField(
              controller: passwordTextEditController,
              decoration: InputDecoration(
                labelText: "password",
                icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 40,
              child: FlatButton(
                child: Text("登 录", style: TextStyle(fontSize: 20, color: Colors.white),),
                color: Colors.blue,
                onPressed: () {
                  // 1.获取用户名和密码
                  final username = usernameTextEditController.text;
                  final password = passwordTextEditController.text;
                  print("账号:$username 密码:$password");
                  usernameTextEditController.text = "";
                  passwordTextEditController.text = "";
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

```

## 单子布局Widget

```dart
import 'package:flutter/cupertino.dart';
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
        title: Text("基础Widget"),
      ),
      body: HYHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("FloatingActionButton Click"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.red,
      width: 200,
      height: 200,
      alignment: Alignment(0, 0),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: Text("Hello World"),
//      transform: Matrix4.rotationZ(50),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
              width: 5,
              color: Colors.purple
          ),
//        borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Colors.orange, offset: Offset(10, 10), spreadRadius: 5, blurRadius: 10),
            BoxShadow(color: Colors.blue, offset: Offset(-10, 10), spreadRadius: 5, blurRadius: 10),
          ]
      ),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: 10
      ),
      child: Text("你好啊,李银河", style: TextStyle(fontSize: 30, backgroundColor: Colors.red),),
    );
  }
}


class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment(1, 1),
        widthFactor: 5,
        heightFactor: 5,
        child: Icon(Icons.pets, size: 50)
    );
  }
}
```

## 布局

```dart
import 'package:flutter/cupertino.dart';
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
        title: Text("基础Widget"),
      ),
      body: HYHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("FloatingActionButton Click"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    // Row/Column: 继承自Flex
    // Flex: CSS Flex布局, 直接使用的较少
    // Axis.vertical: Column
    // Axis.horizontal: Row

    /**
     * Row特点:
     *  - 水平方向尽可能占据比较大的空间
     *    * 水平方向也是希望包裹内容, 那么设置mainAxisSize = min
     *  - 垂直方向包裹内容
     * MainAxisAlignment:
     *  - start: 主轴的开始位置挨个摆放元素(默认值)
     *  - end: 主轴的结束位置挨个摆放元素
     *  - center: 主轴的中心点对齐
     *  - spaceBetween: 左右两边的间距为0, 其它元素之间平分间距
     *  - spaceAround: 左右两边的间距是其它元素之间的间距的一半
     *  - spaceEvenly: 所有的间距平分空间
     * CrossAxisAlignment:
     *  - start: 交叉轴的起始位置对齐
     *  - end: 交叉轴的结束位置对齐
     *  - center: 中心点对齐(默认值)
     *  - baseline: 基线对齐(必须有文本的时候才起效果)
     *  - stretch: 先Row占据交叉轴尽可能大的空间, 将所有的子Widget交叉轴的高度, 拉伸到最大
     */
    return RowDemo2();
  }
}

// 3.Expanded
class RowDemo2 extends StatefulWidget {
  const RowDemo2({
    Key key,
  }) : super(key: key);

  @override
  _RowDemo2State createState() => _RowDemo2State();
}

class _RowDemo2State extends State<RowDemo2> {
  bool _isFavor = false;

  @override
  Widget build(BuildContext context) {
    /**
     * Stack默认的大小是包裹内容的
     *  - alignment: 从什么位置开始排布所有的子Widget
     *  - fit: expand(很少) 将子元素拉伸到尽可能大
     *  - overflow: 超出部分如何处理
     * Positioned
     */
    return Stack(
      children: <Widget>[
        Image.asset("assets/images/juren.jpeg"),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: Color.fromARGB(150, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "进击的巨人挺不错的",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: _isFavor? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavor = !_isFavor;
                    });
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class StackDemo1 extends StatelessWidget {
  const StackDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
//        fit: StackFit.expand,
//      overflow: Overflow.visible,
      children: <Widget>[
        Image.asset(
          "assets/images/juren.jpeg",
          width: 300,
          fit: BoxFit.cover,
        ),
        Positioned(
            left: 20,
            bottom: -50,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.red,
            )),
        Positioned(
            right: 10,
            bottom: 20,
            child: Text(
              "进击的巨人",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ))
      ],
    );
  }
}

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          /**
           * Flexible中的属性:
           * - flex
           * Expanded(更多) -> Flexible(fit: FlexFit.tight)
           * 空间分配问题
           */
          Expanded(child: Container(height: 60, color: Colors.red)),
          Expanded(
              flex: 2,
              child: Container(width: 1000, height: 100, color: Colors.green)),
          Container(width: 90, height: 80, color: Colors.blue),
          Container(width: 50, height: 120, color: Colors.orange),
        ],
      ),
    );
  }
}

// 2.Column的使用
class ColumnDemo extends StatelessWidget {
  const ColumnDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      verticalDirection: VerticalDirection.down,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 80,
          height: 60,
          color: Colors.red,
          child: Text(
            "Hellxo",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 120,
          height: 100,
          color: Colors.green,
          child: Text(
            "Woxrld",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          width: 90,
          height: 80,
          color: Colors.blue,
          child: Text(
            "abxc",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 50,
          height: 120,
          color: Colors.orange,
          child: Text(
            "cxba",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ],
    );
  }
}

// 1.基本使用
class RowDemo1 extends StatelessWidget {
  const RowDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          Container(
            width: 80,
            height: 60,
            color: Colors.red,
            child: Text(
              "Hellxo",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: 120,
            height: 100,
            color: Colors.green,
            child: Text(
              "Woxrld",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            width: 90,
            height: 80,
            color: Colors.blue,
            child: Text(
              "abxc",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
            width: 50,
            height: 120,
            color: Colors.orange,
            child: Text(
              "cxba",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonRowDemo extends StatelessWidget {
  const ButtonRowDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[Icon(Icons.bug_report), Text("bug报告")],
      ),
      onPressed: () => print("按钮被点击"),
    );
  }
}

```

## ListView

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表测试"),
      ),
      body: Container(
        height: 300,
        child: ListView.separated(
          itemCount: 100,
          itemBuilder: (BuildContext ctx, int index) {
            return Text(
              "Hello World: $index",
              style: TextStyle(fontSize: 20),
            );
          },
          separatorBuilder: (BuildContext ctx, int index) {
            return Divider(
              color: Colors.red,
              height: 30,
              indent: 30,
              endIndent: 30,
              thickness: 10,
            );
          },
        ),
      ),
    );
  }
}

class ListViewDemo2 extends StatelessWidget {
  const ListViewDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemExtent: 60,
      itemBuilder: (BuildContext ctx, int index) {
        return Text(
          "Hello World: $index",
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}

class ListViewDemo1 extends StatelessWidget {
  const ListViewDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
//        scrollDirection: Axis.horizontal,
//        reverse: true,
//        itemExtent: 100,
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text("联系人${index + 1}"),
          subtitle: Text("联系人电话号码:18866665555"),
        );
      }),
    );
  }
}

```

## GridView

```dart
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表测试"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8
            ),
            itemBuilder: (BuildContext ctx, int index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
              );
            }
        ),
      ),
    );
  }
}

class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.8
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: .8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}
```

## CustomScrollView

```dart
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Slivers Demo"),
//      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Hello World"),
              background: Image.asset("assets/images/juren.jpeg", fit: BoxFit.cover,),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2
            ),
            delegate: SliverChildBuilderDelegate(
                    (BuildContext ctx, int int) {
                  return Container(color: Color.fromARGB(255, Random().nextInt(
                      256), Random().nextInt(256), Random().nextInt(256)));
                },
                childCount: 10
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext ctx, int index) {
                  return ListTile(
                    leading: Icon(Icons.people),
                    title: Text("联系人$index"),
                  );
                },
                childCount: 20
            ),
          )
        ],
      ),
    );
  }
}

class CustomScrollView1 extends StatelessWidget {
  const CustomScrollView1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.5
              ),
              delegate: SliverChildBuilderDelegate(
                      (BuildContext ctx, int int) {
                    return Container(color: Color.fromARGB(255, Random().nextInt(
                        256), Random().nextInt(256), Random().nextInt(256)));
                  },
                  childCount: 100
              ),
            ),
          ),
        )
      ],
    );
  }
}
```

## 滚动的监听

```dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  ScrollController _controller = ScrollController(initialScrollOffset: 300);
  bool _isShowFloatingBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
//      print("监听到滚动....: ${_controller.offset}");
      setState(() {
        _isShowFloatingBtn = _controller.offset >= 1000;
      });
    });

//    runCalc();
  }

  void runCalc() async {
    var result = await compute(calc, 100);
    print("---------: $result");
  }

  int calc(int count) {
    int total = 0;
    for (int i = 0; i < count; i++) {
      total += 0;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    /**
     * 两种方式可以监听:
     *  controller:
     *    1.可以设置默认值offset
     *    2.监听滚动, 也可以监听滚动的位置
     *  NotificationListener
     *    1.开始滚动和结束滚动
     */
    return Scaffold(
      appBar: AppBar(
        title: Text("列表测试"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            print("开始滚动");
          } else if (notification is ScrollUpdateNotification) {
            print("正在滚动...,总滚动距离:${notification.metrics.maxScrollExtent} 当前滚动的位置: ${notification.metrics.pixels}");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动");
          }
          return true;
        },
        child: ListView.builder(
            controller: _controller,
            itemCount: 100,
            itemBuilder: (BuildContext ctx, int index) {
              return ListTile(
                leading: Icon(Icons.people),
                title: Text("联系人$index"),
              );
            }
        ),
      ),
      floatingActionButton: _isShowFloatingBtn? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
        },
      ): null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
```

## Flutter的Widget-Element-RenderObject

```
1.自己写Widget
    2.某些Widget中会创建RenderObject
    3.每一个Widget都会创建一个Element对象
    4.1.ComponentElement: mount方法 -> firstBuild -> rebuild -> performBuild -> build -> _widget.build
    4.2.RenderObjectElement: mount方法 -> _widget.createRenderObject
    4.3.StatefulElement:
    * 构造方法中 _state = widget.createState()
    * _state._widget = widget;

    所有的Widget都会创建一个对应的Element对象
   StatelessElement;
   StatefulElement;

    组件Widget: 不会生成RenderObject
    Container -> StatelessWidget -> Widget
   Container();
   Text();
   HYHomeContent();

    创建Element: RenderObjectElement
    渲染Widget: 生成RenderObject
    Padding -> SingleChildRenderObjectWidget -> RenderObjectWidget(createRenderObject) -> Widget
    Padding -> createRenderObject -> RenderPadding -> RenderBox -> RenderObject
   Padding();
   RenderObjectWidget
```

## Key

- 例子都在`flutter学习`工程的`Test文件夹`里

### StatelessWidget

- ```
  删除之后调用setState，会重新build，重新build出来的新的StatelessWidget会重新生成一个新的随机颜色,所有的颜色都会发现一次变化
  ```

###  StatefulWidget（没有key）

```
没有key：
很奇怪的现象，颜色不变化，但是数据向上移动了
因为在删除第一条数据的时候，Widget对应的Element并没有改变
而Element中对应的State引用也没有发生改变；
在更新Widget的时候，Widget使用了没有改变的Element中的State
```

###  StatefulWidget（随机key）

```
ValueKey(Random().nextInt(10000)) 随机key 每次删除都会出现随机颜色
因为修改了key之后，Element会强制刷新，那么对应的State也会重新创建
```

### StatefulWidget（指定key）

```
指定key  理想效果
在更新widget的过程中根据key进行了diff算法，
在前后进行对比时，发现222对应的Element和333对应的Element会继续使用，那么就会删除之前111对应的Element，而不是直接删除最后一个Element
```

### Key的分类

#### LocalKey

- 应用于具有相同父`Element`的`Widget`进行比较，也是`diff`算法的核心所在

##### ValueKey

- 以特定的值作为`key`时使用，比如一个字符串、数字等等

##### ObjectKey

- 如果两个学生，他们的名字一样，使用`name`作为他们的`key`就不合适了
- 我们可以创建出一个学生对象，使用对象来作为key

##### UniqueKey

- 如果我们要确保`key`的唯一性，可以使用`UniqueKey`
- 比如我们之前使用随机数来保证`key`的不同，这里我们就可以换成`UniqueKey`

#### GlobalKey

- 通常我们会使用`GlobalKey`某个`Widget`对应的`Widget`或`State`或`Element`

- `GlobalKey`可以帮助我们访问某个`Widget`的信息，包括`Widget`或`State`或`Element`等对象