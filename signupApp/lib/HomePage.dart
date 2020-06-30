import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name, password, email, mobile, college;

  HomePage(
      {Key key,
      @required this.name,
      this.password,
      this.email,
      this.mobile,
      this.college})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Form(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Image(
                image: AssetImage('images/logo.png'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(name),
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text(password),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(email),
              ),
              ListTile(
                leading: Icon(Icons.mobile_screen_share),
                title: Text(mobile),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(college),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
