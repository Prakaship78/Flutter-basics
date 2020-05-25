import 'package:flutter/material.dart';
import 'package:notekeeper/screens/note_details.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:notekeeper/models/note.dart';
import 'package:notekeeper/utils/database_helper.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add note',
        onPressed: () {
          debugPrint('floating action button tapped');
          navigateToDetail(Note('', '', 2), 'Add Note');
        },
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle titlestyle = Theme.of(context).textTheme.subtitle1;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  getpriorityColor(this.noteList[position].priority),
              child: getPriorityIcon(this.noteList[position].priority),
            ),
            title: Text(
              this.noteList[position].title,
              style: titlestyle,
            ),
            subtitle: Text(this.noteList[position].date, style: titlestyle),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                _delete(context, noteList[position]);
              },
            ),
            onTap: () {
              debugPrint('List tile press');
              navigateToDetail(this.noteList[position], 'Edit Note');
            },
          ),
        );
      },
    );
  }

  //Return priority color
  Color getpriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.yellow;
    }
  }

// return priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  //Function to delte a listview
  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackbar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackbar);
  }

  // function to go to next screen
  void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(
        context,
        (MaterialPageRoute(builder: (context) {
          return NoteDetails(note, title);
        })));
    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
