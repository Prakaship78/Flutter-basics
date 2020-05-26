import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, sum = 0;
  double divide = 0.0;
  final TextEditingController t1 = TextEditingController(text: '');
  final TextEditingController t2 = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Output:$sum',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Number 1',
              ),
              controller: t1,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Number 2',
              ),
              controller: t2,
            ),
            Padding(padding: EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    debugPrint('Add button clicked');
                    doAddition();
                  },
                  child: Text(
                    '+',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  color: Colors.greenAccent,
                ),
                MaterialButton(
                  onPressed: () {
                    debugPrint('Sub button clicked');
                    doSubtraction();
                  },
                  child: Text(
                    '-',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  color: Colors.greenAccent,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    debugPrint('Mul button clicked');
                    doMultiply();
                  },
                  child: Text(
                    '*',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  color: Colors.greenAccent,
                ),
                MaterialButton(
                  onPressed: () {
                    debugPrint('Div button clicked');
                    doDivide();
                  },
                  child: Text(
                    '/',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  color: Colors.greenAccent,
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    debugPrint('clear button clicked');
                    doClear();
                  },
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.greenAccent,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void doAddition() {
    num1 = int.parse(t1.text);
    num2 = int.parse(t2.text);
    setState(() {
      sum = num1 + num2;
    });
  }

  void doSubtraction() {
    num1 = int.parse(t1.text);
    num2 = int.parse(t2.text);
    setState(() {
      sum = num1 - num2;
    });
  }

  void doMultiply() {
    num1 = int.parse(t1.text);
    num2 = int.parse(t2.text);
    setState(() {
      sum = num1 * num2;
    });
  }

  void doDivide() {
    num1 = int.parse(t1.text);
    num2 = int.parse(t2.text);
    setState(() {
      sum = num1 ~/ num2;
    });
  }

  void doClear() {
    setState(() {
      t1.text = '0';
      t2.text = '0';
      sum = 0;
    });
  }
}
