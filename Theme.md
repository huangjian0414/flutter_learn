```
MaterialApp(
        home: HJThemeTestPage(),
      theme: ThemeData(
        // 1.亮度
          brightness: Brightness.light,
          // 2.primarySwatch传入不是Color, 而是MaterialColor(包含了primaryColor和accentColor)
          primarySwatch: Colors.red,
          // 3.primaryColor: 单独设置导航和TabBar的颜色
          primaryColor: Colors.orange,
          // 4.accentColor: 单独设置FloatingActionButton\Switch
          accentColor: Colors.blue,
          // 5.Button的主题
          buttonTheme: ButtonThemeData(
              height: 25,
              minWidth: 10,
              buttonColor: Colors.yellow
          ),
          // 6.Card的主题
          cardTheme: CardTheme(
              color: Colors.greenAccent,
              elevation: 10
          ),
          // 7.Text的主题
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 16, color: Colors.teal),
            headline2: TextStyle(fontSize: 20, color: Colors.green),
            headline3: TextStyle(fontSize: 22, color: Colors.pink),
            headline4: TextStyle(fontSize: 24, color: Colors.black),
            headline5: TextStyle(fontSize: 26, color: Colors.brown),
            headline6: TextStyle(fontSize: 28, color: Colors.purple),
            subtitle1: TextStyle(fontSize: 14, color: Colors.deepPurpleAccent),
            subtitle2: TextStyle(fontSize: 16, color: Colors.blue),
            bodyText1: TextStyle(fontSize: 18, color: Colors.lightBlueAccent),
            /// 默认使用
            bodyText2: TextStyle(fontSize: 20, color: Colors.red),
          )
      ),
    );
```

- 单独改变主题

```
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
```

