import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/resources/r.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width < 520 ? 91.h : 91.h,
      width: MediaQuery.of(context).size.width < 520 ? 91.w : 91.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: R.palette.boxGreyColor,
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 5.0, //extend the shadow
              offset: const Offset(
                5.0, // Move to right 5  horizontally
                5.0, // Move to bottom 5 Vertically
              ),
            )
          ],
          color: R.palette.appWhiteColor),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: R.palette.accentOrangeColor),
          child: Image.asset(
            R.assets.graphics.girlImage.path,
          ),
        ),
      ),
    );
  }
}
