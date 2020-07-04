import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password;

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

  navigateToSigninScreen() {
    Navigator.pushReplacementNamed(context, '/SigninPage');
  }

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        AuthResult user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          UserUpdateInfo updateUser = UserUpdateInfo();
          updateUser.displayName = _name;
          print(_name);
          // user.updateProfile(updateUser);
        }
      } catch (e) {
        showError(e.message);
      }
    }
  }

  showError(String errorMessage) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  width: 100,
                  height: 100,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // display name
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Enter name';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          onSaved: (input) => _name = input,
                        ),
                      ),
                      //email
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Enter email';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          onSaved: (input) => _email = input,
                        ),
                      ),
                      //Password
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Password should be atleast 6 char';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          onSaved: (input) => _password = input,
                          obscureText: true,
                        ),
                      ),
                      //submit
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: signUp,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      //redirect to sign up page
                      GestureDetector(
                        onTap: navigateToSigninScreen,
                        child: Text(
                          'Sign In?',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
