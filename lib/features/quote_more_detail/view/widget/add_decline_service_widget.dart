import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

// ignore: must_be_immutable
class AddDeclineServiceWidget extends StatelessWidget {
  String? country;
  String? money;
  final bool isAdd;
  final VoidCallback? onPress;

  AddDeclineServiceWidget({
    super.key,
    required this.country,
    required this.money,
    required this.isAdd,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: AddDeclineServiceWidgetMobile(
          isAdd: isAdd,
          country: country,
          money: money,
        ),
        desktopLayout: AddDeclineServiceWidgetDesktop(
          isAdd: isAdd,
          country: country,
          money: money,
        ));
  }
}

// ignore: must_be_immutable
class AddDeclineServiceWidgetMobile extends StatelessWidget {
  String? country;
  String? money;
  final bool isAdd;
  final VoidCallback? onPress;

  AddDeclineServiceWidgetMobile({
    super.key,
    required this.country,
    required this.money,
    required this.isAdd,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: R.palette.appWhiteColor,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(width: 1, color: R.palette.textFieldBorderGreyColor),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubHeading(
            '$country\$$money',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isAdd
                ? R.palette.mediumBlack
                : R.palette.textFieldHintGreyColor,
          ),
          InkWell(
            onTap: onPress,
            child: SvgPicture.asset(
              isAdd
                  ? R.assets.graphics.bluePlus.path
                  : R.assets.graphics.blackMinus.path,
              width: 24.w,
              height: 24.w,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class AddDeclineServiceWidgetDesktop extends StatelessWidget {
  String? country;
  String? money;
  final bool isAdd;
  final VoidCallback? onPress;

  AddDeclineServiceWidgetDesktop({
    super.key,
    required this.country,
    required this.money,
    required this.isAdd,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: R.palette.appWhiteColor,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(width: 1, color: R.palette.textFieldBorderGreyColor),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubHeading(
            '$country\$$money',
            fontSize: 5,
            fontWeight: FontWeight.w500,
            color: isAdd
                ? R.palette.mediumBlack
                : R.palette.textFieldHintGreyColor,
          ),
          InkWell(
            onTap: onPress,
            child: SvgPicture.asset(
              isAdd
                  ? R.assets.graphics.bluePlus.path
                  : R.assets.graphics.blackMinus.path,
              width: 24.h,
              height: 24.h,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
