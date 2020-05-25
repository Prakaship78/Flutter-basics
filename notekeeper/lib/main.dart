import 'package:flutter/material.dart';
import 'package:notekeeper/screens/note_details.dart';
import 'screens/note_list.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:notekeeper/models/note.dart';
import 'package:notekeeper/utils/database_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notekeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: NoteList(),
    );
  }
}
