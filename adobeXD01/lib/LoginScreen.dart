import 'package:flutter/material.dart';
import './Logo.dart';
import './InputForm.dart';
import 'package:adobe_xd/page_link.dart';
import './PrimaryButton.dart';
import './CourcesScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212226),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(137.0, 40.0),
            child:
                // Adobe XD layer: 'Logo' (component)
                Logo(),
          ),
          Transform.translate(
            offset: Offset(85.0, 93.0),
            child:
                // Adobe XD layer: 'boy' (shape)
                Container(
              width: 206.0,
              height: 350.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 488.0),
            child:
                // Adobe XD layer: 'InputForm' (component)
                InputForm(),
          ),
          Transform.translate(
            offset: Offset(195.0, 752.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.SlideRight,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => CourcesScreen(),
                ),
              ],
              child:
                  // Adobe XD layer: 'PrimaryButton' (component)
                  PrimaryButton(),
            ),
          ),
          Transform.translate(
            offset: Offset(18.0, 790.0),
            child: SvgPicture.string(
              _svg_l9x9yt,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_l9x9yt =
    '<svg viewBox="18.0 790.0 72.0 1.0" ><path transform="translate(18.0, 790.0)" d="M 0 0 L 7.03125 0 L 14.0625 0 L 21.87500190734863 0 L 25 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(55.0, 790.0)" d="M 0 0 L 4.21875 0 L 8.4375 0 L 13.12500190734863 0 L 15.00000095367432 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(80.0, 790.0)" d="M 0 0 L 2.812499761581421 0 L 5.624999523162842 0 L 8.750000953674316 0 L 10 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
