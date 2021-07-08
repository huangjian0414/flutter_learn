


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_hj/HJWidget.dart';

void main(){

  testWidgets('HJWidget test', (WidgetTester tester) async{

    // 注入Widget
    await tester.pumpWidget(MaterialApp(home: HJKeywords(["abc", "cba", "nba", "mba"])));

    // 在HJKeywords中查找Widget/Text
    final abcText = find.text("abc");
    final cbaText = find.text("cba");
    final icons = find.byIcon(Icons.people);

    // 断言
    expect(abcText, findsOneWidget);
    expect(cbaText, findsOneWidget);
    expect(icons, findsNWidgets(4));

  });


}