import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Logo({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          'C',
          style: TextStyle(
            fontFamily: 'Futura',
            fontSize: 32,
            color: const Color(0xfff4b000),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        Transform.translate(
          offset: Offset(20.0, 4.0),
          child: Text(
            'ourses',
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: 28,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
