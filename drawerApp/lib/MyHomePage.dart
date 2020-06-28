import 'package:flutter/material.dart';
import 'package:drawerApp/MyHomePage.dart';
import 'Category.dart';

class MyhomePage extends StatefulWidget {
  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Simple Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyhomePage(),
    );
  }
}
