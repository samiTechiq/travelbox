import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class PolicyDetailWidget extends StatelessWidget {
  final bool enableCheck;
  final String text;
  final double? iconTextWidth;
  final double? iconWidth;
  final TextDecoration? textDec;
  final double? bottomPadding;
  final String? subText;
  final double? fontSize;

  const PolicyDetailWidget({
    super.key,
    required this.text,
    this.subText,
    this.enableCheck = false,
    this.iconWidth,
    this.textDec,
    this.fontSize,
    this.bottomPadding,
    this.iconTextWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: PolicyDetailWidgetMobile(
          text: text,
          enableCheck: enableCheck,
          iconTextWidth: iconTextWidth,
          iconWidth: iconWidth,
          bottomPadding: bottomPadding,
          subText: subText,
          fontSize: fontSize,
        ),
        desktopLayout: PolicyDetailWidgetDesktop(
          text: text,
          enableCheck: enableCheck,
          iconTextWidth: iconTextWidth,
          iconWidth: iconWidth,
          bottomPadding: bottomPadding,
          subText: subText,
          fontSize: fontSize,
        ));
  }
}

class PolicyDetailWidgetMobile extends StatelessWidget {
  final bool enableCheck;
  final String text;
  final double? iconTextWidth;
  final double? iconWidth;
  final TextDecoration? textDec;
  final double? bottomPadding;
  final String? subText;
  final double? fontSize;

  const PolicyDetailWidgetMobile({
    Key? key,
    required this.text,
    this.subText,
    this.enableCheck = false,
    this.iconWidth,
    this.textDec,
    this.fontSize,
    this.bottomPadding,
    this.iconTextWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding?.h ?? 15.h),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: !enableCheck,
                    child: Image.asset(
                      R.assets.graphics.checkIcon.path,
                      width: iconWidth?.w ?? 15.w,
                    )),
                SizedBox(
                  width: iconTextWidth?.w ?? 8.w,
                ),
                Flexible(
                  child: SubHeading(
                    text,
                    fontSize: fontSize?.sp ?? 16.sp,
                    decoration: textDec,
                    fontWeight: FontWeight.w400,
                    maxLines: 5,
                    color: R.palette.lightGray,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SubHeading(
            subText ?? "",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: R.palette.lightGray,
          ),
        ],
      ),
    );
  }
}

class PolicyDetailWidgetDesktop extends StatelessWidget {
  final bool enableCheck;
  final String text;
  final double? iconTextWidth;
  final double? iconWidth;
  final TextDecoration? textDec;
  final double? bottomPadding;
  final String? subText;
  final double? fontSize;

  const PolicyDetailWidgetDesktop({
    Key? key,
    required this.text,
    this.subText,
    this.enableCheck = false,
    this.iconWidth,
    this.textDec,
    this.fontSize,
    this.bottomPadding,
    this.iconTextWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding?.h ?? 15.h),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: !enableCheck,
                    child: Image.asset(
                      R.assets.graphics.checkIcon.path,
                      width: iconWidth?.w ?? 12.w,
                    )),
                SizedBox(
                  width: iconTextWidth?.w ?? 8.w,
                ),
                Flexible(
                  child: SubHeading(
                    text,
                    fontSize: fontSize ?? 7,
                    decoration: textDec,
                    fontWeight: FontWeight.w400,
                    maxLines: 3,
                    color: R.palette.lightGray,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SubHeading(
            subText ?? "",
            fontSize: fontSize ?? 8,
            fontWeight: FontWeight.w400,
            color: R.palette.lightGray,
          ),
        ],
      ),
    );
  }
}
