import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

// ignore: must_be_immutable
class TimePickerWidget extends StatelessWidget {
  final VoidCallback? onDatePicker;
  String? form;
  String? to;

  TimePickerWidget({
    super.key,
    required this.onDatePicker,
    required this.form,
    required this.to,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: TimePickerWidgetMobile(
          onDatePicker: onDatePicker,
          form: form,
          to: to,
        ),
        desktopLayout: TimePickerWidgetDesktop(
          onDatePicker: onDatePicker,
          form: form,
          to: to,
        ));
  }
}

// ignore: must_be_immutable
class TimePickerWidgetMobile extends StatelessWidget {
  final VoidCallback? onDatePicker;
  String? form;
  String? to;

  TimePickerWidgetMobile({
    super.key,
    required this.onDatePicker,
    required this.form,
    required this.to,
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: onDatePicker,
            child: SvgPicture.asset(
              R.assets.graphics.calendar.path,
              width: 24.w,
              height: 24.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15.w),
          VerticalDivider(
            width: 1,
            color: R.palette.textFieldBorderGreyColor,
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: SubHeading(
              form ?? AppLocalizations.of(context).From,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
          ),
          VerticalDivider(
            width: 1,
            color: R.palette.textFieldBorderGreyColor,
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: SubHeading(
              to ?? AppLocalizations.of(context).to,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TimePickerWidgetDesktop extends StatelessWidget {
  final VoidCallback? onDatePicker;
  String? form;
  String? to;

  TimePickerWidgetDesktop({
    super.key,
    required this.onDatePicker,
    required this.form,
    required this.to,
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: onDatePicker,
            child: SvgPicture.asset(
              R.assets.graphics.calendar.path,
              width: 24.h,
              height: 24.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 5.w),
          VerticalDivider(
            width: 1,
            color: R.palette.textFieldBorderGreyColor,
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: SubHeading(
              form ?? AppLocalizations.of(context).From,
              fontSize: 4,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
          ),
          VerticalDivider(
            width: 1,
            color: R.palette.textFieldBorderGreyColor,
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: SubHeading(
              to ?? AppLocalizations.of(context).to,
              fontSize: 4,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
          ),
        ],
      ),
    );
  }
}
