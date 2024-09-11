import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/validator/validator.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';
import 'package:travelbox/utils/widgets/text_fields/app_text_field.dart';

class DateOfBirthWidget extends StatelessWidget {
  final String? day;
  final String? month;
  final String? year;
  final Function()? onPressed;
  final TextEditingController dobDayController;
  final TextEditingController dobMonthController;
  final TextEditingController dobYearController;
  final Function(String) onDOBDateChanged;
  final Function(String) onDOBMonthChanged;
  final Function(String) onDOBYearChanged;

  const DateOfBirthWidget({
    super.key,
    this.day,
    this.month,
    this.year,
    this.onPressed,
    required this.dobDayController,
    required this.dobMonthController,
    required this.dobYearController,
    required this.onDOBDateChanged,
    required this.onDOBMonthChanged,
    required this.onDOBYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: DateOfBirthWidgetMobile(
        day: day,
        month: month,
        year: year,
        onPressed: onPressed,
        dobDayController: dobDayController,
        dobMonthController: dobMonthController,
        dobYearController: dobYearController,
        onDOBDateChanged: onDOBDateChanged,
        onDOBMonthChanged: onDOBMonthChanged,
        onDOBYearChanged: onDOBYearChanged,
      ),
      desktopLayout: DateOfBirthWidgetDesktop(
        day: day,
        month: month,
        year: year,
        onPressed: onPressed,
        dobDayController: dobDayController,
        dobMonthController: dobMonthController,
        dobYearController: dobYearController,
        onDOBDateChanged: onDOBDateChanged,
        onDOBMonthChanged: onDOBMonthChanged,
        onDOBYearChanged: onDOBYearChanged,
      ),
    );
  }
}

class DateOfBirthWidgetDesktop extends StatelessWidget {
  final String? day;
  final String? month;
  final String? year;
  final Function()? onPressed;
  final TextEditingController dobDayController;
  final TextEditingController dobMonthController;
  final TextEditingController dobYearController;
  final Function(String) onDOBDateChanged;
  final Function(String) onDOBMonthChanged;
  final Function(String) onDOBYearChanged;

