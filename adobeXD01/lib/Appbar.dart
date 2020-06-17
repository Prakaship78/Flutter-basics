import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './Logo.dart';

class Appbar extends StatelessWidget {
  Appbar({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Icon open-menu' (shape)
        SvgPicture.string(
          _svg_x11els,
          allowDrawingOutsideViewBox: true,
        ),
        Transform.translate(
          offset: Offset(121.0, 0.0),
          child:
              // Adobe XD layer: 'Logo' (component)
              Logo(),
        ),
        Transform.translate(
          offset: Offset(304.0, 0.0),
          child:
              // Adobe XD layer: 'peeps' (shape)
              Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(20.0, 20.0)),
              image: DecorationImage(
                image: const AssetImage(''),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

const String _svg_x11els =
    '<svg viewBox="0.0 0.0 30.0 30.0" ><path  d="M 0 0 L 0 2.791385412216187 L 30 2.791385412216187 L 30 0 L 0 0 Z M 0 13.59855937957764 L 0 16.49063301086426 L 27.81631469726562 16.49063301086426 L 27.81631469726562 13.59855937957764 L 0 13.59855937957764 Z M 0 27.3344783782959 L 0 30.00000190734863 L 26.27934646606445 30.00000190734863 L 26.27934646606445 27.3344783782959 L 0 27.3344783782959 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" /></svg>';
