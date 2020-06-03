import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 180.0.w,
          height: 60.0.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.0.w),
            ),
            color: const Color(0xffffffff),
          ),
        ),
      ],
    );
  }
}