  const DateOfBirthWidgetDesktop({
    super.key,
    this.day,
    this.month,
    this.year,
    this.onPressed,
    required this.dobDayController,
    required this.dobMonthController,
    required this.dobYearController,
    required this.onDOBDateChanged,
    required this.onDOBMonthChanged,
    required this.onDOBYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    double inputFieldWidth = 0.066.sw;
    return Container(
      height: 47.h,
      decoration: BoxDecoration(
        color: R.palette.appWhiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(width: 1, color: R.palette.textFieldBorderGreyColor),
      ),
      padding: EdgeInsets.only(left: 15.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: InkWell(
              onTap: onPressed,
              child: Row(
                children: [
                  SvgPicture.asset(
                    R.assets.graphics.calendar.path,
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 12.w),
                  SubHeading(
                    AppLocalizations.of(context).date_of_birth,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: R.palette.mediumBlack,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 15.w),
          VerticalDivider(
            width: 1,
            color: R.palette.textFieldBorderGreyColor,
          ),
          GenericTextField(
            borderColor: Colors.transparent,
            textInputType: TextInputType.number,
            textAlign: TextAlign.center,
            width: inputFieldWidth,
            maxLength: 2,
            borderRadius: BorderRadius.zero,
            key: const ValueKey('dobDay'),
            hintText: AppLocalizations.of(context).day,
            hintStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
            useBottomPadding: false,
            controller: dobDayController,
            onChange: (value) {
              onDOBDateChanged(value);
            },
            validator: (value) {
              final pattern = ValidationPattern.day.pattern;
              final result = sl.get<Validator>().validateInput(
                    value!,
                    pattern: pattern,
                  );
              if (result != ValidationResult.valid) {
                return 'Not valid';
              }
              return null;
            },
          ),
          VerticalDivider(
            width: 1,
            color: R.palette.textFieldBorderGreyColor,
          ),
          GenericTextField(
            borderColor: Colors.transparent,
            textInputType: TextInputType.number,
            textAlign: TextAlign.center,
            width: inputFieldWidth,
            maxLength: 2,
            borderRadius: BorderRadius.zero,
            key: const ValueKey('dobMonth'),
            hintText: AppLocalizations.of(context).month,
            hintStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
            useBottomPadding: false,
            controller: dobMonthController,
            onChange: (value) {
              onDOBMonthChanged(value);
            },
            validator: (value) {
              final pattern = ValidationPattern.month.pattern;
              final result = sl.get<Validator>().validateInput(
                    value!,
                    pattern: pattern,
                  );
              if (result != ValidationResult.valid) {
                return 'Not valid';
              }
              return null;
            },
          ),
          VerticalDivider(
            width: 1,
            color: R.palette.textFieldBorderGreyColor,
          ),
          GenericTextField(
            borderColor: Colors.transparent,
            textInputType: TextInputType.number,
            textAlign: TextAlign.center,
            width: inputFieldWidth,
            maxLength: 4,
            borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              // bottomLeft: Radius.zero,
              topRight: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
            key: const ValueKey('dobYear'),
            hintText: AppLocalizations.of(context).year,
            hintStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
            useBottomPadding: false,
            controller: dobYearController,
            onChange: (value) {
              onDOBYearChanged(value);
            },
            validator: (value) {
              final pattern = ValidationPattern.year.pattern;
              final result = sl.get<Validator>().validateInput(
                    value!,
                    pattern: pattern,
                  );
              if (result != ValidationResult.valid) {
                return 'Not valid';
              }
              return null;
            },
          ),
          // SizedBox(width: 5.w),
        ],
      ),
    );
  }
}

class DateOfBirthWidgetMobile extends StatelessWidget {
  final String? day;
  final String? month;
  final String? year;
  final Function()? onPressed;
  final TextEditingController dobDayController;
  final TextEditingController dobMonthController;
  final TextEditingController dobYearController;
  final Function(String) onDOBDateChanged;
  final Function(String) onDOBMonthChanged;
  final Function(String) onDOBYearChanged;

  const DateOfBirthWidgetMobile({
    super.key,
    this.day,
    this.month,
    this.year,
    this.onPressed,
    required this.dobDayController,
    required this.dobMonthController,
    required this.dobYearController,
    required this.onDOBDateChanged,
    required this.onDOBMonthChanged,
    required this.onDOBYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    double inputFieldWidth = 0.125.sw;
    return Container(
      height: 47.h,
      decoration: BoxDecoration(
        color: R.palette.appWhiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(width: 1, color: R.palette.textFieldBorderGreyColor),
      ),
      padding: EdgeInsets.only(left: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: onPressed,
              child: Row(
                children: [
                  SvgPicture.asset(
                    R.assets.graphics.calendar.path,
                    width: 22.w,
                    height: 22.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 6.w),
                  SubHeading(
                    AppLocalizations.of(context).date_of_birth,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: R.palette.mediumBlack,
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(
            width: 1,
            color: R.palette.lightGray,
          ),
          GenericTextField(
            borderColor: Colors.transparent,
            textInputType: TextInputType.number,
            textAlign: TextAlign.center,
            width: inputFieldWidth,
            maxLength: 2,
            borderRadius: BorderRadius.zero,
            key: const ValueKey('dobDay'),
            hintText: AppLocalizations.of(context).day,
            hintStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: R.palette.mediumBlack,
            ),
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: R.palette.mediumBlack,
            ),
            useBottomPadding: false,
            controller: dobDayController,
            onChange: (value) {
              onDOBDateChanged(value);
            },
            validator: (value) {
              final pattern = ValidationPattern.day.pattern;
              final result = sl.get<Validator>().validateInput(
                    value!,
                    pattern: pattern,
                  );
              if (result != ValidationResult.valid) {
                return 'Not valid';
              }
              return null;
            },
          ),
          VerticalDivider(
            width: 1,
            color: R.palette.textFieldBorderGreyColor,
          ),
          GenericTextField(
            borderColor: Colors.transparent,
            textInputType: TextInputType.number,
            textAlign: TextAlign.center,
            width: inputFieldWidth,
            maxLength: 2,
            borderRadius: BorderRadius.zero,
            key: const ValueKey('dobMonth'),
            hintText: AppLocalizations.of(context).month,
            hintStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: R.palette.mediumBlack,
            ),
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: R.palette.mediumBlack,
            ),
            useBottomPadding: false,
            controller: dobMonthController,
            onChange: (value) {
              onDOBMonthChanged(value);
            },
            validator: (value) {
              final pattern = ValidationPattern.month.pattern;
              final result = sl.get<Validator>().validateInput(
                    value!,
                    pattern: pattern,
                  );
              if (result != ValidationResult.valid) {
                return 'Not valid';
              }
              return null;
            },
          ),
          VerticalDivider(
            width: 1,
            color: R.palette.textFieldBorderGreyColor,
          ),
          GenericTextField(
            borderColor: Colors.transparent,
            textInputType: TextInputType.number,
            textAlign: TextAlign.center,
            width: inputFieldWidth,
            maxLength: 4,
            borderRadius: BorderRadius.only(
              // topLeft: Radius.zero,
              // bottomLeft: Radius.zero,
              topRight: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
            key: const ValueKey('dobYear'),
            hintText: AppLocalizations.of(context).year,
            hintStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: R.palette.mediumBlack,
            ),
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: R.palette.mediumBlack,
            ),
            useBottomPadding: false,
            controller: dobYearController,
            onChange: (value) {
              onDOBYearChanged(value);
            },
            validator: (value) {
              final pattern = ValidationPattern.year.pattern;
              final result = sl.get<Validator>().validateInput(
                    value!,
                    pattern: pattern,
                  );
              if (result != ValidationResult.valid) {
                return 'Not valid';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
