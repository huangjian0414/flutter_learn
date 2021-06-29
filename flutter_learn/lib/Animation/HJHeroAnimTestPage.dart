
import 'package:flutter/material.dart';
import 'package:flutter_learn/Animation/Page/HJImageDetailPage.dart';

import 'Page/ModalPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: HJHeroAnimTestPage(),
    );
  }
}

class HJHeroAnimTestPage extends StatefulWidget {

  @override
  _HJHeroAnimTestPageState createState() => _HJHeroAnimTestPageState();
}

class _HJHeroAnimTestPageState extends State<HJHeroAnimTestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation'),
      ),
      body: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16/9
          ),
          children: List.generate(20, (index) {
            final imageUrl = 'https://picsum.photos/500/500?random=$index';
            return GestureDetector(
              child: Hero(child: Image.network(imageUrl,fit: BoxFit.cover,),tag: imageUrl,),
              onTap: (){
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (ctx,anim1,anmi2){
                      return FadeTransition(opacity: anim1,child: HJImageDetailPage(imageUrl),);
                    }
                  ));
              },
            );
          }),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pool),
        onPressed: (){
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
        },
      ),
    );
  }

}
