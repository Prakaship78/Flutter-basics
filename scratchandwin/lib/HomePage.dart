import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO import images
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage lucky = AssetImage('images/rupee.png');
  AssetImage unlucky = AssetImage('images/sadFace.png');

// TODO get an array
  List<String> itemArray;
  int luckyNumber;
  String message = '';
  int chances = 3;

//TODO init array with 25 element
  @override
  void initState() {
    super.initState();
    itemArray = List<String>.generate(25, (index) => 'empty');
    generateRandomNumber();
  }

  generateRandomNumber() {
    int rnd = Random().nextInt(25);
    print(rnd);
    setState(() {
      luckyNumber = rnd;
    });
  }

// TODO define getimage method
  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case 'lucky':
        return lucky;
        break;
      case 'unlucky':
        return unlucky;
        break;
    }
    return circle;
  }

//TODO play game method
  playGame(int index) {
    if (chances > 0) {
      if (index == luckyNumber) {
        setState(() {
          itemArray[index] = 'lucky';
          message = 'Congrates You won';
          chances = -1;
        });
      } else if (index != luckyNumber && chances > 0) {
        setState(() {
          itemArray[index] = 'unlucky';
          message = 'You have ${chances - 1} left';
          chances--;
        });
        if (chances == 0) {
          setState(() {
            message = 'You loose';
          });
        }
      }
    }
  }

//TODO Show all
  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, 'unlucky');
      itemArray[luckyNumber] = 'lucky';
      chances = -1;
    });
  }

//TODO reset all
  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, 'empty');
    });
    message = '';
    generateRandomNumber();
    chances = 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratch And Win'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: GridView.builder(
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1.0,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: itemArray.length,
            itemBuilder: (BuildContext context, int i) => SizedBox(
              width: 50,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  playGame(i);
                },
                child: Image(image: getImage(i)),
              ),
            ),
          )),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            padding: EdgeInsets.all(30),
            child: Text(
              message,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: RaisedButton(
                onPressed: showAll,
                color: Colors.pink,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Show All',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: RaisedButton(
                onPressed: resetGame,
                color: Colors.pink,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Reset Game',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
