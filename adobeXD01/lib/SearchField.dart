import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset(0.0, 2.0),
          child: Container(
            width: 344.0,
            height: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: const Color(0xffffffff),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(314.0, 17.0),
          child: Container(
            width: 1.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: const Color(0xff000000),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(286.0, 0.0),
          child: Container(
            width: 58.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              color: const Color(0xff212226),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(296.0, 11.0),
          child:
              // Adobe XD layer: 'Icon awesome-search' (shape)
              SvgPicture.string(
            _svg_7bsvw1,
            allowDrawingOutsideViewBox: true,
          ),
        ),
        Transform.translate(
          offset: Offset(26.0, 18.0),
          child: Text(
            'Looking For ..',
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: 18,
              color: const Color(0x6c0b0000),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}

const String _svg_7bsvw1 =
    '<svg viewBox="296.0 11.0 35.0 36.0" ><path transform="translate(296.0, 11.0)" d="M 34.71761322021484 31.12430381774902 L 27.86346054077148 24.11483192443848 C 27.55409812927246 23.7984561920166 27.13473701477051 23.62269401550293 26.69474983215332 23.62269401550293 L 25.57416152954102 23.62269401550293 C 27.47159767150879 21.14090347290039 28.59906196594238 18.01933288574219 28.59906196594238 14.62357139587402 C 28.59906196594238 6.545454978942871 22.19864845275879 0 14.29953098297119 0 C 6.400414943695068 0 0 6.545454978942871 0 14.62357139587402 C 0 22.70168876647949 6.400415420532227 29.24714279174805 14.29953098297119 29.24714279174805 C 17.62004852294922 29.24714279174805 20.67244911193848 28.09412956237793 23.09924507141113 26.15369415283203 L 23.09924507141113 27.29967880249023 C 23.09924507141113 27.7496337890625 23.2711124420166 28.17849540710449 23.58047866821289 28.494873046875 L 30.43462753295898 35.50434494018555 C 31.08085632324219 36.16521835327148 32.12582397460938 36.16521835327148 32.76517486572266 35.50434494018555 L 34.71073913574219 33.51469421386719 C 34.71073913574219 33.51469421386719 35.35696792602539 31.78517532348633 34.71761322021484 31.12430191040039 Z M 14.29953098297119 23.62269401550293 C 9.439064979553223 23.62269401550293 5.499820232391357 19.60120964050293 5.499820232391357 14.62357139587402 C 5.499820232391357 9.652963638305664 9.432190895080566 5.62445068359375 14.29953098297119 5.62445068359375 C 19.15999794006348 5.62445068359375 23.09924507141113 9.645933151245117 23.09924507141113 14.62357139587402 C 23.09924507141113 19.59418106079102 19.16687202453613 23.62269401550293 14.29953098297119 23.62269401550293 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
