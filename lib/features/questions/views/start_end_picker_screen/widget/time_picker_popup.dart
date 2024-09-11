import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/custom_calendar.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class TimePickerPopup extends StatelessWidget {
  final Function(DateTime, DateTime) onApplyClick;

  final Function() onCancelClick;

  final DateTime? initialStartDate;

  final DateTime? initialEndDate;

  final DateTime? minimumDate;

  final DateTime? maximumDate;

  final bool rangeDate;

  const TimePickerPopup({
    super.key,
    required this.onApplyClick,
    required this.onCancelClick,
    this.initialStartDate,
    this.initialEndDate,
    this.minimumDate,
    this.maximumDate,
    this.rangeDate = true,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: TimePickerPopupMobile(
        rangeDate: rangeDate,
        onApplyClick: onApplyClick,
        onCancelClick: onCancelClick,
        initialStartDate: initialStartDate,
        initialEndDate: initialEndDate,
        maximumDate: maximumDate,
        minimumDate: minimumDate,
      ),
      desktopLayout: TimePickerPopupDesktop(
        rangeDate: rangeDate,
        onApplyClick: onApplyClick,
        onCancelClick: onCancelClick,
        initialStartDate: initialStartDate,
        initialEndDate: initialEndDate,
        maximumDate: maximumDate,
        minimumDate: minimumDate,
      ),
    );
  }
}

class TimePickerPopupMobile extends StatefulWidget {
  final Function(DateTime, DateTime) onApplyClick;

  final Function() onCancelClick;

  final DateTime? initialStartDate;

  final DateTime? initialEndDate;

  final DateTime? minimumDate;

  final DateTime? maximumDate;

  final bool rangeDate;

  const TimePickerPopupMobile({
    super.key,
    required this.onApplyClick,
    required this.onCancelClick,
    this.initialStartDate,
    this.initialEndDate,
    this.minimumDate,
    this.maximumDate,
    required this.rangeDate,
  });

  @override
  State<TimePickerPopupMobile> createState() => _TimePickerPopupMobileState();
}

class _TimePickerPopupMobileState extends State<TimePickerPopupMobile> {
  DateTime? startDate;

  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
      backgroundColor: R.palette.white,
      surfaceTintColor: R.palette.white,
      content: Builder(
        builder: (context) {
          return SizedBox(
            width: double.maxFinite,
            height: widget.rangeDate ? 0.8.sh : 0.6.sh,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      sl<Navigation>().goBack(context);
                    },
                    child: Image.asset(
                      R.assets.graphics.cross.path,
                      height: 16.h,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: CalendarPicker(
                    minimumDate: widget.minimumDate,
                    maximumDate: widget.maximumDate,
                    initialEndDate: widget.initialEndDate,
                    initialStartDate: widget.initialStartDate,
                    rangeDate: widget.rangeDate,
                    startEndDateChange:
                        (DateTime startDateData, DateTime endDateData) {
                      setState(() {
                        startDate = startDateData;
                        endDate = endDateData;
                      });
                    },
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 164.w,
                      height: 58.h,
                      child: GenericButton(
                        onPressed: () {
                          widget.onCancelClick();
                          Navigator.pop(context);
                        },
                        text: AppLocalizations.of(context).cancel,
                        fontSize: 14,
                        fontWeightT: FontWeight.w500,
                        buttonTextColor: R.palette.appGreyTextColor,
                        color: R.palette.disableButtonColor,
                      ),
                    ),
                    SizedBox(
                      width: 164.w,
                      height: 58.h,
                      child: GenericButton(
                        onPressed: () {
                          try {
                            widget.onApplyClick(startDate!, endDate!);
                            Navigator.pop(context);
                          } catch (_) {}
                        },
                        text: AppLocalizations.of(context).choose_date,
                        fontSize: 14,
                        fontWeightT: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TimePickerPopupDesktop extends StatefulWidget {
  final Function(DateTime, DateTime) onApplyClick;

  final Function() onCancelClick;

  final DateTime? initialStartDate;

  final DateTime? initialEndDate;

  final DateTime? minimumDate;

  final DateTime? maximumDate;

  final bool rangeDate;

  const TimePickerPopupDesktop({
    super.key,
    required this.onApplyClick,
    required this.onCancelClick,
    this.initialStartDate,
    this.initialEndDate,
    this.minimumDate,
    this.maximumDate,
    required this.rangeDate,
  });

  @override
  State<TimePickerPopupDesktop> createState() => _TimePickerPopupDesktopState();
}

class _TimePickerPopupDesktopState extends State<TimePickerPopupDesktop> {
  DateTime? startDate;

  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: R.palette.white,
      surfaceTintColor: R.palette.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
        child: SizedBox(
          width: 0.45.sw,
          height: 0.55.sh,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    sl<Navigation>().goBack(context);
                  },
                  child: Image.asset(
                    R.assets.graphics.cross.path,
                    height: 15.h,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              CalendarPicker(
                rangeDate: widget.rangeDate,
                initialEndDate: widget.initialEndDate,
                initialStartDate: widget.initialStartDate,
                minimumDate: widget.minimumDate,
                maximumDate: widget.maximumDate,
                startEndDateChange:
                    (DateTime startDateData, DateTime endDateData) {
                  setState(() {
                    startDate = startDateData;
                    endDate = endDateData;
                  });
                },
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 164,
                      height: 58.h,
                      child: GenericButton(
                        onPressed: () {
                          widget.onCancelClick();
                          Navigator.pop(context);
                        },
                        text: AppLocalizations.of(context).cancel,
                        fontSize: 22,
                        fontWeightT: FontWeight.w500,
                        buttonTextColor: R.palette.appGreyTextColor,
                        color: R.palette.disableButtonColor,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      width: 164,
                      height: 58.h,
                      child: GenericButton(
                        onPressed: () {
                          try {
                            widget.onApplyClick(startDate!, endDate!);
                            Navigator.pop(context);
                          } catch (_) {}
                        },
                        text: AppLocalizations.of(context).choose_date,
                        fontSize: 22,
                        fontWeightT: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<DateTimeRange?> showDateRangeCalenderPicker({
  required BuildContext context,
  DateTime? initialStartDate,
  DateTime? initialEndDate,
  DateTime? minimumDate,
  DateTime? maximumDate,
}) async {
  DateTimeRange? pickedDate;
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return TimePickerPopup(
          minimumDate: minimumDate,
          maximumDate: maximumDate,
          initialStartDate: initialStartDate,
          initialEndDate: initialEndDate,
          onApplyClick: (startDate, endDate) {
            DateTimeRange date = DateTimeRange(start: startDate, end: endDate);
            pickedDate = date;
          },
          onCancelClick: () {});
    },
  );
  return pickedDate;
}

Future<DateTime?> showDateCalenderPicker({
  required BuildContext context,
  DateTime? initialStartDate,
  DateTime? minimumDate,
  DateTime? maximumDate,
}) async {
  DateTime? pickedDate;
  await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return TimePickerPopup(
            rangeDate: false,
            minimumDate: minimumDate,
            maximumDate: maximumDate,
            initialStartDate: initialStartDate,
            onApplyClick: (startDate, endDate) {
              pickedDate = startDate;
            },
            onCancelClick: () {});
      });
  return pickedDate;
}
