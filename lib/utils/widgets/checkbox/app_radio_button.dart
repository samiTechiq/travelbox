import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

class GenericRadioButton extends StatelessWidget {
  final bool checkValue;
  final Color? enabledPrimaryBlue;
  final String title;
  final double? verticalHeight;
  final double? rowWidgetsWidth;
  final Color? color;
  final Color? unFillBackColor;
  final Color? outerBorderColor;
  final VoidCallback onTap;
  final double itemFontSize;

  const GenericRadioButton({
    Key? key,
    required this.checkValue,
    required this.title,
    this.unFillBackColor,
    this.enabledPrimaryBlue,
    this.rowWidgetsWidth,
    this.outerBorderColor,
    this.color,
    this.verticalHeight,
    required this.onTap,
    this.itemFontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.only(top: verticalHeight?.h ?? 18.h),
        child: Row(
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                height:  18.h,
                width:  18.w,
                // height: constraints.maxWidth > 700 && kIsWeb ? 30.h : 18.h,
                // width: constraints.maxWidth > 700 && kIsWeb ? 30.h : 18.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: unFillBackColor ?? R.palette.textBackgroundBlueColor,
                    border: Border.all(
                        color: checkValue
                            ? enabledPrimaryBlue ?? R.palette.appWhiteColor
                            : outerBorderColor ?? R.palette.appWhiteColor,
                        width: 2)),
                child: checkValue
                    ? Container(
                        margin: const EdgeInsets.all(2),
                        height: 10.h,
                        width: 10.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color:
                                enabledPrimaryBlue ?? R.palette.appWhiteColor))
                    : const SizedBox(),
              ),
            ),
            SizedBox(
              width: rowWidgetsWidth?.w ?? 13.w,
            ),
            Expanded(
              child: SubHeading(
                title,
                fontWeight: FontWeight.w400,
                fontSize: itemFontSize,
                color: color ?? R.palette.appWhiteColor,
              ),
            )
          ],
        ),
      );
    });
  }
}
