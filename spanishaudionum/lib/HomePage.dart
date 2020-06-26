import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();
  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "One"),
    NumberAudio("two.wav", Colors.brown, "Two"),
    NumberAudio("three.wav", Colors.purple, "Three"),
    NumberAudio("four.wav", Colors.orange, "Four"),
    NumberAudio("five.wav", Colors.blue, "Five"),
    NumberAudio("six.wav", Colors.grey, "Six"),
    NumberAudio("seven.wav", Colors.teal, "Seven"),
    NumberAudio("eight.wav", Colors.yellow, "Eight"),
    NumberAudio("nine.wav", Colors.pink, "Nine"),
    NumberAudio("ten.wav", Colors.green, "Ten"),
  ];

  play(String uri) {
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spanish Numbers'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(image: AssetImage('assets/logo.png')),
              Expanded(
                  child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: numberList.length,
                itemBuilder: (BuildContext context, int i) => SizedBox(
                  height: 50,
                  width: 100,
                  child: RaisedButton(
                    onPressed: () {
                      play(numberList[i].audioUri);
                    },
                    color: numberList[i].buttonColor,
                    child: Text(
                      numberList[i].buttonText,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
