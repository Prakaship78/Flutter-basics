import 'package:flutter/material.dart';
import './Appbar.dart';
import './SearchField.dart';
import './Card2.dart';
import './Card3.dart';
import './Card1.dart';
import './Card4.dart';

class CourcesScreen extends StatelessWidget {
  CourcesScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212226),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(320.0, 43.0),
            child:
                // Adobe XD layer: 'peeps' (shape)
                Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 40.0),
            child:
                // Adobe XD layer: 'Appbar' (component)
                Appbar(),
          ),
          Transform.translate(
            offset: Offset(16.0, 90.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: 28,
                  color: const Color(0xffffffff),
                ),
                children: [
                  TextSpan(
                    text: 'Hy ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'Mark',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 246.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: 24,
                  color: const Color(0xffffffff),
                ),
                children: [
                  TextSpan(
                    text: 'Our Popular ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'Course',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 287.0),
            child: Text(
              'We would recommend these courses',
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: 14,
                color: const Color(0xcbffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(309.0, 252.0),
            child: Text(
              'View all',
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: 14,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 156.0),
            child:
                // Adobe XD layer: 'SearchField' (component)
                SearchField(),
          ),
          Transform.translate(
            offset: Offset(200.0, 357.0),
            child:
                // Adobe XD layer: 'Card2' (component)
                Card2(),
          ),
          Transform.translate(
            offset: Offset(30.0, 569.0),
            child:
                // Adobe XD layer: 'Card3' (component)
                Card3(),
          ),
          Transform.translate(
            offset: Offset(30.0, 343.0),
            child:
                // Adobe XD layer: 'Card1' (component)
                Card1(),
          ),
          Transform.translate(
            offset: Offset(202.0, 583.0),
            child:
                // Adobe XD layer: 'Card4' (component)
                Card4(),
          ),
        ],
      ),
    );
  }
}
