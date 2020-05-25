import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import "package:notekeeper/models/note.dart";

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // singleton database helper
  static Database _database; // create singleton database

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); // named constructor to create instance

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both android and ios to store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    //open/create database at given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colTitle TEXT,$colDescription Text, $colPriority INTEGER, $colDate TEXT  )');
  }

  // Fetch operation: Get all note object from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

  // INsert operation: Insert a Note object to Database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  // Upate operation: Update a note and save it to database
  Future<int> updaeNote(Note note) async {
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  // Delete operation: delete a note object from database
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $noteTable where $colId = $id');
    return result;
  }

  // Get number of note objects from database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (x) FROM $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //get the 'Map List' [List<Map>] and convert it to 'Note List'[List<Note>]
  Future<List<Note>> getNoteList() async {
    var noteMapList = await getNoteMapList(); // get 'Map List from database
    int count = noteMapList.length; // count the no of map entries in db

    List<Note> notelist = List<Note>();
    //for loop to create 'Note List' froma 'Map List'
    for (var i = 0; i < count; i++) {
      notelist.add(Note.fromMapObject(noteMapList[i]));
    }

    return notelist;
  }
}
