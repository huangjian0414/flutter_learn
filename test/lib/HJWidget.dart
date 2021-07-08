

import 'package:flutter/material.dart';

class HJKeywords extends StatelessWidget {
  final List<String> keywords;
  HJKeywords(this.keywords);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: keywords.map((key) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text(key),
          );
        }).toList(),
      ),
    );
  }
}