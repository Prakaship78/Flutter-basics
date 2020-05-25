import "package:flutter/material.dart";
import 'dart:async';
import 'package:notekeeper/models/note.dart';
import 'package:notekeeper/utils/database_helper.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class NoteDetails extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetails(this.note, this.appBarTitle);
  @override
  _NoteDetailsState createState() =>
      _NoteDetailsState(this.note, this.appBarTitle);
}

class _NoteDetailsState extends State<NoteDetails> {
  static var _priorities = ['High', 'Low'];

  DatabaseHelper helper = DatabaseHelper();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Note note;
  String appBarTitle;
  _NoteDetailsState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    titleController.text = note.title;
    descriptionController.text = note.description;

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                moveToLastScreen();
              }),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: DropdownButton(
                    items: _priorities.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    style: textStyle,
                    value: getPriorityAsString(note.priority),
                    onChanged: (valueSelectedByUser) {
                      setState(() {
                        debugPrint('User Selected $valueSelectedByUser');
                        updatePriorityAInt(valueSelectedByUser);
                      });
                    }),
              ),
              //Second element
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint('Something is chnaged in title text field');
                    updateTitle();
                  },
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),

              //Third element
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: TextField(
                  controller: descriptionController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint(
                        'Something is changed in Description text field ');
                    updateDescription();
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),

              //fourth element
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint('save button clicked');
                            _save();
                          });
                        },
                      ),
                    ),
                    Container(width: 5.0),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint('Delete button clicked');
                            _delete();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // function to go back to last screen
  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  //convert the String priority in the form of integer before saving it to Database
  void updatePriorityAInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  //convert int property to string property and display it to user in dropdown
  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];
        break;
      case 2:
        priority = _priorities[1];
        break;
    }
    return priority;
  }

  //update note title
  void updateTitle() {
    note.title = titleController.text;
  }

  //update note description
  void updateDescription() {
    note.description = descriptionController.text;
  }

  // save database
  void _save() async {
    moveToLastScreen();

    note.date = DateFormat.yMMMd().format(DateTime.now());

    int result;
    if (note.id != null) {
      // case 1: update operation
      result = await helper.updaeNote(note);
    } else {
      //case 2: insert operation
      result = await helper.insertNote(note);
    }
    if (result != 0) {
      //success
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {
      //failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  // delete a note
  void _delete() async {
    moveToLastScreen();
    // case 1: if a user is trying to delete a NEW NOTE ie. he has to come to
    // details page by pressing the FAB of Notelist page
    if (note.id == null) {
      _showAlertDialog('Status', "No Note was Deleted");
      return;
    }

    // case 2: user is trying to delete the old note that has valid id
    int result = await helper.deleteNote(note.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Note Deleted Successfully');
    } else
      (_showAlertDialog('Status', 'Error occured While deleting Note '));
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
