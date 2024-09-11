import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

class Eclipse extends StatelessWidget {
  final String text;
  final double totalSize;
  final double circleSize;
  final double fontSize;
  final Color? textColor;

  const Eclipse({
    Key? key,
    required this.text,
    this.circleSize = 102,
    this.fontSize = 36,
    this.totalSize = 114,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          width: totalSize.w,
          height: totalSize.w,
        ),
        Container(
          width: circleSize.w,
          height: circleSize.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: R.palette.appPrimaryBlue,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: circleSize.w,
            height: circleSize.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: R.palette.yellowColor,
            ),
            child: Center(
              child: SubHeading(
                text,
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
