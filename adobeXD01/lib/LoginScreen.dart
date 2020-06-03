import 'package:flutter/material.dart';
import './Logo.dart';
import './InputForm.dart';
import './PrimaryButton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812);
    return Scaffold(
      backgroundColor: const Color(0xff070708),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(137.0.w, 40.0.w),
            child:
                // Adobe XD layer: 'Logo' (component)
                Logo(),
          ),
          Transform.translate(
            offset: Offset(85.0.w, 93.0.w),
            child:
                // Adobe XD layer: 'boy' (shape)
                Container(
              width: 206.0.w,
              height: 350.6.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/peeps.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0.w, 488.0.h),
            child:
                // Adobe XD layer: 'InputForm' (component)
                InputForm(),
          ),
          Transform.translate(
            offset: Offset(195.0.w, 752.0.h),
            child:
                // Adobe XD layer: 'PrimaryButton' (component)
                PrimaryButton(),
          ),
          Transform.translate(
            offset: Offset(248.0.w, 767.0.h),
            child: Text(
              'Sign In',
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: 24.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(18.0.w, 790.0.h),
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
