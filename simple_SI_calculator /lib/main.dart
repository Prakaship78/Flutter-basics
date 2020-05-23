import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Simple Interest Calculator',
    debugShowCheckedModeBanner: false,
    home: SiForm(),
    theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        brightness: Brightness.dark),
  ));
}

class SiForm extends StatefulWidget {
  @override
  _SiFormState createState() => _SiFormState();
}

class _SiFormState extends State<SiForm> {
  var _formKey = GlobalKey<FormState>();

  final _minPadding = 5.0;
  var _currencies = ['Rupees', 'Dollar', 'Pounds'];
  var _currentItemSelected = '';

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  String displayResult = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Interest calculator'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(_minPadding * 2),
            child: ListView(
              children: <Widget>[
                getAssetImage(),
                Padding(
                  padding:
                      EdgeInsets.only(top: _minPadding, bottom: _minPadding),
                  child: TextFormField(
                    controller: principalController,
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0,
                        ),
                        labelText: 'Principal',
                        labelStyle: textStyle,
                        hintText: 'Enter Principal e.g. 1200',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter Principal amount';
                      } else if (double.tryParse(value) == null) {
                        return 'Please enter valid Principal Amount';
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: _minPadding, bottom: _minPadding),
                  child: TextFormField(
                    controller: roiController,
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter Rate of Interest';
                      } else if (double.tryParse(value) == null) {
                        return 'Please enter valid Rate of Interest';
                      }
                    },
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.yellow,
                          fontSize: 15.0,
                        ),
                        labelText: 'Rate of Interest',
                        labelStyle: textStyle,
                        hintText: 'In percent',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: _minPadding, bottom: _minPadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter Time';
                            } else if (double.tryParse(value) == null) {
                              return 'Please enter valid Time';
                            }
                          },
                          controller: termController,
                          keyboardType: TextInputType.number,
                          style: textStyle,
                          decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 15.0,
                              ),
                              labelText: 'In Terms',
                              labelStyle: textStyle,
                              hintText: 'Time in years',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      Container(
                        width: _minPadding * 5,
                      ),
                      Expanded(
                        child: DropdownButton(
                            items: _currencies.map((String value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            value: _currentItemSelected,
                            onChanged: (String newValueSelected) {
                              //your coede here
                              _onDropItemSelected(newValueSelected);
                            }),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: _minPadding, bottom: _minPadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                this.displayResult = _calculateTotalreturns();
                              }
                            });
                          },
                          color: Theme.of(context).accentColor,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text(
                            'Calculate',
                            textScaleFactor: 1.5,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          },
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Reset',
                            textScaleFactor: 1.5,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: _minPadding, bottom: _minPadding),
                  child: Text(
                    displayResult,
                    style: textStyle,
                  ),
                )
              ],
            )),
      ),
    );
  }

  //Get image function
  Widget getAssetImage() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(
      image: assetImage,
      width: 125,
      height: 125,
    );
    return Container(
      margin: EdgeInsets.all(_minPadding * 10),
      child: image,
    );
  }

// Drop Down menu selected item function
  void _onDropItemSelected(newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

// To calculate function
  String _calculateTotalreturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;
    String result =
        'After $term years, your Investment wille be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

// Reset function
  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];
  }

  bool checkNumber(String value) {
    try {
      num.parse(value);
    } on FormatException {
      return true;
    }
    return false;
  }
}
