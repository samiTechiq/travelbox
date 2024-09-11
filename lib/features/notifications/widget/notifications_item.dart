import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class NotificationItem extends StatelessWidget {
  final bool isSubTitle;
  final String title;
  final String? subTitle;
  final bool value;
  final void Function(bool) onChange;

  const NotificationItem({
    super.key,
    required this.isSubTitle,
    required this.title,
    this.subTitle,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: NotificationItemMobile(
        isSubTitle: isSubTitle,
        subTitle: subTitle ?? '',
        title: title,
        value: value,
        onChange: onChange,
      ),
      desktopLayout: NotificationItemDesktop(
        isSubTitle: isSubTitle,
        subTitle: subTitle ?? '',
        title: title,
        value: value,
        onChange: onChange,
      ),
    );
  }
}

class NotificationItemMobile extends StatelessWidget {
  final bool isSubTitle;
  final String title;
  final String subTitle;
  final bool value;
  final void Function(bool) onChange;

  const NotificationItemMobile({
    super.key,
    required this.isSubTitle,
    required this.title,
    required this.subTitle,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isSubTitle
              ? Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeading(
                        title,
                        color: R.palette.mediumBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SubHeading(
                        subTitle,
                        color: R.palette.lightGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        maxLines: 3,
                      ),
                    ],
                  ),
                )
              : SubHeading(
                  title,
                  color: R.palette.mediumBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
          FlutterSwitch(
            padding: 3.5.h,
            height: 23.h,
            width: 45.h,
            toggleSize: 15.h,
            value: value,
            onToggle: onChange,
          ),
        ],
      ),
    );
  }
}

class NotificationItemDesktop extends StatelessWidget {
  final bool isSubTitle;
  final String title;
  final String subTitle;
  final bool value;
  final void Function(bool) onChange;

  const NotificationItemDesktop({
    super.key,
    required this.isSubTitle,
    required this.title,
    required this.subTitle,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isSubTitle
              ? Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SubHeading(
                        title,
                        color: R.palette.mediumBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SubHeading(
                        subTitle,
                        color: R.palette.lightGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        maxLines: 3,
                      ),
                    ],
                  ),
                )
              : SubHeading(
                  title,
                  color: R.palette.mediumBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
          FlutterSwitch(
            padding: 3.5.h,
            height: 23.h,
            width: 45.h,
            toggleSize: 15.h,
            value: value,
            onToggle: onChange,
          ),
        ],
      ),
    );
  }
}
