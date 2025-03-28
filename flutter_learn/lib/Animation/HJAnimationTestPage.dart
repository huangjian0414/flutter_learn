
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: HJAnimationTestPage(),
    );
  }
}

class HJAnimationTestPage extends StatefulWidget {

  @override
  _HJAnimationTestPageState createState() => _HJAnimationTestPageState();
}

class _HJAnimationTestPageState extends State<HJAnimationTestPage> with SingleTickerProviderStateMixin{
  //1.创建AnimationController
  late AnimationController _animationController;
  late Animation _curvedAnimation;
  late Animation _tween;

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

    //3.Tween
    _tween = Tween(begin: 50.0,end: 150.0).animate(_animationController);

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
        // child: Icon(Icons.favorite,color: Colors.red,size: _tween.value,),
        // child: HJAnimationWidget(_tween),
        /// 最终方案：AnimatedBuilder
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (ctx,child){
            return Icon(Icons.favorite,color: Colors.red,size: _tween.value,);
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

/// 将需要执行动画的widget放到一个AnimatedWidget中的build方法中返回
class HJAnimationWidget extends AnimatedWidget{
  // final Animation _animation;
  // HJAnimationWidget(this._animation): super(listenable: _animation);

  HJAnimationWidget(Animation animation): super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> anim = listenable as Animation<double>;
    return Icon(Icons.favorite,color: Colors.red,size: anim.value,);
  }
}
