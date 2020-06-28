import 'package:flutter/material.dart';
import 'Category.dart';

class MyhomePage extends StatefulWidget {
  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Prakash'),
              accountEmail: Text('Prakaship78@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text('PS'),
              ),
            ),
            ListTile(
              title: Text('Category'),
              trailing: Icon(Icons.card_travel),
              onTap: () => Navigator.of(context).pushNamed('/a'),
            )
          ],
        ),
      ),
    );
  }
}
