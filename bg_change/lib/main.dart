import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BG Chnager',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Random Background'),
          ),
          body: HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var colors = [
    Colors.accents,
    Colors.amber,
    Colors.black38,
    Colors.blue,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyan,
    Colors.green,
    Colors.yellow,
    Colors.grey,
    Colors.deepPurple,
    Colors.pink
  ];

  var currentColors = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentColors,
      child: Center(
        child: RaisedButton(
          onPressed: setRandomColor,
          color: currentColors,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Text(
            'Change !!',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }

  setRandomColor() {
    var rnd = Random().nextInt(colors.length);
    debugPrint(rnd.toString());
    setState(() {
      currentColors = colors[rnd];
    });
  }
}
