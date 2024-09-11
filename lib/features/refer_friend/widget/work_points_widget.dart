import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

class WorkPoints extends StatelessWidget {
  final String index;
  final String title;
  final double fontSize;
  final double circleSize;
  final double iconTextSpace;

  const WorkPoints({
    Key? key,
    required this.index,
    required this.title,
    this.circleSize = 25,
    this.fontSize = 14,
    this.iconTextSpace = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: circleSize.w,
          width: circleSize.w,
          decoration: BoxDecoration(
            color: R.palette.appPrimaryBlue,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SubHeading(
              index,
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: R.palette.appWhiteColor,
            ),
          ),
        ),
        SizedBox(
          width: iconTextSpace.w,
        ),
        Expanded(
          child: SubHeading(
            title,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: R.palette.lightGray,
          ),
        )
      ],
    );
  }
}
