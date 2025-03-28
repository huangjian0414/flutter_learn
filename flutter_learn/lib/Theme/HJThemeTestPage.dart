import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/Theme/HJMaterialColorUtil.dart';
import 'package:flutter_learn/Theme/HJTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
        home: HJThemeTestPage(),
      theme: HJTheme.normal,
      /// 黑夜
      darkTheme: HJTheme.dark
    );
  }
}


class HJThemeTestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Hello World1"),
            Text("Hello World2", style: TextStyle(fontSize: 14),),
            Text("Hello World3", style: TextStyle(fontSize: 20),),
            Text("Hello World4", style: Theme.of(context).textTheme.bodyText2,),
            Text("Hello World5", style: Theme.of(context).textTheme.subtitle2,),
            Switch(value: true, onChanged: (value) {},),
            /// iOS switch 颜色不随主题，自己设置颜色
            CupertinoSwitch(value: true, onChanged: (value) {}, activeColor: Colors.red,),
            ElevatedButton(child: Text("R"), onPressed: () {},),
            Card(child: Text("溪秀嘻嘻嘻", style: TextStyle(fontSize: 50),),)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: '分类')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
            return HJThemeDetailPage();
          }));
        },
      ),
    );
  }
}

class HJThemeDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // return buildScaffold(context);
    return buildTheme(context);
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('详情页'),
    ),
    body: buildCenter(context),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.pets),
      onPressed: (){
        Navigator.of(context).pop();
      },
    ),
  );
  }

  Center buildCenter(BuildContext context) {
    return Center(
    child: Column(
      children: [
        Text("Hello World1"),
        Text("Hello World2", style: TextStyle(fontSize: 14),),
        Text("Hello World3", style: TextStyle(fontSize: 20),),
        Text("Hello World4", style: Theme.of(context).textTheme.bodyText2,),
        Text("Hello World5", style: Theme.of(context).textTheme.subtitle2,),
        Switch(value: true, onChanged: (value) {},),
        /// iOS switch 颜色不随主题，自己设置颜色
        CupertinoSwitch(value: true, onChanged: (value) {}, activeColor: Colors.red,),
        ElevatedButton(child: Text("R"), onPressed: () {},),
        Card(child: Text("溪秀嘻嘻嘻", style: TextStyle(fontSize: 50),),)
      ],
    ),
  );
  }
    /// 不想用主题色时
  Theme buildTheme(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.purple,cardTheme: CardTheme(
          color: Colors.lightBlueAccent,
          elevation: 10
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text('详情页'),
          //手动单独设置
          //backgroundColor: Colors.purple,
        ),
        body: buildCenter(context),
        floatingActionButton: Theme(//单独覆盖
          data: Theme.of(context).copyWith(
            // accentColor不会被覆盖,使用这个
            colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: Colors.pink
            )
          ),
          child: FloatingActionButton(
            child: Icon(Icons.pets),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
      )
  );
  }
}
