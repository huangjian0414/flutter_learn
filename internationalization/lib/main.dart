import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internationalization/HJLocalDelegate.dart';
import 'package:internationalization/HJLocalManager.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      /// 支持的语言
      supportedLocales: [
        Locale('zh'),
        Locale('en'),
        ///指定语言代码、文字代码和国家代码
        // const Locale.fromSubtags(languageCode: 'zh'), // generic Chinese 'zh'
        // const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // generic simplified Chinese 'zh_Hans'
        // const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // generic traditional Chinese 'zh_Hant'
        // const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'), // 'zh_Hans_CN'
        // const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'), // 'zh_Hant_TW'
        // const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK'), // 'zh_Hant_HK'
      ],
      localizationsDelegates: [
        /// 指定本地化的字符串和一些其他的值
        GlobalMaterialLocalizations.delegate,
        /// 对应的Cupertino风格
        GlobalCupertinoLocalizations.delegate,
        /// 指定默认的文本排列方向, 由左到右或由右到左
        GlobalWidgetsLocalizations.delegate,
        HJLocalDelegate.delegate
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //final HJLocalManager localManager = Localizations.of(context, HJLocalManager);

    return Scaffold(
      appBar: AppBar(
        title: Text(HJLocalManager.of(context).title??''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(HJLocalManager.of(context).text??'',style: TextStyle(fontSize: 20),),
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000));
                },
                child: Text(
                  HJLocalManager.of(context).btnText??'',
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }


}