import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 180.0,
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.0),
            ),
            color: const Color(0xffffffff),
          ),
        ),
        Transform.translate(
          offset: Offset(53.0, 15.0),
          child: Text(
            'Sign In',
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: 24,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
