import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'Category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Simple Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyhomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => Category(),
      },
    );
  }
}
