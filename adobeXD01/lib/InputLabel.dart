import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputLabel extends StatelessWidget {
  InputLabel({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset(1.0, 58.0),
          child:
              // Adobe XD layer: 'text_path' (shape)
              SvgPicture.string(
            _svg_dkvulo,
            allowDrawingOutsideViewBox: true,
          ),
        ),
        Transform.translate(
          offset: Offset(0.0, 24.0),
          child:
              // Adobe XD layer: 'input_text' (text)
              Text(
            'prakaship78@gmail.com',
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: 20,
              color: const Color(0xbcf7f2f2),
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        // Adobe XD layer: 'single_line_input_l…' (text)
        Text(
          'Email:',
          style: TextStyle(
            fontFamily: 'Futura',
            fontSize: 20,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

const String _svg_dkvulo =
    '<svg viewBox="1.0 58.0 342.0 1.0" ><path transform="translate(0.0, -6.0)" d="M 0.9999999403953552 64 L 342.9999694824219 64" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
