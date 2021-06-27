
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_learn/StateTest/Provider/HJUserViewModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: HJEventResponsePage(),
    );
  }
}

final eventBus = EventBus();

class HJEventResponsePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('事件响应'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HJButtom(),
            HJText()
          ],
        ),
      ),
    );
  }
}


class HJButtom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Text('点击'),
        onPressed: (){
          // eventBus.fire('helloworld');
          UserInfo user = UserInfo('张三', 18, 180);
          eventBus.fire(user);
          }
    );
  }
}

class HJText extends StatefulWidget {

  @override
  _HJTextState createState() => _HJTextState();
}

class _HJTextState extends State<HJText> {
  String _msg = 'hello';

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

  @override
  Widget build(BuildContext context) {
    return Text(_msg);
  }
}
