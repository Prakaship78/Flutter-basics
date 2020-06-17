import 'package:flutter/material.dart';
import './ViewAllButton.dart';

class Card2 extends StatelessWidget {
  Card2({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'coding1' (shape)
        Container(
          width: 160.0,
          height: 210.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xffffffff),
          ),
        ),
        // Adobe XD layer: 'coding1' (shape)
        Container(
          width: 160.0,
          height: 210.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: const AssetImage(''),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0.0, 14.0),
          child: Text(
            'Courses',
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: 16,
              color: const Color(0xcb080000),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Transform.translate(
          offset: Offset(0.0, 30.0),
          child: Text(
            'Courses for new\nstudent ',
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: 14,
              color: const Color(0x80080000),
              fontWeight: FontWeight.w500,
              height: 1.2857142857142858,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Transform.translate(
          offset: Offset(106.0, 172.0),
          child:
              // Adobe XD layer: 'ViewAllButton' (component)
              ViewAllButton(),
        ),
        Transform.translate(
          offset: Offset(115.0, 172.0),
          child: Text(
            'View All',
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: 8,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w500,
              height: 2.25,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
