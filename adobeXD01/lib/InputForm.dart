import 'package:flutter/material.dart';
import './InputLabel.dart';

class InputForm extends StatelessWidget {
  InputForm({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          'YOUR WORK EMAIL',
          style: TextStyle(
            fontFamily: 'Futura',
            fontSize: 28,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        Transform.translate(
          offset: Offset(0.0, 48.0),
          child:
              // Adobe XD layer: 'InputLabel' (component)
              InputLabel(),
        ),
        Transform.translate(
          offset: Offset(0.0, 130.0),
          child:
              // Adobe XD layer: 'InputPasswordLabel' (component)
              InputLabel(),
        ),
      ],
    );
  }
}
