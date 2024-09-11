import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_square_box.dart';

class GenericCheckbox extends StatelessWidget {
  final bool checkValue;
  final Color? enabledPrimaryBlue;
  final String title;
  final double? verticalHeight;
  final double? rowWidgetsWidth;
  final Color? color;
  final Color? unFillBackColor;
  final Color? outerBorderColor;
  final Color? innerBoxColor;
  final Color? iconColor;
  final double fontSize;
  final VoidCallback onTap;
  final double iconSize;
  final double? squareBoxSize;

  const GenericCheckbox({
    Key? key,
    required this.checkValue,
    required this.title,
    this.unFillBackColor,
    this.enabledPrimaryBlue,
    this.rowWidgetsWidth,
    this.outerBorderColor,
    this.fontSize = 16,
    this.iconColor,
    this.iconSize = 14,
    this.color,
    this.verticalHeight,
    required this.onTap,
    this.innerBoxColor,
    this.squareBoxSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: verticalHeight?.h ?? 23.h),
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: SquareBox(
              iconColor: iconColor,
              innerBoxColor: innerBoxColor ?? R.palette.white,
              unFillBackColor: unFillBackColor ?? R.palette.white,
              border: Border.all(
                color: R.palette.lightGrey,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              checkValue: checkValue,
              squareBoxSize: squareBoxSize ?? 5,
              iconSize: iconSize,
            ),
          ),
          SizedBox(
            width: rowWidgetsWidth?.w ?? 13.w,
          ),
          Expanded(
            child: SubHeading(
              title,
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: color ?? R.palette.appWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
