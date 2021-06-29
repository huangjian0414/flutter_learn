
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: HJMultipleAnimTestPage(),
    );
  }
}

class HJMultipleAnimTestPage extends StatefulWidget {

  @override
  _HJMultipleAnimTestPageState createState() => _HJMultipleAnimTestPageState();
}

class _HJMultipleAnimTestPageState extends State<HJMultipleAnimTestPage> with SingleTickerProviderStateMixin{
  //1.创建AnimationController
  AnimationController _animationController;
  Animation _curvedAnimation;
  Animation _sizeTween;
  Animation _colorTween;
  Animation _opacitytween;
  Animation _radianstween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      // lowerBound: 50,
      // upperBound: 150
    );

    //2.设置curve值
    _curvedAnimation = CurvedAnimation(parent: _animationController,curve: Curves.easeInOut);

    //3. 多个Tween
    _sizeTween = Tween(begin: 50.0,end: 150.0).animate(_animationController);
    _colorTween = ColorTween(begin: Colors.red,end: Colors.orange).animate(_animationController);
    _opacitytween = Tween(begin: 0.0,end: 1.0).animate(_animationController);
    _radianstween = Tween(begin: 0.0,end: 2*pi).animate(_animationController);

    // 监听动画值的改变
    _animationController.addListener(() {
      setState(() {
      });
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (ctx,child){
            return Opacity(
              opacity: _opacitytween.value,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(_radianstween.value),
                child: Container(
                  width: _sizeTween.value,
                  height: _sizeTween.value,
                  color: _colorTween.value,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outline),
        onPressed: (){
          /// 动画暂停，恢复
          if (_animationController.isAnimating) {
            _animationController.stop();
          }else if (_animationController.status == AnimationStatus.forward) {
            _animationController.forward();
          }else if (_animationController.status == AnimationStatus.reverse) {
            _animationController.reverse();
          }else{
            _animationController.forward();
          }
        },
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}
