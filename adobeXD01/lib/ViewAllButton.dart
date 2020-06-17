import 'package:flutter/material.dart';

class ViewAllButton extends StatelessWidget {
  ViewAllButton({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 47.0,
          height: 24.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xff000000),
          ),
        ),
      ],
    );
  }
}
